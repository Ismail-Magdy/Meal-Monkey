import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:meal_monkey/core/themes/app_colors.dart";

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isRounded;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isRounded,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 45.h,
        decoration: BoxDecoration(
          color: isRounded ? Colors.white : AppColors.primary,
          borderRadius: BorderRadius.circular(40.sp),
          border: isRounded
              ? Border.all(color: AppColors.primary, width: 1)
              : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isRounded ? AppColors.primary : Colors.white,
            fontSize: 16.sp,
            fontFamily: "Metropolis",
          ),
        ),
      ),
    );
  }
}
