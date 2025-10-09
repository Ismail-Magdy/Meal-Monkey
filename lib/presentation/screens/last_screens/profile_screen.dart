import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meal_monkey/logic/cubit/image_storage_cubit.dart';
import 'package:meal_monkey/logic/cubit/image_storage_state.dart';
import 'package:meal_monkey/presentation/core/app_colors.dart';
import 'package:meal_monkey/presentation/widgets/custom_app_bar.dart';
import 'package:meal_monkey/presentation/widgets/custom_button.dart';
import 'package:meal_monkey/presentation/widgets/custom_title_text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> _pickImage(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      context.read<ImageStorageCubit>().pickImage(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: "Profile", isMobile: true),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: height * .03),
              Stack(
                children: [
                  BlocBuilder<ImageStorageCubit, ImageStorageState>(
                    builder: (context, state) {
                      if (state is ImageLoaded) {
                        return CircleAvatar(
                          radius: 60,
                          backgroundImage: FileImage(state.image),
                        );
                      }
                      return const CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(
                          "assets/images/default_user.jpg",
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: height * .02),
              // Text Edit Profile
              GestureDetector(
                onTap: () => _pickImage(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit, color: AppColors.primary, size: 14.sp),
                    SizedBox(width: width * .01),
                    Text(
                      "Edit Profile",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 10.sp,
                        fontFamily: "Metropolis",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * .01),
              // Text Ismail
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: width * .0115),
                  Text(
                    "Hi there Ismail!",
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Metropolis",
                    ),
                  ),
                ],
              ),
              //
              SizedBox(height: height * .01),
              // Sign Out
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Sign Out",
                  style: TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              //
              SizedBox(height: height * .03),
              // Custom One
              CustomTitleTextField(
                controller: nameController,
                hint: "Enter Name",
                title: "name",
                iseye: false,
              ),
              //
              SizedBox(height: height * .02),
              // Custom Two
              CustomTitleTextField(
                controller: emailController,
                hint: "Enter Email",
                title: "email",
                iseye: false,
              ),
              //
              SizedBox(height: height * .02),
              // Custom Three
              CustomTitleTextField(
                controller: phoneNumberController,
                iseye: false,
                keyboardType: TextInputType.phone,
                hint: "Enter Phone Number",
                title: "phone number",
              ),
              //
              SizedBox(height: height * .02),
              // Custom Four
              CustomTitleTextField(
                controller: addressController,
                hint: "Enter Address",
                title: "address",
                iseye: false,
              ),
              //
              SizedBox(height: height * .02),
              // Custom Fife
              CustomTitleTextField(
                controller: passwordController,
                obscuretext: true,
                hint: "Enter Password",
                title: "password",
                iseye: true,
              ),
              //
              SizedBox(height: height * .02),
              // Custom Six
              CustomTitleTextField(
                controller: confirmPasswordController,
                obscuretext: true,
                hint: "Confirm Password",
                title: "confirm",
                iseye: true,
              ),
              //
              SizedBox(height: height * .025),
              // Custom Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomButton(
                  isMobile: true,
                  text: "Save",
                  onPressed: () {},
                  isRounded: false,
                ),
              ),
              SizedBox(height: height * .05),
            ],
          ),
        ),
      ),
    );
  }
}
