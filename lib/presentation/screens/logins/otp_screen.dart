import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/presentation/core/app_colors.dart';
import 'package:meal_monkey/presentation/screens/logins/new_password_screen.dart';
import 'package:meal_monkey/presentation/widgets/custom_button.dart';
import 'package:meal_monkey/responsive/responsive_widget.dart';
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
        child: ResponsiveWidget(
          // Mobile Size
          mobile: Center(
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
                      fontFamily: "Metropolis",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                  SizedBox(height: height * .045),

                  // Otp Field
                  OtpPinField(
                    key: _otpPinFieldController,
                    autoFillEnable: true,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    autoFocus: true,
                    showDefaultKeyboard: true,

                    // showCustomKeyboard: true,
                    onSubmit: (text) {
                      debugPrint('Entered pin is $text');
                    },
                    onChange: (text) {
                      debugPrint('Enter on change pin is $text');
                    },
                    onCodeChanged: (code) {
                      debugPrint('onCodeChanged  is $code');
                    },
                    otpPinFieldStyle: OtpPinFieldStyle(
                      // showHintText: true,
                      // hintText: "*",
                      defaultFieldBorderColor: Colors.transparent,
                      activeFieldBorderColor: Colors.transparent,
                      defaultFieldBackgroundColor: AppColors.textfield,
                      activeFieldBackgroundColor: AppColors.textfield,
                      fieldBorderWidth: 3,
                    ),
                    maxLength: 4,
                    showCursor: true,
                    cursorColor: Colors.indigo,
                    upperChild: const Column(
                      children: [
                        SizedBox(height: 30),
                        Icon(Icons.flutter_dash_outlined, size: 150),
                        SizedBox(height: 20),
                      ],
                    ),

                    cursorWidth: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    otpPinFieldDecoration:
                        OtpPinFieldDecoration.defaultPinBoxDecoration,
                    //OtpPinFieldDecoration.roundedPinBoxDecoration,
                  ),

                  SizedBox(height: height * .04),
                  //
                  CustomButton(
                    isMobile: true,
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
                  SizedBox(height: height * .045),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't Receive?",
                        style: TextStyle(
                          fontSize: 12.5.sp,
                          color: AppColors.secondaryText,
                          fontFamily: "Metropolis",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Click Here",
                          style: TextStyle(
                            fontSize: 13.5.sp,
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Metropolis",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Desktop Size
          desktop: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: Column(
                children: [
                  SizedBox(height: height * .07),
                  // Otp Text
                  Text(
                    textAlign: TextAlign.center,
                    "We have sent an OTP to your Mobile",
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 10.sp,
                      fontFamily: "Metropolis",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * .02),
                  // Second Text
                  Text(
                    textAlign: TextAlign.center,
                    "Please check your mobile number 071*****12\ncontinue to reset your password",
                    style: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 5.sp,
                      fontFamily: "Metropolis",
                    ),
                  ),
                  SizedBox(height: height * .045),
                  // Otp Field
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100.w),
                    child: OtpPinField(
                      key: _otpPinFieldController,
                      autoFillEnable: true,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      autoFocus: true,
                      showDefaultKeyboard: true,
                      onSubmit: (text) {
                        debugPrint('Entered pin is $text');
                      },
                      onChange: (text) {
                        debugPrint('Enter on change pin is $text');
                      },
                      onCodeChanged: (code) {
                        debugPrint('onCodeChanged  is $code');
                      },
                      otpPinFieldStyle: OtpPinFieldStyle(
                        defaultFieldBorderColor: Colors.transparent,
                        activeFieldBorderColor: Colors.transparent,
                        defaultFieldBackgroundColor: AppColors.textfield,
                        activeFieldBackgroundColor: AppColors.textfield,
                        fieldBorderWidth: 3,
                      ),
                      maxLength: 4,
                      showCursor: true,
                      cursorColor: Colors.indigo,
                      upperChild: const Column(
                        children: [
                          SizedBox(height: 30),
                          Icon(Icons.flutter_dash_outlined, size: 150),
                          SizedBox(height: 20),
                        ],
                      ),

                      cursorWidth: 3,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      otpPinFieldDecoration:
                          OtpPinFieldDecoration.defaultPinBoxDecoration,
                      //OtpPinFieldDecoration.roundedPinBoxDecoration,
                    ),
                  ),
                  SizedBox(height: height * .04),
                  //
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100.w),
                    child: CustomButton(
                      isMobile: false,
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
                  ),
                  //
                  SizedBox(height: height * .045),
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't Receive?",
                        style: TextStyle(
                          fontSize: 5.sp,
                          color: AppColors.secondaryText,
                          fontFamily: "Metropolis",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Click Here",
                          style: TextStyle(
                            fontSize: 5.5.sp,
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Metropolis",
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
      ),
    );
  }
}
