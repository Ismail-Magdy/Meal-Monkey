import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/core/themes/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscuretext;

  const CustomTextField({
    super.key,
    required this.hint,
    this.controller,
    this.keyboardType,
    this.obscuretext = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305.w,
      height: 49.h,
      decoration: BoxDecoration(
        color: AppColors.textfield,
        borderRadius: BorderRadius.circular(50.sp),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 38),
        child: Center(
          child: TextFormField(
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Enter ${widget.hint}";
              }
              return null;
            },
            controller: widget.controller,
            obscureText: widget.obscuretext,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: widget.hint,
              hintStyle: TextStyle(
                color: AppColors.placeholder,
                fontFamily: "Metropolis",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
