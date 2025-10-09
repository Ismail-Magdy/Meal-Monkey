import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/presentation/core/app_colors.dart';
import 'package:meal_monkey/data/models/first_meal_model.dart';
import 'package:meal_monkey/data/models/second_meal_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_monkey/presentation/screens/main/item_details_screen.dart';
import 'package:meal_monkey/presentation/widgets/custom_app_bar.dart';
import 'package:meal_monkey/responsive/responsive_widget.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  TextEditingController txtSearch = TextEditingController();

  List<FirstMealModel> meals = [
    FirstMealModel(image: "assets/images/cat_offer.png", text: "Offer"),
    FirstMealModel(image: "assets/images/cat_sri.png", text: "Sri Lankan"),
    FirstMealModel(image: "assets/images/cat_3.png", text: "Italian"),
    FirstMealModel(image: "assets/images/cat_4.png", text: "Indian"),
  ];

  List<SecondMealModel> restraunt = [
    SecondMealModel(
      image: "assets/images/res_1.png",
      name: "Café de Noir",
      rate: "4.9",
      rateCount: "(124 ratings)",
      text: "Western Food",
      type: "Café",
    ),
    SecondMealModel(
      image: "assets/images/res_2.png",
      name: "Minute by tuk",
      rate: "4.8",
      rateCount: "(132 ratings)",
      text: "Western Food",
      type: "Café",
    ),
    SecondMealModel(
      image: "assets/images/res_3.png",
      name: "Bakes by Tella",
      rate: "4.7",
      rateCount: "(145 ratings)",
      text: "Western Food",
      type: "Café",
    ),
  ];

  List<SecondMealModel> thirdList = [
    SecondMealModel(
      image: "assets/images/m_res_1.png",
      name: "Café De Bambaa",
      rate: "4.9",
      rateCount: "(122 ratings)",
      text: "Western Food",
      type: "Café",
    ),
    SecondMealModel(
      image: "assets/images/m_res_2.png",
      name: "Burger by Bella",
      rate: "4.8",
      rateCount: "(132 ratings)",
      text: "Western Food",
      type: "Café",
    ),
  ];

  List<SecondMealModel> fourthList = [
    SecondMealModel(
      image: "assets/images/item_1.png",
      name: "Mulberry Pizza by Josh",
      rate: "4.9",
      rateCount: "(122 ratings)",
      text: "Western Food",
      type: "Café",
    ),
    SecondMealModel(
      image: "assets/images/item_2.png",
      name: "Barita",
      rate: "4.8",
      rateCount: "(132 ratings)",
      text: "Coffee",
      type: "Café",
    ),
    SecondMealModel(
      image: "assets/images/item_3.png",
      name: "Pizza Rush Hour",
      rate: "4.8",
      rateCount: "(132 ratings)",
      text: "Italian Food",
      type: "Café",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ResponsiveWidget(
        // Mobile Size
        mobile: Scaffold(
          appBar: CustomAppBar(title: "Good Morning Ismail!", isMobile: true),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                // Delivering to
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Text(
                        "Delivering to",
                        style: TextStyle(
                          color: AppColors.secondaryText,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                // Current location
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17.w),
                  child: Row(
                    children: [
                      Text(
                        "Current Location",
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      GestureDetector(
                        child: Image.asset(
                          "assets/images/dropdown.png",
                          width: 13.w,
                          height: 13.h,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 25.h),

                // Search Field
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Container(
                    width: double.infinity,
                    height: 43.h,
                    decoration: BoxDecoration(
                      color: AppColors.textfield,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 25.w),
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
                            hintText: "Search food",
                            hintStyle: TextStyle(
                              color: AppColors.placeholder,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                // Meals list
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(meals.length, (index) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Image.asset(
                              meals[index].image,
                              width: 80.w,
                              height: 95.h,
                            ),
                          ),
                          Text(
                            meals[index].text,
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),

                SizedBox(height: 25.h),

                // Popular Restaurants
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular Restaurants",
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryText,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "View all",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                // Restaurants List
                Column(
                  children: List.generate(restraunt.length, (index) {
                    return SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Image.asset(
                            restraunt[index].image,
                            width: double.infinity,
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  restraunt[index].name,
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
                                    SizedBox(width: 5.w),
                                    Text(
                                      restraunt[index].rate,
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      restraunt[index].rateCount,
                                      style: TextStyle(
                                        color: AppColors.secondaryText,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      restraunt[index].type,
                                      style: TextStyle(
                                        color: AppColors.secondaryText,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      restraunt[index].text,
                                      style: TextStyle(
                                        color: AppColors.secondaryText,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    );
                  }),
                ),

                SizedBox(height: 15.h),

                // Most Popular
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Most Popular",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryText,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "View all",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                // Third List
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(thirdList.length, (index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200.w,
                              child: Image.asset(thirdList[index].image),
                            ),
                            Text(
                              thirdList[index].name,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  thirdList[index].type,
                                  style: TextStyle(
                                    color: AppColors.secondaryText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.5.sp,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  thirdList[index].text,
                                  style: TextStyle(
                                    color: AppColors.secondaryText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.sp,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                SvgPicture.asset(
                                  "assets/svgs/star.svg",
                                  width: 13.w,
                                  height: 13.h,
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  thirdList[index].rate,
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),

                SizedBox(height: 25.h),

                // Recent Items
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recent Items",
                        style: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryText,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "View all",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10.h),

                // Fourth List
                Column(
                  children: List.generate(fourthList.length, (index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ItemDetailsScreen(
                                  image: fourthList[index].image,
                                  name: fourthList[index].name,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            width: double.infinity,
                            height: 80.h,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                  ),
                                  child: Image.asset(
                                    fourthList[index].image,
                                    width: 78.w,
                                    height: 78.h,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      fourthList[index].name,
                                      style: TextStyle(
                                        color: AppColors.primaryText,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          fourthList[index].type,
                                          style: TextStyle(
                                            color: AppColors.secondaryText,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.5.sp,
                                          ),
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          ".",
                                          style: TextStyle(
                                            color: AppColors.secondaryText,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.5.sp,
                                          ),
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          fourthList[index].text,
                                          style: TextStyle(
                                            color: AppColors.secondaryText,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.5.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/svgs/star.svg",
                                          width: 11.w,
                                          height: 11.h,
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          fourthList[index].rate,
                                          style: TextStyle(
                                            color: AppColors.secondaryText,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.5.sp,
                                          ),
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          fourthList[index].rateCount,
                                          style: TextStyle(
                                            color: AppColors.secondaryText,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.5.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
          //,
        ),
        // Desktop Size
        desktop: Scaffold(
          appBar: CustomAppBar(title: "Good Morning Ismail!", isMobile: false),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                // Delivering to
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Text(
                        "Delivering to",
                        style: TextStyle(
                          color: AppColors.secondaryText,
                          fontSize: 5.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                // Current location
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17.w),
                  child: Row(
                    children: [
                      Text(
                        "Current Location",
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 6.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      GestureDetector(
                        child: Image.asset(
                          "assets/images/dropdown.png",
                          width: 7.w,
                          height: 7.h,
                        ),
                      ),
                    ],
                  ),
                ),
                //
                SizedBox(height: 25.h),
                // Search Field
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70.w),
                  child: Container(
                    width: double.infinity,
                    height: 43.h,
                    decoration: BoxDecoration(
                      color: AppColors.textfield,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Center(
                        child: TextField(
                          controller: txtSearch,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            icon: Image.asset(
                              "assets/images/search.png",
                              width: 15.w,
                              height: 15.h,
                            ),
                            border: InputBorder.none,
                            hintText: "Search food",
                            hintStyle: TextStyle(
                              color: AppColors.placeholder,
                              fontSize: 5.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //
                SizedBox(height: 25.h),
                // Meals list
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(meals.length, (index) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Image.asset(
                              meals[index].image,
                              width: 70.w,
                              height: 85.h,
                            ),
                          ),
                          Text(
                            meals[index].text,
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 4.sp,
                              fontFamily: "Metropolis",
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
                //
                SizedBox(height: 25.h),
                // Popular Restaurants
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular Restaurants",
                        style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryText,
                          fontFamily: "Metropolis",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "View all",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                            fontSize: 5.sp,
                            fontFamily: "Metropolis",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //
                SizedBox(height: 10.h),
                // Restaurants List
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(restraunt.length, (index) {
                      return SizedBox(
                        height: 300.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Image.asset(
                                restraunt[index].image,
                                height: 200.h,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    restraunt[index].name,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontSize: 6.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Metropolis",
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/svgs/star.svg",
                                        width: 15.w,
                                        height: 15.h,
                                      ),
                                      SizedBox(width: 3.w),
                                      Text(
                                        restraunt[index].rate,
                                        style: TextStyle(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 5.sp,
                                          fontFamily: "Metropolis",
                                        ),
                                      ),
                                      SizedBox(width: 3.w),
                                      Text(
                                        restraunt[index].rateCount,
                                        style: TextStyle(
                                          color: AppColors.secondaryText,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 5.sp,
                                          fontFamily: "Metropolis",
                                        ),
                                      ),
                                      SizedBox(width: 3.w),
                                      Text(
                                        restraunt[index].type,
                                        style: TextStyle(
                                          color: AppColors.secondaryText,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 5.sp,
                                          fontFamily: "Metropolis",
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      Text(
                                        restraunt[index].text,
                                        style: TextStyle(
                                          color: AppColors.secondaryText,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 5.sp,
                                          fontFamily: "Metropolis",
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 20.h),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
                //
                // Most Popular
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Most Popular",
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryText,
                          fontFamily: "Metropolis",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "View all",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                            fontSize: 5.sp,
                            fontFamily: "Metropolis",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //
                SizedBox(height: 20.h),
                // Third List
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(thirdList.length, (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 20.w,
                                    bottom: 10.w,
                                  ),
                                  child: Image.asset(
                                    thirdList[index].image,
                                    height: 150.h,
                                  ),
                                ),
                                //
                                Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                  child: Column(
                                    children: [
                                      Text(
                                        thirdList[index].name,
                                        style: TextStyle(
                                          color: AppColors.primaryText,
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Metropolis",
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            thirdList[index].type,
                                            style: TextStyle(
                                              color: AppColors.secondaryText,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 4.5.sp,
                                              fontFamily: "Metropolis",
                                            ),
                                          ),
                                          SizedBox(width: 5.w),
                                          Text(
                                            thirdList[index].text,
                                            style: TextStyle(
                                              color: AppColors.secondaryText,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 5.sp,
                                              fontFamily: "Metropolis",
                                            ),
                                          ),
                                          SizedBox(width: 3.w),
                                          SvgPicture.asset(
                                            "assets/svgs/star.svg",
                                            width: 15.w,
                                            height: 15.h,
                                          ),
                                          SizedBox(width: 3.w),
                                          Text(
                                            thirdList[index].rate,
                                            style: TextStyle(
                                              color: AppColors.primary,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 5.sp,
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
                        ],
                      );
                    }),
                  ),
                ),
                //
                SizedBox(height: 20.h),
                // Recent Items
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recent Items",
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryText,
                          fontFamily: "Metropolis",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "View all",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                            fontSize: 5.sp,
                            fontFamily: "Metropolis",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //
                SizedBox(height: 20.h),
                // Fourth List
                Column(
                  children: List.generate(fourthList.length, (index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ItemDetailsScreen(
                                  image: fourthList[index].image,
                                  name: fourthList[index].name,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            width: double.infinity,

                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: 10.w,
                                    left: 20.w,
                                  ),
                                  child: Image.asset(
                                    fourthList[index].image,
                                    height: 150.h,
                                  ),
                                ),
                                //
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      overflow: TextOverflow.ellipsis,
                                      fourthList[index].name,
                                      style: TextStyle(
                                        color: AppColors.primaryText,
                                        fontSize: 8.5.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Metropolis",
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          overflow: TextOverflow.ellipsis,
                                          fourthList[index].type,
                                          style: TextStyle(
                                            color: AppColors.secondaryText,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 4.5.sp,
                                            fontFamily: "Metropolis",
                                          ),
                                        ),
                                        SizedBox(width: 3.w),
                                        Text(
                                          overflow: TextOverflow.ellipsis,
                                          ".",
                                          style: TextStyle(
                                            color: AppColors.secondaryText,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 4.5.sp,
                                            fontFamily: "Metropolis",
                                          ),
                                        ),
                                        SizedBox(width: 3.w),
                                        Text(
                                          overflow: TextOverflow.ellipsis,
                                          fourthList[index].text,
                                          style: TextStyle(
                                            color: AppColors.secondaryText,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 4.5.sp,
                                            fontFamily: "Metropolis",
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/svgs/star.svg",
                                          width: 13.w,
                                          height: 13.h,
                                        ),
                                        SizedBox(width: 3.w),
                                        Text(
                                          overflow: TextOverflow.ellipsis,
                                          fourthList[index].rate,
                                          style: TextStyle(
                                            color: AppColors.secondaryText,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 4.5.sp,
                                            fontFamily: "Metropolis",
                                          ),
                                        ),
                                        SizedBox(width: 3.w),
                                        Text(
                                          overflow: TextOverflow.ellipsis,
                                          fourthList[index].rateCount,
                                          style: TextStyle(
                                            color: AppColors.secondaryText,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 4.5.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    );
                  }),
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
