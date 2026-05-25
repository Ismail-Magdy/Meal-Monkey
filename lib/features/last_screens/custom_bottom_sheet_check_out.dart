import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/core/themes/app_colors.dart';
import 'package:meal_monkey/features/root/screens/root_screen.dart';
import 'package:meal_monkey/core/widgets/custom_button.dart';

class CustomBottomSheetCheckOut extends StatelessWidget {
  const CustomBottomSheetCheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 560.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
      ),
      child: Column(
        children: [
          SizedBox(height: 25.h),
          // Image
          Image.asset(
            "assets/images/thank_you.png",
            width: 225.w,
            height: 250.h,
          ),
          //
          SizedBox(height: 17.h),
          // Thank You
          Text(
            "Thank You!",
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 25.sp,
              fontFamily: "Metropolis",
              fontWeight: FontWeight.bold,
            ),
          ),
          //
          // Your Order
          Text(
            "for your order",
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 15.sp,
              fontFamily: "Metropolis",
              fontWeight: FontWeight.bold,
            ),
          ),
          //
          SizedBox(height: 15.h),
          //
          // Your Order
          Text(
            textAlign: TextAlign.center,
            maxLines: 3,
            "Your Order is now being processed. We will let you\nknow once the order is picked from the outlet.\nCheck the status of your Order",
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 12.sp,
              fontFamily: "Metropolis",
            ),
          ),
          //
          SizedBox(height: 25.h),
          // Button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomButton(
              text: "Track my order",
              onPressed: () {},
              isRounded: false,
            ),
          ),
          //
          SizedBox(height: 20.h),
          // Back To Home
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => RootScreen()),
                (route) => false,
              );
            },
            child: Text(
              textAlign: TextAlign.center,
              "Back To Home",
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 15.sp,
                fontFamily: "Metropolis",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //
        ],
      ),
    );
  }
}
