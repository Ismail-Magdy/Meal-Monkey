import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/presentation/core/app_colors.dart';

class CustomNavigation extends StatelessWidget {
  final VoidCallback onTap;
  final String image;
  final String text;
  final bool isSelected;
  const CustomNavigation({
    super.key,
    required this.onTap,
    required this.image,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            width: 15.w,
            height: 15.h,
            color: isSelected ? AppColors.primary : AppColors.placeholder,
          ),
          SizedBox(height: height * .004),
          Text(
            text,
            style: TextStyle(
              color: isSelected ? AppColors.primary : AppColors.placeholder,
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
              fontFamily: "Metropolis",
            ),
          ),
        ],
      ),
    );
  }
}
