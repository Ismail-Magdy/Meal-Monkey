import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/presentation/core/app_colors.dart';
import 'package:meal_monkey/presentation/screens/last_screens/more_screen.dart';
import 'package:meal_monkey/presentation/screens/main/main_view.dart';
import 'package:meal_monkey/presentation/screens/main/menu_screen.dart';
import 'package:meal_monkey/presentation/screens/main/offers_screen.dart';
import 'package:meal_monkey/presentation/screens/last_screens/profile_screen.dart';
import 'package:meal_monkey/presentation/widgets/custom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTap = 2;
  PageStorageBucket storageBucket = PageStorageBucket();
  Widget selectedPageView = const MainView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: storageBucket, child: selectedPageView),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      // floating
      // home Button
      floatingActionButton: SizedBox(
        height: 65.h,
        width: 65.w,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: selectedTap == 2
              ? AppColors.primary
              : AppColors.placeholder,
          onPressed: () {
            if (selectedTap != 2) {
              selectedTap = 2;
              selectedPageView = const MainView();
            }
            if (mounted) {
              setState(() {});
            }
          },
          child: Image.asset(
            "assets/images/tab_home.png",
            width: 30.w,
            height: 30.h,
          ),
        ),
      ),
      //Navigation bar
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.white,
        notchMargin: 15,
        elevation: 1,
        color: Colors.white,
        shadowColor: Colors.black12,
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //
                CustomNavigation(
                  onTap: () {
                    if (selectedTap != 0) {
                      selectedTap = 0;
                      selectedPageView = const MenuScreen();
                    }
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  image: "assets/images/tab_menu.png",
                  text: "Menu",
                  isSelected: selectedTap == 0,
                ),
                //
                CustomNavigation(
                  onTap: () {
                    if (selectedTap != 1) {
                      selectedTap = 1;
                      selectedPageView = const OffersScreen();
                    }
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  image: "assets/images/tab_offer.png",
                  text: "Offer",
                  isSelected: selectedTap == 1,
                ),
                //
                CustomNavigation(
                  onTap: () {
                    if (selectedTap != 3) {
                      selectedTap = 3;
                      selectedPageView = const ProfileScreen();
                    }
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  image: "assets/images/tab_profile.png",
                  text: "Profile",
                  isSelected: selectedTap == 3,
                ),
                //
                CustomNavigation(
                  onTap: () {
                    if (selectedTap != 4) {
                      selectedTap = 4;
                      selectedPageView = const MoreScreen();
                    }
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  image: "assets/images/tab_more.png",
                  text: "More",
                  isSelected: selectedTap == 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
