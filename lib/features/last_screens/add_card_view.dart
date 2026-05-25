import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/core/themes/app_colors.dart';
import 'package:meal_monkey/core/widgets/custom_icon_button.dart';
import 'package:meal_monkey/core/widgets/custom_text_field.dart';

class AddCardView extends StatefulWidget {
  const AddCardView({super.key});

  @override
  State<AddCardView> createState() => _AddCardViewState();
}

class _AddCardViewState extends State<AddCardView> {
  TextEditingController cardNameController = TextEditingController();
  TextEditingController securityCodeController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  bool isRemove = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: 560.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
        ),
        child: Column(
          children: [
            // X Mark
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      CupertinoIcons.xmark,
                      size: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Add Card Text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Text(
                    "Add Credit/Debit Card",
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Metropolis",
                    ),
                  ),
                ],
              ),
            ),
            //
            SizedBox(height: 10.h),
            // Divider
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Divider(color: Colors.grey),
            ),
            //
            SizedBox(height: 10.h),
            // Text Field Card Number
            CustomTextField(
              controller: cardNameController,
              hint: "Card Number",
              keyboardType: TextInputType.number,
            ),
            //
            SizedBox(height: 20.h),
            // Expiry
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Expiry",
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Metropolis",
                    ),
                  ),
                  // Month
                  Container(
                    width: 90.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      color: AppColors.textfield,
                      borderRadius: BorderRadius.circular(50.sp),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 38),
                      child: Center(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "MM",
                            hintStyle: TextStyle(
                              color: AppColors.placeholder,
                              fontFamily: "Metropolis",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Year
                  Container(
                    width: 100.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      color: AppColors.textfield,
                      borderRadius: BorderRadius.circular(50.sp),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 38),
                      child: Center(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "YYYY",
                            hintStyle: TextStyle(
                              color: AppColors.placeholder,
                              fontFamily: "Metropolis",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //
                ],
              ),
            ),
            //
            SizedBox(height: 20.h),
            // Text Field Security Code
            CustomTextField(
              controller: securityCodeController,
              hint: "Security Code",
              keyboardType: TextInputType.number,
            ),
            //
            SizedBox(height: 20.h),
            // Text Field First Name
            CustomTextField(
              controller: firstNameController,
              hint: "First Name",
              keyboardType: TextInputType.name,
            ),
            //
            SizedBox(height: 20.h),
            // Text Field Last Name
            CustomTextField(
              controller: lastNameController,
              hint: "Last Name",
              keyboardType: TextInputType.name,
            ),
            //
            SizedBox(height: 25.h),
            // Last Row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "You can remove this card\nat anytime",
                    style: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 13.5.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Metropolis",
                    ),
                  ),
                  //
                  //
                  Switch(
                    activeThumbColor: Colors.white,
                    activeTrackColor: AppColors.primary,
                    inactiveThumbColor: AppColors.primary,
                    inactiveTrackColor: Colors.white,
                    value: isRemove,
                    onChanged: (value) {
                      setState(() {
                        isRemove = value;
                      });
                    },
                  ),
                  //
                ],
              ),
            ),
            Spacer(),
            // Buttom
            CustomIconButton(
              fontSize: 14.sp,
              text: "Add Card",
              image: "assets/images/add.png",
              color: AppColors.primary,
              onPressed: () {},
              isMobile: true,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
