import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/data/models/payment_card_model.dart';
import 'package:meal_monkey/presentation/core/app_colors.dart';
import 'package:meal_monkey/presentation/screens/last_screens/add_card_view.dart';
import 'package:meal_monkey/presentation/screens/last_screens/change_screen_address.dart';
import 'package:meal_monkey/presentation/screens/last_screens/custom_bottom_sheet_check_out.dart';
import 'package:meal_monkey/presentation/widgets/custom_app_bar_without_cart.dart';
import 'package:meal_monkey/presentation/widgets/custom_button.dart';
import 'package:meal_monkey/presentation/widgets/custom_payment_card.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  // List Of Payment Methods
  List<PaymentCardModel> paymentsMethod = [
    PaymentCardModel(image: "assets/images/cash.png", text: "Cash on delivery"),
    PaymentCardModel(
      image: "assets/images/visa_icon.png",
      text: "**** **** **** 2187",
    ),
    PaymentCardModel(
      image: "assets/images/paypal.png",
      text: "ismail@gmail.com",
    ),
  ];
  //
  int? selectedMethod;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textfield,
      appBar: CustomAppBarWithoutCart(text: "Check Out"),
      body: Column(
        children: [
          // First
          Container(
            width: double.infinity,
            height: 90.h,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                //
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Text(
                        "Delivery Address",
                        style: TextStyle(
                          color: AppColors.secondaryText,
                          fontSize: 12.sp,
                          fontFamily: "Metropolis",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                //
                SizedBox(height: 10.h),
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Text(
                        "653 Nostrand Ave.,\nBrooklyn, NY 11216",
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 14.sp,
                          fontFamily: "Metropolis",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    //
                    Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChangeAddressScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Change",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 12.sp,
                            fontFamily: "Metropolis",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //
              ],
            ),
          ),
          //
          SizedBox(height: 10.h),
          // Second
          Container(
            width: double.infinity,
            height: 215.h,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                SizedBox(height: 18.h),
                //
                // Text Poyment Method
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Text(
                        "Payment method",
                        style: TextStyle(
                          color: AppColors.secondaryText,
                          fontSize: 13.sp,
                          fontFamily: "Metropolis",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    //
                    Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: GestureDetector(
                        onTap: () => showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.r),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            return AddCardView();
                          },
                        ),
                        child: Text(
                          "+ Add Card",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 12.sp,
                            fontFamily: "Metropolis",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //
                SizedBox(height: 15.h),
                // Three Payment Methods
                SizedBox(
                  height: 155.h,
                  child: ListView.builder(
                    itemCount: paymentsMethod.length,
                    itemBuilder: (context, index) {
                      return CustomPaymentCard(
                        onPressed: () {
                          setState(() {
                            selectedMethod = index;
                          });
                        },
                        image: paymentsMethod[index].image,
                        text: paymentsMethod[index].text,
                        icon: selectedMethod == index
                            ? Icon(
                                Icons.radio_button_checked,
                                color: AppColors.primary,
                              )
                            : Icon(Icons.radio_button_off),
                      );
                    },
                  ),
                ),
                //
              ],
            ),
          ),
          //
          SizedBox(height: 10.h),
          // Third
          Material(
            elevation: 15.h,
            child: Container(
              width: double.infinity,
              height: 152.h,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Text(
                          "Sub Total",
                          style: TextStyle(
                            color: AppColors.secondaryText,
                            fontSize: 13.sp,
                            fontFamily: "Metropolis",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //
                      Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: Text(
                          "\$68",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 12.sp,
                            fontFamily: "Metropolis",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //
                  SizedBox(height: 15.h),
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Text(
                          "Delivery Cost",
                          style: TextStyle(
                            color: AppColors.secondaryText,
                            fontSize: 13.sp,
                            fontFamily: "Metropolis",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //
                      Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: Text(
                          "\$2",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 12.sp,
                            fontFamily: "Metropolis",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //
                  SizedBox(height: 15.h),
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Text(
                          "Discount",
                          style: TextStyle(
                            color: AppColors.secondaryText,
                            fontSize: 13.sp,
                            fontFamily: "Metropolis",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //
                      Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: Text(
                          "\$6-",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 12.sp,
                            fontFamily: "Metropolis",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //
                  SizedBox(height: 8.h),
                  Divider(color: Colors.grey, endIndent: 20.w, indent: 20.w),
                  //
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Text(
                          "Total",
                          style: TextStyle(
                            color: AppColors.secondaryText,
                            fontSize: 13.sp,
                            fontFamily: "Metropolis",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //
                      Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: Text(
                          "\$64",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 12.sp,
                            fontFamily: "Metropolis",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //
                ],
              ),
            ),
          ),
          //
          SizedBox(height: 45.h),
          //
          //  Button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomButton(
              text: "Send order",
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.r),
                    ),
                  ),
                  context: context,
                  builder: (context) {
                    return CustomBottomSheetCheckOut();
                  },
                );
              },
              isRounded: false,
              isMobile: true,
            ),
          ),
          //
        ],
      ),
    );
  }
}
