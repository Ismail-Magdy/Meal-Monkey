import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/core/themes/app_colors.dart';
import 'package:meal_monkey/features/login/widgets/auth_text.dart';
import 'package:meal_monkey/features/splashs/screens/splash_screen.dart';
import 'package:meal_monkey/core/widgets/custom_button.dart';
import 'package:meal_monkey/core/widgets/custom_text_field.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<NewPasswordScreen> {
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
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
                // New Text
                AuthText(title: "New Password"),
                //
                SizedBox(height: height * .037),
                // Second Text
                Text(
                  textAlign: TextAlign.center,
                  "Please enter a new password",
                  style: TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: 12.5.sp,
                    fontFamily: "Metropolis",
                  ),
                ),
                //
                SizedBox(height: height * .045),
                // New Password Text Field
                CustomTextField(
                  hint: "New Password",
                  controller: password,
                  obscuretext: true,
                ),
                //
                SizedBox(height: height * .03),
                // Confirm Password Text Field
                CustomTextField(
                  hint: "Confirm Password",
                  controller: confirmpassword,
                  obscuretext: true,
                ),
                //
                SizedBox(height: height * .03),
                // Next Button
                CustomButton(
                  text: "Next",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SplashScreen()),
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
// 160