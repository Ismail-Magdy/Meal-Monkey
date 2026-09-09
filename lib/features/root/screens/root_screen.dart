import 'package:flutter/material.dart';
import 'package:glass_bottom_navigation_bar/glass_bottom_navigation_bar.dart';
import 'package:meal_monkey/core/themes/app_colors.dart';
import 'package:meal_monkey/features/last_screens/more_screen.dart';
import 'package:meal_monkey/features/home/screens/home_screen.dart';
import 'package:meal_monkey/features/menu/screens/menu_screen.dart';
import 'package:meal_monkey/features/offers/screens/offers_screen.dart';
import 'package:meal_monkey/features/profile/screens/profile_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedTap = 2;
  final PageStorageBucket storageBucket = PageStorageBucket();

  final List<Widget> pages = const [
    MenuScreen(),
    OffersScreen(),
    HomeScreen(),
    ProfileScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageStorage(bucket: storageBucket, child: pages[selectedTap]),
      bottomNavigationBar: GlassBottomNavigationBar(
        currentIndex: selectedTap,
        enableHapticFeedback: true,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.placeholder,

        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),

        onTap: (index) {
          setState(() {
            selectedTap = index;
          });
        },
        items: [
          BottomNavigationBarItemData(
            icon: const ImageIcon(
              AssetImage("assets/images/tab_menu.png"),
              size: 22,
            ),
            label: "Menu",
          ),
          BottomNavigationBarItemData(
            icon: const ImageIcon(
              AssetImage("assets/images/tab_offer.png"),
              size: 20,
            ),
            label: "Offer",
          ),
          BottomNavigationBarItemData(
            icon: const ImageIcon(
              AssetImage("assets/images/tab_home.png"),
              size: 20,
            ),
            label: "Home",
          ),
          BottomNavigationBarItemData(
            icon: const ImageIcon(
              AssetImage("assets/images/tab_profile.png"),
              size: 20,
            ),
            label: "Profile",
          ),
          BottomNavigationBarItemData(
            icon: const ImageIcon(
              AssetImage("assets/images/tab_more.png"),
              size: 20,
            ),
            label: "More",
          ),
        ],
      ),
    );
  }
}
