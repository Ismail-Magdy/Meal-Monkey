import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_monkey/core/models/second_meal_model.dart';
import 'package:meal_monkey/core/themes/app_colors.dart';
import 'package:meal_monkey/features/menu/screens/desert_details.dart';
import 'package:meal_monkey/core/widgets/custom_app_bar_with_arrow.dart';

class MenuDesertScreen extends StatefulWidget {
  const MenuDesertScreen({super.key});

  @override
  State<MenuDesertScreen> createState() => _MenuDesertScreenState();
}

class _MenuDesertScreenState extends State<MenuDesertScreen> {
  TextEditingController txtSearch = TextEditingController();
  //
  List<SecondMealModel> restraunt = [
    SecondMealModel(
      image: "assets/images/dess_1.png",
      name: "French Apple Pie",
      rate: "4.9",
      rateCount: "(124 ratings)",
      text: "Minute by tuk tuk",
      type: "Desserts",
    ),
    SecondMealModel(
      image: "assets/images/dess_2.png",
      name: "Dark Chocolate Cake",
      rate: "4.8",
      rateCount: "(132 ratings)",
      text: "cafe by Tella",
      type: "Desserts",
    ),
    SecondMealModel(
      image: "assets/images/dess_3.png",
      name: "Street Shake",
      rate: "4.7",
      rateCount: "(161 ratings)",
      text: "Cakes by Tella",
      type: "Desserts",
    ),
    SecondMealModel(
      image: "assets/images/dess_4.png",
      name: "Fudgy Chewy Brownies",
      rate: "4.7",
      rateCount: "(145 ratings)",
      text: "Western Food",
      type: "Desserts",
    ),
  ];
  //
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBarWithArrow(title: "Desserts"),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: height * .01),
            // Text Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                height: 43.h,
                decoration: BoxDecoration(
                  color: AppColors.textfield,
                  borderRadius: BorderRadius.circular(50.sp),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Center(
                    child: TextField(
                      controller: txtSearch,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        icon: Image.asset(
                          "assets/images/search.png",
                          width: 20.w,
                          height: 20.h,
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Search food",
                        hintStyle: TextStyle(color: AppColors.placeholder),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //
            SizedBox(height: height * .025),

            // List Meals
            ...List.generate(restraunt.length, (index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DesertDetails(
                            image: restraunt[index].image,
                            name: restraunt[index].name,
                          ),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Image.asset(restraunt[index].image),
                        //
                        // Shadow
                        Positioned(
                          bottom: 0, // لتثبيت الظل في الأسفل
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 100,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.black,
                                ],
                                begin: AlignmentGeometry.topCenter,
                                end: AlignmentGeometry.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 19.sp,
                          left: 20.sp,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                restraunt[index].name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Metropolis",
                                ),
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/svgs/star.svg",
                                    width: 13.w,
                                    height: 13.h,
                                  ),
                                  SizedBox(width: width * .015),
                                  Text(
                                    restraunt[index].rate,
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                      fontFamily: "Metropolis",
                                    ),
                                  ),
                                  SizedBox(width: width * .015),

                                  Text(
                                    restraunt[index].text,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                      fontFamily: "Metropolis",
                                    ),
                                  ),
                                  SizedBox(width: width * .015),
                                  Text(
                                    ". ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                      fontFamily: "Metropolis",
                                    ),
                                  ),

                                  Text(
                                    restraunt[index].type,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                      fontFamily: "Metropolis",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 7),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
