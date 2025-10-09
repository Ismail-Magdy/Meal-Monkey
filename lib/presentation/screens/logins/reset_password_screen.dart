import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/presentation/core/app_colors.dart';
import 'package:meal_monkey/presentation/screens/logins/otp_screen.dart';
import 'package:meal_monkey/presentation/widgets/custom_button.dart';
import 'package:meal_monkey/presentation/widgets/custom_text_field.dart';
import 'package:meal_monkey/responsive/responsive_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: ResponsiveWidget(
          // Mobile Size
          mobile: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: Column(
                children: [
                  SizedBox(height: height * .07),
                  // Reset Text
                  Text(
                    "Reset Password",
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 29.sp,
                      fontFamily: "Metropolis",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * .037),
                  // Second Text
                  Text(
                    textAlign: TextAlign.center,
                    "Please enter your email to receive a\nslink to create a new password via email",
                    style: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 12.5.sp,
                      fontFamily: "Metropolis",
                    ),
                  ),
                  //
                  SizedBox(height: height * .07),
                  //
                  CustomTextField(
                    hint: "Email",
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: height * .04),
                  CustomButton(
                    isMobile: true,
                    text: "Send",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OtpScreen()),
                      );
                    },
                    isRounded: false,
                  ),
                ],
              ),
            ),
          ),
          // Desktop Size
          desktop: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.w),
              child: Column(
                children: [
                  SizedBox(height: height * .07),
                  // Reset Text
                  Text(
                    "Reset Password",
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 12.sp,
                      fontFamily: "Metropolis",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * .037),
                  // Second Text
                  Text(
                    textAlign: TextAlign.center,
                    "Please enter your email to receive a\nslink to create a new password via email",
                    style: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 7.sp,
                      fontFamily: "Metropolis",
                    ),
                  ),
                  //
                  SizedBox(height: height * .07),
                  //
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 70.w),
                    child: CustomTextField(
                      hint: "Email",
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  //
                  SizedBox(height: height * .04),
                  //
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 70.w),
                    child: CustomButton(
                      isMobile: false,
                      text: "Send",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OtpScreen()),
                        );
                      },
                      isRounded: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
