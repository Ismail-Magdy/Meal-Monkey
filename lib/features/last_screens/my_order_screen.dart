import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_monkey/core/models/my_order_model.dart';
import 'package:meal_monkey/core/themes/app_colors.dart';
import 'package:meal_monkey/features/last_screens/check_out_screen.dart';
import 'package:meal_monkey/core/widgets/custom_app_bar_without_cart.dart';
import 'package:meal_monkey/core/widgets/custom_button.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  // List My Order
  List<MyOrderModel> myOrder = [
    MyOrderModel(title: "Beef Burger x1", price: 16),
    MyOrderModel(title: "Classic Burger x1", price: 25),
    MyOrderModel(title: "Cheese Chicken Burger x1", price: 29),
    MyOrderModel(title: "Chicken Legs Basket x1", price: 32),
    MyOrderModel(title: "French Fries Large x1", price: 10),
  ];
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar
      appBar: CustomAppBarWithoutCart(text: "My Order"),
      //
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            //  First Row
            child: Row(
              children: [
                // Image
                Image.asset(
                  "assets/images/shop_logo.png",
                  width: 85.w,
                  height: 85.h,
                ),
                //
                SizedBox(width: 15.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //
                    Text(
                      "King Burgers",
                      style: TextStyle(
                        fontFamily: "Metropolis",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryText,
                      ),
                    ),
                    //
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/svgs/star.svg",
                          width: 15.w,
                          height: 15.h,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          "4.9",
                          style: TextStyle(
                            fontFamily: "Metropolis",
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          "(124 ratings)",
                          style: TextStyle(
                            fontFamily: "Metropolis",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondaryText,
                          ),
                        ),
                      ],
                    ),
                    //
                    SizedBox(height: 1.h),
                    //
                    Text(
                      "Burger . Western Food",
                      style: TextStyle(
                        fontFamily: "Metropolis",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryText,
                      ),
                    ),
                    //
                    SizedBox(height: 3.h),
                    //
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/location-pin.png",
                          width: 13.5.w,
                          height: 13.5.h,
                        ),
                        //
                        SizedBox(width: 5.w),
                        //
                        Text(
                          "No 03, 4th Benha, Egypt",
                          style: TextStyle(
                            fontFamily: "Metropolis",
                            fontSize: 12.sp,
                            color: AppColors.secondaryText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            //
          ),
          //
          SizedBox(height: 25.h),
          // List Food
          SizedBox(
            height: 230.h,
            child: ListView.separated(
              itemCount: myOrder.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  height: 45.h,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 243, 241, 241),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          myOrder[index].title,
                          style: TextStyle(
                            fontFamily: "Metropolis",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryText,
                          ),
                        ),
                        Text(
                          "\$${myOrder[index].price.toString()}",
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
                );
              },
              separatorBuilder: (context, index) {
                return Divider(color: Colors.grey, height: 1);
              },
            ),
          ),
          //
          //
          Container(
            width: double.infinity,
            height: 40.h,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery Instrusctions",
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText,
                    ),
                  ),
                  Text(
                    "+ Add Notes",
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //
          Divider(color: Colors.grey, indent: 20.w, endIndent: 20.w),
          //
          //
          Container(
            width: double.infinity,
            height: 40.h,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sub Total",
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText,
                    ),
                  ),
                  Text(
                    "\$112",
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //
          //
          Container(
            width: double.infinity,
            height: 40.h,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery Cost",
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText,
                    ),
                  ),
                  Text(
                    "\$2",
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //
          Divider(color: Colors.grey, indent: 20.w, endIndent: 20.w),
          //
          Container(
            width: double.infinity,
            height: 40.h,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText,
                    ),
                  ),
                  Text(
                    "\$114",
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //
          Spacer(),
          // Button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomButton(
              text: "Checkout",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckOutScreen()),
                );
              },
              isRounded: false,
            ),
          ),
          //
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
