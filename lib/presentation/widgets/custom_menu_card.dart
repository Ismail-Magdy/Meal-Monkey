import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/presentation/core/app_colors.dart';

class CustomMenuCard extends StatelessWidget {
  final double fromTop;
  final String mealName;
  final String numberOfItems;
  final String image;
  final VoidCallback onPressed;

  const CustomMenuCard({
    super.key,
    required this.fromTop,
    required this.mealName,
    required this.numberOfItems,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Positioned(
      top: fromTop,
      left: 60,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          //
          Container(
            width: 280.w,
            height: 71.h,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  offset: Offset(3, 3),
                  blurStyle: BlurStyle.normal,
                  color: Colors.grey,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                topLeft: Radius.circular(40),
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                SizedBox(width: width * .2),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mealName,
                      style: TextStyle(
                        fontFamily: "Metropolis",
                        color: AppColors.primaryText,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      numberOfItems,
                      style: TextStyle(
                        color: AppColors.placeholder,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Metropolis",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //
          //Image
          Positioned(
            left: -40,
            child: Image.asset(
              image,
              width: 80.w,
              height: 80.h,
              fit: BoxFit.contain,
            ),
          ),
          //
          // Arrow
          Positioned(
            right: -19,
            top: 21.5.h,
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              child: IconButton(
                onPressed: onPressed,
                icon: Image.asset(
                  "assets/images/btn_next.png",
                  width: 13.w,
                  height: 13.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
