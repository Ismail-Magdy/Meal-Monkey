import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/core/themes/app_colors.dart';

class TwoAuthText extends StatelessWidget {
  const TwoAuthText({
    super.key,
    required this.leftText,
    required this.rightText,
    required this.onTap,
  });
  final String leftText;
  final String rightText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          leftText,
          style: TextStyle(fontSize: 12.sp, color: AppColors.secondaryText),
        ),

        GestureDetector(
          onTap: onTap,
          child: Text(
            rightText,
            style: TextStyle(
              fontSize: 13.sp,
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
