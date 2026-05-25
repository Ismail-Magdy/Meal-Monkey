import 'package:flutter/material.dart';
import 'package:meal_monkey/core/themes/app_colors.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class CustomOtp extends StatelessWidget {
  const CustomOtp({super.key, required this.customKey});
  final Key customKey;

  @override
  Widget build(BuildContext context) {
    return OtpPinField(
      key: customKey,
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
      mainAxisAlignment: MainAxisAlignment.center,
      otpPinFieldDecoration: OtpPinFieldDecoration.defaultPinBoxDecoration,
    );
    //
  }
}
