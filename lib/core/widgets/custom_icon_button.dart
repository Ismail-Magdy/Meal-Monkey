import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconButton extends StatelessWidget {
  final String text;
  final String image;
  final Color color;
  final VoidCallback onPressed;
  final bool isMobile;
  final double fontSize;
  const CustomIconButton({
    super.key,
    required this.text,
    required this.image,
    required this.color,
    required this.onPressed,
    required this.isMobile,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: 320.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: color,

          borderRadius: BorderRadius.circular(40.sp),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 20.h, width: 20.w, fit: BoxFit.contain),
            SizedBox(width: width * .05),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: isMobile ? fontSize.sp : fontSize.sp,
                fontFamily: "Metropolis",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
