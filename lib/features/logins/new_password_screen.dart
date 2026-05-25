import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/core/themes/app_colors.dart';
import 'package:meal_monkey/features/splash/first_screen.dart';
import 'package:meal_monkey/core/widgets/custom_button.dart';
import 'package:meal_monkey/core/widgets/custom_text_field.dart';
import 'package:meal_monkey/core/helpers/responsive_widget.dart';

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
        child: ResponsiveWidget(
          // Mobile Size
          mobile: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: Column(
                children: [
                  SizedBox(height: height * .07),
                  // New Text
                  Text(
                    "New Password",
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
                    "Please enter a new password",
                    style: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 12.5.sp,
                      fontFamily: "Metropolis",
                    ),
                  ),
                  //
                  SizedBox(height: height * .045),
                  //
                  CustomTextField(
                    hint: "New Password",
                    controller: password,
                    obscuretext: true,
                  ),
                  SizedBox(height: height * .03),
                  CustomTextField(
                    hint: "Confirm Password",
                    controller: confirmpassword,
                    obscuretext: true,
                  ),
                  SizedBox(height: height * .03),
                  CustomButton(
                    isMobile: true,
                    text: "Next",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FirstScreen()),
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
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: Column(
                children: [
                  SizedBox(height: height * .07),
                  // New Text
                  Text(
                    "New Password",
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 10.sp,
                      fontFamily: "Metropolis",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * .037),
                  // Second Text
                  Text(
                    textAlign: TextAlign.center,
                    "Please enter a new password",
                    style: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 5.sp,
                      fontFamily: "Metropolis",
                    ),
                  ),
                  //
                  SizedBox(height: height * .045),
                  //
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 70.w),
                    child: CustomTextField(
                      hint: "New Password",
                      controller: password,
                      obscuretext: true,
                    ),
                  ),
                  //
                  SizedBox(height: height * .03),
                  //
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 70.w),
                    child: CustomTextField(
                      hint: "Confirm Password",
                      controller: confirmpassword,
                      obscuretext: true,
                    ),
                  ),
                  //
                  SizedBox(height: height * .03),
                  //
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 70.w),
                    child: CustomButton(
                      isMobile: false,
                      text: "Next",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FirstScreen(),
                          ),
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
