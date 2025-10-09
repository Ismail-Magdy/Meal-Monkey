import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/presentation/core/app_colors.dart';

class CustomPaymentCard extends StatefulWidget {
  final String image;
  final String text;
  final Widget icon;
  final VoidCallback onPressed;

  const CustomPaymentCard({
    super.key,
    required this.image,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  State<CustomPaymentCard> createState() => _CustomPaymentCardState();
}

class _CustomPaymentCardState extends State<CustomPaymentCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40.h,
          padding: EdgeInsets.only(left: 18.w),
          margin: EdgeInsets.symmetric(horizontal: 19.w),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Row(
            children: [
              Image.asset(widget.image, width: 40.w, height: 40.h),
              //
              SizedBox(width: 15.w),
              //
              Text(
                widget.text,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 13.sp,
                  fontFamily: "Metropolis",
                  fontWeight: FontWeight.bold,
                ),
              ),
              //
              Spacer(),
              //
              IconButton(onPressed: widget.onPressed, icon: widget.icon),
            ],
          ),
        ),
        SizedBox(height: 11.h),
      ],
    );
    //
  }
}
