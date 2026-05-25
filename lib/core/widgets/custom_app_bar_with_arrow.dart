import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/core/themes/app_colors.dart';
import 'package:meal_monkey/features/last_screens/my_order_screen.dart';

class CustomAppBarWithArrow extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  const CustomAppBarWithArrow({super.key, required this.title});

  @override
  Size get preferredSize => Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: SizedBox.shrink(),
      leadingWidth: 0,

      title: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, size: 20.sp),
          ),
          Text(
            title,
            style: TextStyle(
              fontFamily: "Metropolis",
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyOrderScreen()),
            ),
            child: Image.asset(
              "assets/images/shopping_cart.png",
              width: 20.w,
              height: 20.h,
            ),
          ),
        ],
      ),
    );
  }
}
