import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/core/themes/app_colors.dart';
import 'package:meal_monkey/features/main/menu_desert_screen.dart';
import 'package:meal_monkey/core/widgets/custom_app_bar.dart';
import 'package:meal_monkey/core/widgets/custom_menu_card.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  TextEditingController txtSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(title: "Menu", isMobile: true),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: height * .02),
                // Text Field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Container(
                    width: double.infinity,
                    height: 43.h,
                    decoration: BoxDecoration(
                      color: AppColors.textfield,
                      borderRadius: BorderRadius.circular(50.sp),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Center(
                        child: TextField(
                          controller: txtSearch,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            icon: Image.asset(
                              "assets/images/search.png",
                              width: 20.w,
                              height: 20.h,
                            ),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Search food",
                            hintStyle: TextStyle(color: AppColors.placeholder),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //
                SizedBox(height: height * .035),

                // Stack One
                SizedBox(
                  height: 430.h,
                  child: Stack(
                    children: [
                      // Orange Shape
                      Positioned(
                        left: -40,

                        child: Container(
                          height: 425.h,
                          width: 130.w,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),

                      //
                    ],
                  ),
                ),
              ],
            ),
            //
            // Custom Container One
            CustomMenuCard(
              fromTop: 130,
              mealName: "Food",
              numberOfItems: "120 Items",
              image: "assets/images/menu_1.png",
              onPressed: () {},
            ),
            // Custom Container Two
            CustomMenuCard(
              fromTop: 260,
              mealName: "Beverages",
              numberOfItems: "132 Items",
              image: "assets/images/menu_2.png",
              onPressed: () {},
            ),
            // Custom Container Three
            CustomMenuCard(
              fromTop: 390,
              mealName: "Desserts",
              numberOfItems: "155 Items",
              image: "assets/images/menu_3.png",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuDesertScreen()),
                );
              },
            ),
            // Custom Container Four
            CustomMenuCard(
              fromTop: 520,
              mealName: "Promotions",
              numberOfItems: "25 Items",
              image: "assets/images/menu_4.png",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
