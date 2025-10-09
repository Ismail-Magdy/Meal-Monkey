import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/presentation/core/app_colors.dart';

class CustomTitleTextField extends StatefulWidget {
  final String hint;
  final String title;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscuretext;
  //
  final bool iseye;
  final bool eye;
  const CustomTitleTextField({
    super.key,
    required this.hint,
    this.controller,
    this.keyboardType,
    required this.iseye,
    this.eye = false,
    this.obscuretext = false,
    required this.title,
  });

  @override
  State<CustomTitleTextField> createState() => _CustomTitleTextFieldState();
}

class _CustomTitleTextFieldState extends State<CustomTitleTextField> {
  TextEditingController controller = TextEditingController();
  bool eye = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: 305.w,
      height: 46.25.h,
      decoration: BoxDecoration(
        color: AppColors.textfield,
        borderRadius: BorderRadius.circular(50.sp),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 35),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Stack(
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //
                Column(
                  children: [
                    SizedBox(height: height * .005),
                    TextField(
                      controller: controller,
                      obscureText: eye ? false : widget.obscuretext,
                      keyboardType: widget.keyboardType,
                      decoration: InputDecoration(
                        suffixIcon: widget.iseye
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    eye = !eye;
                                  });
                                },
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  size: 18.sp,
                                  color: eye ? AppColors.primary : Colors.grey,
                                ),
                              )
                            : null,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: widget.hint,
                        hintStyle: TextStyle(
                          color: AppColors.placeholder,
                          fontFamily: "Metropolis",
                          fontSize: 11.5.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
