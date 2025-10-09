import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:meal_monkey/presentation/core/app_colors.dart";

// enum RoundedButtonType { bgPrimary, textPrimary }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isRounded;
  final bool isMobile;
  //  final RoundedButtonType type;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isRounded,
    required this.isMobile,
    // this.type = RoundedButtonType.bgPrimary,
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
            fontSize: isMobile ? 13.sp : 8.sp,
            fontFamily: "Metropolis",
          ),
        ),
      ),
    );
  }
}
