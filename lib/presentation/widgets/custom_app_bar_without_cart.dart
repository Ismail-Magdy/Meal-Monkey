import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/presentation/core/app_colors.dart';

class CustomAppBarWithoutCart extends StatelessWidget
    implements PreferredSizeWidget {
  final String text;
  const CustomAppBarWithoutCart({super.key, required this.text});
  @override
  Size get preferredSize => Size.fromHeight(50);
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
            text,
            style: TextStyle(
              fontFamily: "Metropolis",
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ),
        ],
      ),
    );
  }
}
