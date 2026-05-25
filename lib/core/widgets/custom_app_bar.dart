import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/core/themes/app_colors.dart';
import 'package:meal_monkey/features/last_screens/my_order_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isMobile;
  const CustomAppBar({super.key, required this.title, required this.isMobile});

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: SizedBox.shrink(),
      leadingWidth: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: "Metropolis",
              fontSize: isMobile ? 19.sp : 5.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyOrderScreen()),
            ),
            child: Image.asset(
              "assets/images/shopping_cart.png",
              width: isMobile ? 20.w : 15.w,
              height: isMobile ? 20.h : 15.h,
            ),
          ),
        ],
      ),
    );
  }
}
