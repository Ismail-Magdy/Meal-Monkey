import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/core/themes/app_colors.dart';
import 'package:meal_monkey/features/forgot_password/screens/new_password_screen.dart';
import 'package:meal_monkey/core/widgets/custom_button.dart';
import 'package:meal_monkey/features/otp/widgets/custom_otp.dart';
import 'package:meal_monkey/features/sign_up/widgets/two_auth_text.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.w),
            child: Column(
              children: [
                SizedBox(height: height * .07),
                // Otp Text
                Text(
                  textAlign: TextAlign.center,
                  "We have sent an OTP to your Mobile",
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 27.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //
                SizedBox(height: height * .02),
                // Second Text
                Text(
                  textAlign: TextAlign.center,
                  "Please check your mobile number 071*****12\ncontinue to reset your password",
                  style: TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: 12.5.sp,
                    fontFamily: "Metropolis",
                  ),
                ),
                //
                SizedBox(height: height * .045),
                // Otp Field
                CustomOtp(customKey: _otpPinFieldController),
                //
                SizedBox(height: height * .04),
                //
                CustomButton(
                  text: "Next",
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewPasswordScreen(),
                      ),
                    );
                  },
                  isRounded: false,
                ),
                //
                SizedBox(height: height * .045),
                //
                TwoAuthText(
                  leftText: "Didn't Receive?",
                  rightText: "Click Here",
                  onTap: () {},
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
// 277