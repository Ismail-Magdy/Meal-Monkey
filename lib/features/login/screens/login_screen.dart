import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/core/themes/app_colors.dart';
import 'package:meal_monkey/features/login/widgets/auth_text.dart';
import 'package:meal_monkey/features/forgot_password/screens/reset_password_screen.dart';
import 'package:meal_monkey/features/sign_up/screens/sign_up_screen.dart';
import 'package:meal_monkey/features/sign_up/widgets/two_auth_text.dart';
import 'package:meal_monkey/features/splashs/screens/splash_screen.dart';
import 'package:meal_monkey/core/widgets/custom_button.dart';
import 'package:meal_monkey/core/widgets/custom_icon_button.dart';
import 'package:meal_monkey/core/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  //
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    txtEmail.dispose();
    txtPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 21.w),
          child: Form(
            key: _globalKey,
            child: Column(
              children: [
                SizedBox(height: height * .07),
                // Login Text
                const AuthText(title: "Login"),
                //
                SizedBox(height: height * .008),
                // Second Text
                Text(
                  "Add your details to login",
                  style: TextStyle(color: AppColors.secondaryText),
                ),
                //
                SizedBox(height: height * .04),
                // Email
                CustomTextField(
                  hint: "Your Email",
                  controller: txtEmail,
                  keyboardType: TextInputType.emailAddress,
                ),
                //
                SizedBox(height: height * .035),
                // Password
                CustomTextField(
                  hint: "Password",
                  controller: txtPassword,
                  obscuretext: true,
                ),
                //
                SizedBox(height: height * .035),
                // Login Button
                CustomButton(
                  text: "Login",
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SplashScreen()),
                      );
                    } else {
                      return;
                    }
                  },
                  isRounded: false,
                ),
                //
                SizedBox(height: height * .017),
                // Forgot Password Text
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResetPasswordScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(
                      fontSize: 12.5.sp,
                      color: AppColors.secondaryText,
                      fontFamily: "Metropolis",
                    ),
                  ),
                ),
                //
                SizedBox(height: height * .035),
                // or Login With
                Text(
                  "or Login With",
                  style: TextStyle(
                    fontSize: 12.5.sp,
                    color: AppColors.secondaryText,
                    fontFamily: "Metropolis",
                  ),
                ),
                //
                SizedBox(height: height * .035),
                // Facebook
                CustomIconButton(
                  fontSize: 12.5.sp,
                  isMobile: true,
                  text: "Login with Facebook",
                  image: "assets/images/facebook_logo.png",
                  color: AppColors.facebookicon,
                  onPressed: () {},
                ),
                //
                SizedBox(height: height * .035),
                // Google
                CustomIconButton(
                  fontSize: 12.5.sp,
                  isMobile: true,
                  text: "Login with Google",
                  image: "assets/images/google_logo.png",
                  color: AppColors.googleicon,
                  onPressed: () {},
                ),
                //
                SizedBox(height: height * .11),
                // Two Texts
                TwoAuthText(
                  leftText: "Don't have an account? ",
                  rightText: "Sign Up",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
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
// 348