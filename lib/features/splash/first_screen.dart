import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/core/themes/app_colors.dart';
import 'package:meal_monkey/features/main/home_screen.dart';
import 'package:meal_monkey/core/widgets/custom_button.dart';
import 'package:meal_monkey/core/helpers/responsive_widget.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FirstScreen> {
  int selectedIndex = 0;
  PageController controller = PageController();
  //
  List pageArr = [
    {
      "title": "Find Food You Love",
      "subtitle":
          "Discover the best foods from over 1,000\nrestaurants and fast delivery to your\ndoorstep",
      "image": "assets/images/on_boarding_1.png",
    },
    {
      "title": "Fast Delivery",
      "subtitle": "Fast food delivery to your home, office\nwherever you are",
      "image": "assets/images/on_boarding_2.png",
    },
    {
      "title": "Live Tracking",
      "subtitle":
          "Real time tracking of your food on the app\nonce you placed the order",
      "image": "assets/images/on_boarding_3.png",
    },
  ];
  //
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        selectedIndex = controller.page?.floor() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ResponsiveWidget(
        // Mobile Size
        mobile: Center(
          child: Stack(
            children: [
              PageView.builder(
                controller: controller,
                itemCount: pageArr.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: height * .11),
                      // Image
                      SizedBox(
                        height: 290.h,
                        width: 220.w,
                        child: Image.asset(
                          pageArr[index]["image"],
                          height: 290.h,
                          width: 220.w,
                        ),
                      ),

                      //
                      SizedBox(height: height * .02),
                      //
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: pageArr.map((e) {
                          var index = pageArr.indexOf(e);
                          return Container(
                            margin: EdgeInsets.all(2.5),
                            height: 7.5.h,
                            width: 7.5.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index == selectedIndex
                                  ? AppColors.primary
                                  : AppColors.placeholder,
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: height * .02),
                      // Bold text
                      Text(
                        pageArr[index]["title"],
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 25.sp,
                          fontFamily: "Metropolis",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: height * .03),
                      // normal text
                      Text(
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        pageArr[index]["subtitle"],
                        style: TextStyle(
                          color: AppColors.secondaryText,
                          fontFamily: "Metropolis",
                        ),
                      ),

                      SizedBox(height: height * .07),
                      // Button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: CustomButton(
                          isMobile: true,
                          text: "Next",
                          onPressed: () {
                            if (selectedIndex >= 2) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            } else {
                              setState(() {
                                selectedIndex++;
                                controller.animateToPage(
                                  selectedIndex,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.linear,
                                );
                              });
                            }
                          },
                          isRounded: false,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        // Desktop Size
        desktop: Center(
          child: Stack(
            children: [
              PageView.builder(
                controller: controller,
                itemCount: pageArr.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: height * .11),
                      // Image
                      SizedBox(
                        height: 290.h,
                        width: 220.w,
                        child: Image.asset(
                          pageArr[index]["image"],
                          height: 290.h,
                          width: 220.w,
                        ),
                      ),
                      //
                      SizedBox(height: height * .02),
                      //
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: pageArr.map((e) {
                          var index = pageArr.indexOf(e);
                          return Container(
                            margin: EdgeInsets.all(2.5),
                            height: 7.5.h,
                            width: 7.5.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index == selectedIndex
                                  ? AppColors.primary
                                  : AppColors.placeholder,
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: height * .02),
                      // Bold text
                      Text(
                        pageArr[index]["title"],
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 12.sp,
                          fontFamily: "Metropolis",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: height * .03),
                      // normal text
                      Text(
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        pageArr[index]["subtitle"],
                        style: TextStyle(
                          color: AppColors.secondaryText,
                          fontFamily: "Metropolis",
                        ),
                      ),

                      SizedBox(height: height * .07),
                      // Button
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 70.w),
                        child: CustomButton(
                          isMobile: false,
                          text: "Next",
                          onPressed: () {
                            if (selectedIndex >= 2) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            } else {
                              setState(() {
                                selectedIndex++;
                                controller.animateToPage(
                                  selectedIndex,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.linear,
                                );
                              });
                            }
                          },
                          isRounded: false,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
