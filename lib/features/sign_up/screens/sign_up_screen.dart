import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/core/themes/app_colors.dart';
import 'package:meal_monkey/features/login/screens/login_screen.dart';
import 'package:meal_monkey/core/widgets/custom_button.dart';
import 'package:meal_monkey/core/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobileno = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  dispose() {
    name.dispose();
    email.dispose();
    mobileno.dispose();
    address.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 21.w),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: height * .07),
                // Sign up Text
                Text(
                  "Sign Up",
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 29.sp,
                    fontFamily: "Metropolis",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //
                SizedBox(height: height * .008),
                // Second Text
                Text(
                  "Add your details to Sign Up",
                  style: TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: 12.5.sp,
                    fontFamily: "Metropolis",
                  ),
                ),
                //
                SizedBox(height: height * .045),
                // Name Field
                CustomTextField(
                  hint: "Name",
                  controller: name,
                  keyboardType: TextInputType.name,
                ),
                //
                SizedBox(height: height * .035),
                // Email Field
                CustomTextField(
                  hint: "Email",
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                ),
                //
                SizedBox(height: height * .035),
                CustomTextField(
                  hint: "Mobile No",
                  controller: mobileno,
                  keyboardType: TextInputType.number,
                ),
                //
                SizedBox(height: height * .035),
                // Address Field
                CustomTextField(
                  hint: "Address",
                  controller: address,
                  keyboardType: TextInputType.streetAddress,
                ),
                //
                SizedBox(height: height * .035),
                // Password Field
                CustomTextField(
                  hint: "Password",
                  controller: password,
                  obscuretext: true,
                ),
                //
                SizedBox(height: height * .035),
                // Confirm Password Field
                CustomTextField(
                  hint: "Confirm Password",
                  controller: confirmPassword,
                  obscuretext: true,
                ),
                //
                SizedBox(height: height * .035),
                // Sign Up Button
                CustomButton(
                  text: "Sign Up",
                  onPressed: () {},
                  isRounded: false,
                ),
                //
                SizedBox(height: height * .02),
                // Two Texts
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an Account?",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.secondaryText,
                        fontFamily: "Metropolis",
                      ),
                    ),
                    // Last Text in Screen
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 13.sp,
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
    );
  }
}
// 294