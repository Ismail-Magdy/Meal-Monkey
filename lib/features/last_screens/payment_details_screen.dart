import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/core/themes/app_colors.dart';
import 'package:meal_monkey/features/last_screens/add_card_view.dart';
import 'package:meal_monkey/core/widgets/custom_app_bar_with_arrow.dart';
import 'package:meal_monkey/core/widgets/custom_button.dart';

class PaymentDetailsScreen extends StatefulWidget {
  const PaymentDetailsScreen({super.key});

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  bool isRemove = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBarWithArrow(title: "Payment Details"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * .015),
            // First Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Customize your payment method",
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText,
                    ),
                  ),
                ],
              ),
            ),
            //
            SizedBox(height: height * .01),
            // First Divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: Colors.grey),
            ),
            //
            SizedBox(height: height * .018),
            // Custom Container
            Material(
              elevation: 15,
              child: Container(
                width: 350.w,
                height: 155.h,
                decoration: BoxDecoration(color: Color(0xffF7F7F7)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      SizedBox(height: 15.h),
                      // Text And Check
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Cash/Card on delivery",
                            style: TextStyle(
                              fontFamily: "Metropolis",
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryText,
                            ),
                          ),
                          Spacer(),
                          Image.asset(
                            "assets/images/check.png",
                            width: 18.w,
                            height: 18.h,
                          ),
                        ],
                      ),
                      //
                      SizedBox(height: 2.h),
                      //
                      Divider(color: Colors.grey),
                      //
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/images/visa_icon.png",
                            width: 70.w,
                            height: 40.h,
                          ),
                          //
                          Text(
                            "**** **** **** 2187",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Metropolis",
                              fontSize: 10.sp,
                            ),
                          ),
                          //
                          // Delete Card Button
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.w),
                            width: 90.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.primary,
                                width: 2,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                "Delete Card",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Metropolis",
                                ),
                              ),
                            ),
                          ),
                          //
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Divider(color: Colors.grey),
                      //
                      SizedBox(height: 5.h),
                      // Other Methods Text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Other Methods",
                            style: TextStyle(
                              fontFamily: "Metropolis",
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryText,
                            ),
                          ),
                        ],
                      ),
                      //
                      //
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 55.h),
            // Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: CustomButton(
                text: "+ Add another Credit/Debit Card",
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.r),
                      ),
                    ),
                    builder: (context) {
                      return AddCardView();
                    },
                  );
                },
                isRounded: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
