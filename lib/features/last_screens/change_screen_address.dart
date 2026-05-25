import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meal_monkey/core/themes/app_colors.dart';
import 'package:meal_monkey/core/widgets/custom_app_bar_without_cart.dart';

class ChangeAddressScreen extends StatefulWidget {
  const ChangeAddressScreen({super.key});

  @override
  State<ChangeAddressScreen> createState() => _ChangeAddressScreenState();
}

class _ChangeAddressScreenState extends State<ChangeAddressScreen> {
  final TextEditingController searchController = TextEditingController();
  GoogleMapController? _controller;
  List<MarkerData> _customMarkers = [];
  List<dynamic> _suggestions = [];
  // ignore: unused_field
  bool _isSearching = false;

  static const String apiKey = "YOUR_API_KEY_HERE"; // ضع مفتاحك هنا

  CameraPosition _initialCamera = const CameraPosition(
    target: LatLng(30.0444, 31.2357), // القاهرة كافتراضي
    zoom: 13.5,
  );

  @override
  void initState() {
    super.initState();
    _initUserLocation(); // ✅ استدعاء الموقع فور فتح الشاشة
  }

  // ======== جلب موقع المستخدم وتشغيل الماركر تلقائيًا ========
  Future<void> _initUserLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("من فضلك فعّل خدمة الموقع (GPS)")),
        );
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("تم رفض إذن الموقع")));
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("إذن الموقع مرفوض بشكل دائم")),
        );
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final userLocation = LatLng(position.latitude, position.longitude);

      if (!mounted) return;

      setState(() {
        _initialCamera = CameraPosition(target: userLocation, zoom: 17);
        _customMarkers = [
          MarkerData(
            marker: Marker(
              markerId: const MarkerId('current-location'),
              position: userLocation,
            ),
            child: _customMarker("You are here", Colors.green),
          ),
        ];
      });

      _controller?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: userLocation, zoom: 17),
        ),
      );
    } catch (e) {
      if (kDebugMode) print("Location Error: $e");
    }
  }

  // ======== البحث التلقائي (Autocomplete) ========
  Future<void> _getSuggestions(String input) async {
    if (input.isEmpty) {
      setState(() => _suggestions = []);
      return;
    }

    try {
      final dio = Dio();
      final response = await dio.get(
        "https://maps.googleapis.com/maps/api/place/autocomplete/json",
        queryParameters: {
          "input": input,
          "key": apiKey,
          "components": "country:eg", // يركّز على مصر
        },
      );

      if (response.data["status"] == "OK") {
        setState(() {
          _suggestions = response.data["predictions"];
        });
      } else {
        setState(() => _suggestions = []);
      }
    } catch (e) {
      if (kDebugMode) print("Autocomplete error: $e");
    }
  }

  // ======== البحث عن موقع ========
  Future<void> _searchLocation(String query) async {
    if (query.isEmpty) return;

    try {
      setState(() => _isSearching = true);
      final dio = Dio();
      final response = await dio.get(
        "https://maps.googleapis.com/maps/api/geocode/json",
        queryParameters: {"address": query, "key": apiKey},
      );

      final data = response.data;
      if (data['status'] == 'OK') {
        final location = data['results'][0]['geometry']['location'];
        final lat = location['lat'];
        final lng = location['lng'];
        final newPosition = LatLng(lat, lng);

        setState(() {
          _customMarkers = [
            MarkerData(
              marker: Marker(
                markerId: const MarkerId('searched-location'),
                position: newPosition,
              ),
              child: _customMarker(query, Colors.blueAccent),
            ),
          ];
          _suggestions.clear();
        });

        _controller?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: newPosition, zoom: 14),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Location not found: ${data['status']}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    } finally {
      setState(() => _isSearching = false);
    }
  }

  // ======== تصميم الماركر ========
  static Column _customMarker(String text, Color color) {
    return Column(
      children: [
        Image.asset("assets/images/location-pin.png", width: 40.w),
        if (text.isNotEmpty)
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithoutCart(text: "Change Address"),
      body: Stack(
        children: [
          CustomGoogleMapMarkerBuilder(
            screenshotDelay: const Duration(seconds: 1),
            customMarkers: _customMarkers,
            builder: (BuildContext context, Set<Marker>? markers) {
              if (markers == null) {
                return const Center(child: CircularProgressIndicator());
              }
              return GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _initialCamera,
                markers: markers,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                gestureRecognizers: {
                  Factory<PanGestureRecognizer>(() => PanGestureRecognizer()),
                  Factory<ScaleGestureRecognizer>(
                    () => ScaleGestureRecognizer(),
                  ),
                  Factory<TapGestureRecognizer>(() => TapGestureRecognizer()),
                },
                onMapCreated: (GoogleMapController controller) {
                  _controller = controller;
                },
              );
            },
          ),

          // زر تحديد الموقع الحالي (تحديث)
          Positioned(
            bottom: 10.h,
            left: 15.w,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: _initUserLocation,
              child: Icon(
                Icons.my_location,
                color: AppColors.primary,
                size: 30.sp,
              ),
            ),
          ),

          // اقتراحات البحث
          if (_suggestions.isNotEmpty)
            Positioned(
              top: 90.h,
              left: 20.w,
              right: 20.w,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _suggestions.length,
                  itemBuilder: (context, index) {
                    final suggestion = _suggestions[index];
                    return ListTile(
                      title: Text(suggestion["description"]),
                      onTap: () {
                        searchController.text = suggestion["description"];
                        _searchLocation(suggestion["description"]);
                      },
                    );
                  },
                ),
              ),
            ),
        ],
      ),

      // ======== شريط البحث السفلي ========
      bottomNavigationBar: SingleChildScrollView(
        child: BottomAppBar(
          height: 125.h,
          color: Colors.grey.shade200,
          child: Column(
            children: [
              SizedBox(height: 5.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  width: double.infinity,
                  height: 43.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.sp),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Center(
                      child: TextField(
                        controller: searchController,
                        onChanged: _getSuggestions,
                        onSubmitted: _searchLocation,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          icon: Image.asset(
                            "assets/images/search.png",
                            width: 20.w,
                            height: 20.h,
                          ),
                          border: InputBorder.none,
                          hintText: "Search Address",
                          hintStyle: const TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.w),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/fav_icon.png",
                      width: 30.w,
                      height: 30.h,
                    ),
                    SizedBox(width: 20.w),
                    Text(
                      "Choose a saved place",
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Metropolis",
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios, size: 20.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
