import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/core/themes/app_colors.dart';
import 'package:meal_monkey/features/login/widgets/auth_text.dart';
import 'package:meal_monkey/features/otp/otp_screen.dart';
import 'package:meal_monkey/core/widgets/custom_button.dart';
import 'package:meal_monkey/core/widgets/custom_text_field.dart';

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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: Column(
              children: [
                SizedBox(height: height * .07),
                // Reset Text
                AuthText(title: "Reset Password"),
                //
                SizedBox(height: height * .037),
                // Second Text
                Text(
                  textAlign: TextAlign.center,
                  "Please enter your email to receive a\nslink to create a new password via email",
                  style: TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: 12.5.sp,
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
                //
                SizedBox(height: height * .04),
                // Send Button
                CustomButton(
                  text: "Send",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OtpScreen()),
                    );
                  },
                  isRounded: false,
                ),
                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// 75