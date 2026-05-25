import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_monkey/core/models/second_meal_model.dart';
import 'package:meal_monkey/core/themes/app_colors.dart';
import 'package:meal_monkey/core/widgets/custom_app_bar.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  //
  List<SecondMealModel> offers = [
    SecondMealModel(
      image: "assets/images/offer_1.png",
      name: "Café de Noir",
      rate: "4.9",
      rateCount: "(124 ratings)",
      text: "Western Food",
      type: "Café",
    ),
    SecondMealModel(
      image: "assets/images/offer_2.png",
      name: "Isso",
      rate: "4.8",
      rateCount: "(132 ratings)",
      text: "Western Food",
      type: "Café",
    ),
    SecondMealModel(
      image: "assets/images/offer_3.png",
      name: "Cafe Bead",
      rate: "4.7",
      rateCount: "(145 ratings)",
      text: "Western Food",
      type: "Café",
    ),
  ];
  //
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: "Latest Offers", isMobile: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // First Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Find discounts, Offers special\nmeals and more!",
                    style: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 13.sp,
                      fontFamily: "Metropolis",
                    ),
                  ),
                ],
              ),
            ),
            //
            SizedBox(height: height * .018),
            // Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MaterialButton(
                    color: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(20),
                    ),
                    minWidth: 150.w,
                    textColor: Colors.white,
                    height: 31.h,
                    onPressed: () {},
                    child:
                        //
                        Text(
                          "Check Offers",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: "Metropolis",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * .018),
            // List
            Column(
              children: List.generate(offers.length, (index) {
                return SizedBox(
                  width: double.infinity,

                  child: Column(
                    children: [
                      SizedBox(child: Image.asset(offers[index].image)),
                      SizedBox(height: height * .01),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              offers[index].name,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/svgs/star.svg",
                                  width: 15.w,
                                  height: 15.h,
                                ),
                                SizedBox(width: width * .015),
                                Text(
                                  offers[index].rate,
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                SizedBox(width: width * .015),
                                Text(
                                  offers[index].rateCount,
                                  style: TextStyle(
                                    color: AppColors.secondaryText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                SizedBox(width: width * .015),
                                Text(
                                  offers[index].type,
                                  style: TextStyle(
                                    color: AppColors.secondaryText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.sp,
                                  ),
                                ),
                                SizedBox(width: width * .05),
                                Text(
                                  offers[index].text,
                                  style: TextStyle(
                                    color: AppColors.secondaryText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                );
              }),
            ),
            //
          ],
        ),
      ),
    );
  }
}
