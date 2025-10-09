import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/presentation/core/app_colors.dart';
import 'package:meal_monkey/presentation/screens/last_screens/my_order_screen.dart';
import 'package:meal_monkey/responsive/responsive_widget.dart';

class ItemDetailsScreen extends StatefulWidget {
  final String image;
  final String name;
  const ItemDetailsScreen({super.key, required this.image, required this.name});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  double rating = 4;
  int numberOfOrder = 0;
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ResponsiveWidget(
        // Mobile Size
        mobile: Stack(
          children: [
            // Background Image
            Image.asset(
              widget.image,
              width: double.maxFinite,
              height: 210.h,
              fit: BoxFit.cover,
            ),

            // Top Shadow
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black, Colors.black12, Colors.transparent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            // Fake App Bar
            Column(
              children: [
                SizedBox(height: height * .045),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 20.sp,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyOrderScreen(),
                          ),
                        ),
                        child: Image.asset(
                          "assets/images/shopping_cart.png",
                          width: 20.w,
                          height: 20.h,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Bottom Container
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 510.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height * .043),

                        // ================= Column One (ثابت) =================
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Name
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Text(
                                widget.name,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Metropolis",
                                ),
                              ),
                            ),

                            // Rating + Price
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RatingBar.builder(
                                        textDirection: TextDirection.ltr,
                                        itemSize: 20.sp,
                                        initialRating: 4,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: const EdgeInsets.symmetric(
                                          horizontal: .5,
                                        ),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: AppColors.primary,
                                        ),
                                        onRatingUpdate: (newRating) {
                                          setState(() => rating = newRating);
                                        },
                                      ),
                                      SizedBox(height: height * .002),
                                      Text(
                                        "$rating Star Ratings",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Metropolis",
                                          color: AppColors.primary,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Rs. 750",
                                        style: TextStyle(
                                          color: AppColors.primaryText,
                                          fontSize: 26.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Metropolis",
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(width: width * .1),
                                          Text(
                                            "/ per Portion",
                                            style: TextStyle(
                                              color: AppColors.primaryText,
                                              fontFamily: "Metropolis",
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // Description
                            SizedBox(height: height * .02),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Text(
                                "Description",
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Metropolis",
                                ),
                              ),
                            ),
                            SizedBox(height: height * .003),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Text(
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                "Lorem ipsum dolor sit amet, consectetur adipiscing\nOrnare leo non mollis cursus. Eu euismod faucibusin\nleo malesuada",
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontSize: 12.sp,
                                  fontFamily: "Metropolis",
                                ),
                              ),
                            ),
                            SizedBox(height: height * .01),
                            // Divider
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: height * .01),

                        // ================= Column Two (Scrollable) =================
                        Expanded(
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Customize Title
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                  ),
                                  child: Text(
                                    "Customize your Order",
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Metropolis",
                                    ),
                                  ),
                                ),
                                SizedBox(height: height * .02),
                                // Dropdown One
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 350.w,
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                        color: AppColors.textfield,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          hint: Padding(
                                            padding: EdgeInsets.only(
                                              left: 30.w,
                                              right: 90.w,
                                            ),
                                            child: Text(
                                              "- Select size of portion -",
                                              style: TextStyle(
                                                color: AppColors.primaryText,
                                                fontSize: 13.sp,
                                                fontFamily: "Metropolis",
                                              ),
                                            ),
                                          ),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            size: 15.sp,
                                          ),
                                          items:
                                              [
                                                "Chocolate",
                                                "Vanilla",
                                                "Strawberry",
                                              ].map((e) {
                                                return DropdownMenuItem(
                                                  value: e,
                                                  child: Text(
                                                    e,
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.primaryText,
                                                      fontSize: 13.sp,
                                                      fontFamily: "Metropolis",
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                          onChanged: (value) {},
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: height * .02),
                                // Dropdown Two
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 350.w,
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                        color: AppColors.textfield,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          hint: Padding(
                                            padding: EdgeInsets.only(
                                              left: 30.w,
                                              right: 90.w,
                                            ),
                                            child: Text(
                                              "- Select the ingredients -",
                                              style: TextStyle(
                                                color: AppColors.primaryText,
                                                fontSize: 13.sp,
                                                fontFamily: "Metropolis",
                                              ),
                                            ),
                                          ),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            size: 15.sp,
                                          ),
                                          items:
                                              [
                                                "Chocolate",
                                                "Vanilla",
                                                "Strawberry",
                                              ].map((e) {
                                                return DropdownMenuItem(
                                                  value: e,
                                                  child: Text(
                                                    e,
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.primaryText,
                                                      fontSize: 13.sp,
                                                      fontFamily: "Metropolis",
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                          onChanged: (value) {},
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: height * .03),
                                // Number of Portions
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Number of Portions",
                                        style: TextStyle(
                                          color: AppColors.primaryText,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Metropolis",
                                        ),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (numberOfOrder > 0) {
                                              numberOfOrder--;
                                            }
                                          });
                                        },
                                        child: Container(
                                          height: 27.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                            color: AppColors.primary,
                                            borderRadius: BorderRadius.circular(
                                              25.r,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.remove,
                                            size: 15.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: width * .01),
                                      Container(
                                        height: 27.h,
                                        width: 50.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            25.r,
                                          ),
                                          border: Border.all(
                                            color: AppColors.primary,
                                            width: 2.w,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            numberOfOrder.toString(),
                                            style: TextStyle(
                                              color: AppColors.primary,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: width * .01),
                                      GestureDetector(
                                        onTap: () =>
                                            setState(() => numberOfOrder++),
                                        child: Container(
                                          height: 27.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                            color: AppColors.primary,
                                            borderRadius: BorderRadius.circular(
                                              25,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            size: 15.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: height * .035),
                                // Add to Cart Section
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      height: 180.h,
                                      width: 97.w,
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(45),
                                          bottomRight: Radius.circular(45),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: -260,
                                      left: 55,
                                      top: 33,
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Container(
                                            width: 277.w,
                                            height: 130.h,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(50),
                                                bottomLeft: Radius.circular(50),
                                                bottomRight: Radius.circular(
                                                  15,
                                                ),
                                                topRight: Radius.circular(15),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(0, 3),
                                                  blurRadius: 10,
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              children: [
                                                SizedBox(height: height * .02),
                                                Text(
                                                  "Total Price",
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.primaryText,
                                                    fontSize: 18.sp,
                                                    fontFamily: "Metropolis",
                                                  ),
                                                ),
                                                Text(
                                                  "LKR ${numberOfOrder * 750}",
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.primaryText,
                                                    fontSize: 25.sp,
                                                    fontFamily: "Metropolis",
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 55,
                                                      ),
                                                  child: MaterialButton(
                                                    color: AppColors.primary,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            20,
                                                          ),
                                                    ),
                                                    minWidth: 185.w,
                                                    textColor: Colors.white,
                                                    height: 31.h,
                                                    onPressed: () {},
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Image.asset(
                                                          "assets/images/shopping_add.png",
                                                          width: 23.w,
                                                          height: 23.h,
                                                        ),
                                                        Text(
                                                          "Add to Cart",
                                                          style: TextStyle(
                                                            fontSize: 15.sp,
                                                            fontFamily:
                                                                "Metropolis",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            right: -25,
                                            top: 50,
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  AppColors.textfield,
                                              radius: 25,
                                              child: Image.asset(
                                                "assets/images/shopping_cart.png",
                                                width: 22.w,
                                                height: 22.h,
                                                color: AppColors.primary,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Favorite Button
                  Positioned(
                    top: -40,
                    right: 10,
                    child: isFav
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                isFav = !isFav;
                              });
                            },
                            child: Image.asset(
                              "assets/images/favorites_btn.png",
                              width: 70.w,
                              height: 70.h,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                isFav = !isFav;
                              });
                            },
                            child: Image.asset(
                              "assets/images/favorites_btn_2.png",
                              width: 70.w,
                              height: 70.h,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Desktop Size
        desktop: Stack(
          children: [
            // Background Image
            Image.asset(
              widget.image,
              width: double.maxFinite,
              height: 210.h,
              fit: BoxFit.cover,
            ),

            // Top Shadow
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black, Colors.black12, Colors.transparent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            // Fake App Bar
            Column(
              children: [
                SizedBox(height: height * .045),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 10.sp,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          "assets/images/shopping_cart.png",
                          width: 17.w,
                          height: 17.h,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Bottom Container
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 510.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.r),
                        topRight: Radius.circular(50.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height * .043),

                        // ================= Column One (ثابت) =================
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Name
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Text(
                                widget.name,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Metropolis",
                                ),
                              ),
                            ),
                            //
                            // Rating + Price
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RatingBar.builder(
                                        textDirection: TextDirection.ltr,
                                        itemSize: 9.sp,
                                        initialRating: 4,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: const EdgeInsets.symmetric(
                                          horizontal: .5,
                                        ),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: AppColors.primary,
                                        ),
                                        onRatingUpdate: (newRating) {
                                          setState(() => rating = newRating);
                                        },
                                      ),
                                      SizedBox(height: height * .002),
                                      Text(
                                        "$rating Star Ratings",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Metropolis",
                                          color: AppColors.primary,
                                          fontSize: 4.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Rs. 750",
                                        style: TextStyle(
                                          color: AppColors.primaryText,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Metropolis",
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(width: width * .1),
                                          Text(
                                            "/ per Portion",
                                            style: TextStyle(
                                              color: AppColors.primaryText,
                                              fontFamily: "Metropolis",
                                              fontSize: 4.5.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: height * .02),
                            // Description
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Text(
                                "Description",
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Metropolis",
                                ),
                              ),
                            ),
                            //
                            SizedBox(height: height * .003),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Text(
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                "Lorem ipsum dolor sit amet, consectetur adipiscing Ornare leo non mollis cursus. Eu euismod faucibusin\nleo malesuada",
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontSize: 5.sp,
                                  fontFamily: "Metropolis",
                                ),
                              ),
                            ),
                            SizedBox(height: height * .01),
                            // Divider
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey.shade300,
                              ),
                            ),
                            //
                          ],
                        ),
                        SizedBox(height: height * .01),
                        // ================= Column Two (Scrollable) =================
                        Expanded(
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Customize Title
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                  ),
                                  child: Text(
                                    "Customize your Order",
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontSize: 6.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Metropolis",
                                    ),
                                  ),
                                ),
                                SizedBox(height: height * .02),
                                // Dropdown One
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 50.w,
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 350.w,
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                        color: AppColors.textfield,
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          hint: Padding(
                                            padding: EdgeInsets.only(
                                              left: 30.w,
                                              right: 90.w,
                                            ),
                                            child: Text(
                                              "- Select the size of portion -",
                                              style: TextStyle(
                                                color: AppColors.primaryText,
                                                fontSize: 4.5.sp,
                                                fontFamily: "Metropolis",
                                              ),
                                            ),
                                          ),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            size: 10.sp,
                                          ),
                                          items: ["Small", "Medium", "Large"]
                                              .map((e) {
                                                return DropdownMenuItem(
                                                  value: e,
                                                  child: Text(
                                                    e,
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.primaryText,
                                                      fontSize: 13.sp,
                                                      fontFamily: "Metropolis",
                                                    ),
                                                  ),
                                                );
                                              })
                                              .toList(),
                                          onChanged: (value) {},
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //
                                SizedBox(height: height * .02),
                                // Dropdown Two
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 50.w,
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 350.w,
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                        color: AppColors.textfield,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          hint: Padding(
                                            padding: EdgeInsets.only(
                                              left: 30.w,
                                              right: 90.w,
                                            ),
                                            child: Text(
                                              "- Select the ingredients -",
                                              style: TextStyle(
                                                color: AppColors.primaryText,
                                                fontSize: 4.5.sp,
                                                fontFamily: "Metropolis",
                                              ),
                                            ),
                                          ),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            size: 10.sp,
                                          ),
                                          items:
                                              [
                                                "Chocolate",
                                                "Vanilla",
                                                "Strawberry",
                                              ].map((e) {
                                                return DropdownMenuItem(
                                                  value: e,
                                                  child: Text(
                                                    e,
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.primaryText,
                                                      fontSize: 13.sp,
                                                      fontFamily: "Metropolis",
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                          onChanged: (value) {},
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: height * .05),
                                // Number of Portions
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Number of Portions",
                                        style: TextStyle(
                                          color: AppColors.primaryText,
                                          fontSize: 6.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Metropolis",
                                        ),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (numberOfOrder > 0) {
                                              numberOfOrder--;
                                            }
                                          });
                                        },
                                        child: Container(
                                          height: 40.h,
                                          width: 40.w,
                                          decoration: BoxDecoration(
                                            color: AppColors.primary,
                                            borderRadius: BorderRadius.circular(
                                              25.r,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.remove,
                                            size: 7.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: width * .01),
                                      Container(
                                        height: 40.h,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            25,
                                          ),
                                          border: Border.all(
                                            color: AppColors.primary,
                                            width: 2,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            numberOfOrder.toString(),
                                            style: TextStyle(
                                              color: AppColors.primary,
                                              fontSize: 7.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: width * .01),
                                      GestureDetector(
                                        onTap: () =>
                                            setState(() => numberOfOrder++),
                                        child: Container(
                                          height: 40.h,
                                          width: 40.w,
                                          decoration: BoxDecoration(
                                            color: AppColors.primary,
                                            borderRadius: BorderRadius.circular(
                                              25,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            size: 7.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: height * .035),
                                // Add to Cart Section
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      height: 200.h,
                                      width: 97.w,
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(45),
                                          bottomRight: Radius.circular(45),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: -260,
                                      left: 70,
                                      top: 33,
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Container(
                                            width: 277.w,
                                            height: 150.h,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(50),
                                                bottomLeft: Radius.circular(50),
                                                bottomRight: Radius.circular(
                                                  15,
                                                ),
                                                topRight: Radius.circular(15),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(0, 3),
                                                  blurRadius: 10,
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              children: [
                                                SizedBox(height: height * .02),
                                                Text(
                                                  "Total Price",
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.primaryText,
                                                    fontSize: 7.sp,
                                                    fontFamily: "Metropolis",
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "LKR ${numberOfOrder * 750}",
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.primaryText,
                                                    fontSize: 5.sp,
                                                    fontFamily: "Metropolis",
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(height: 20.h),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 50.w,
                                                  ),
                                                  child: MaterialButton(
                                                    color: AppColors.primary,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            20.r,
                                                          ),
                                                    ),
                                                    //  minWidth: 100.w,
                                                    textColor: Colors.white,
                                                    height: 50.h,
                                                    onPressed: () {},
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Image.asset(
                                                          "assets/images/shopping_add.png",
                                                          width: 15.w,
                                                          height: 15.h,
                                                        ),
                                                        Text(
                                                          "Add to Cart",
                                                          style: TextStyle(
                                                            fontSize: 4.sp,
                                                            fontFamily:
                                                                "Metropolis",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            right: -25,
                                            top: 50,
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  AppColors.textfield,
                                              radius: 25,
                                              child: Image.asset(
                                                "assets/images/shopping_cart.png",
                                                width: 22.w,
                                                height: 22.h,
                                                color: AppColors.primary,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Favorite Button
                  Positioned(
                    top: -40,
                    right: 10,
                    child: isFav
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                isFav = !isFav;
                              });
                            },
                            child: Image.asset(
                              "assets/images/favorites_btn.png",
                              width: 70.w,
                              height: 70.h,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                isFav = !isFav;
                              });
                            },
                            child: Image.asset(
                              "assets/images/favorites_btn_2.png",
                              width: 70.w,
                              height: 70.h,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
