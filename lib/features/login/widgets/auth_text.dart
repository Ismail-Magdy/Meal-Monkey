import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/core/themes/app_colors.dart';

class AuthText extends StatelessWidget {
  const AuthText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 29.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
