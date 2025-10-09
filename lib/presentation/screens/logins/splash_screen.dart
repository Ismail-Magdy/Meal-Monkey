import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/presentation/core/app_colors.dart';
import 'package:meal_monkey/presentation/screens/logins/login_screen.dart';
import 'package:meal_monkey/presentation/screens/logins/sign_up_screen.dart';
import 'package:meal_monkey/presentation/widgets/custom_button.dart';
import 'package:meal_monkey/responsive/responsive_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: ResponsiveWidget(
          // Mobile Size
          mobile: Column(
            children: [
              // Stack
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  // Top Shape
                  Image.asset(
                    "assets/images/welcome_top_shape.png",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 430.h,
                  ),
                  // Logo
                  Image.asset(
                    "assets/images/app_logo.png",
                    width: 200.w,
                    height: 150.h,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              //
              SizedBox(height: height * .02),
              //Text
              Text(
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                "Discover the best foods from over 1,000\nrestaurants and fast delivery to your\ndoorstep",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.secondaryText,
                  fontFamily: "Metropolis",
                ),
              ),
              //
              SizedBox(height: height * .06),
              // Login Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.w),
                child: CustomButton(
                  isMobile: true,
                  text: "Login",
                  isRounded: false,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ),
              //
              SizedBox(height: height * .028),
              // Create account Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.w),
                child: CustomButton(
                  isMobile: true,
                  text: "Create an Account",
                  isRounded: true,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
          // Desktop Size
          desktop: Column(
            children: [
              // Stack
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  // Top Shape
                  Image.asset(
                    "assets/images/welcome_top_shape.png",
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: 400.h,
                  ),
                  // Logo
                  Image.asset(
                    "assets/images/app_logo.png",
                    width: 200.w,
                    height: 150.h,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              //
              SizedBox(height: height * .02),
              //Text
              Text(
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                "Discover the best foods from over 1,000\nrestaurants and fast delivery to your\ndoorstep",
                style: TextStyle(
                  fontSize: 5.sp,
                  color: AppColors.secondaryText,
                  fontFamily: "Metropolis",
                ),
              ),
              //
              SizedBox(height: height * .06),
              // Login Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100.w),
                child: CustomButton(
                  isMobile: false,
                  text: "Login",
                  isRounded: false,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ),
              //
              SizedBox(height: height * .028),
              // Create account Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100.w),
                child: CustomButton(
                  isMobile: false,

                  text: "Create an Account",
                  isRounded: true,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                ),
              ),
              SizedBox(height: height * .01),
            ],
          ),
        ),
      ),
    );
  }
}
