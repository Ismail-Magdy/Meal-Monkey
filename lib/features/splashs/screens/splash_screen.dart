import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/core/themes/app_colors.dart';
import 'package:meal_monkey/features/root/screens/root_screen.dart';
import 'package:meal_monkey/core/widgets/custom_button.dart';
import 'package:meal_monkey/features/splashs/model/page_array_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SplashScreen> {
  int selectedIndex = 0;
  PageController controller = PageController();
  //
  final List<PageArrayModel> pageArray = [
    PageArrayModel(
      title: "Find Food You Love",
      subTitle:
          "Discover the best foods from over 1,000\nrestaurants and fast delivery to your\ndoorstep",
      image: "assets/images/on_boarding_1.png",
    ),
    PageArrayModel(
      title: "Fast Delivery",
      subTitle: "Fast food delivery to your home, office\nwherever you are",
      image: "assets/images/on_boarding_2.png",
    ),
    PageArrayModel(
      title: "Live Tracking",
      subTitle:
          "Real time tracking of your food on the app\nonce you placed the order",
      image: "assets/images/on_boarding_3.png",
    ),
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
      body: Center(
        child: Stack(
          children: [
            PageView.builder(
              controller: controller,
              itemCount: pageArray.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(height: height * .11),
                    // Image
                    SizedBox(
                      height: 290.h,
                      width: 220.w,
                      child: Image.asset(
                        pageArray[index].image,
                        height: 290.h,
                        width: 220.w,
                      ),
                    ),
                    //
                    SizedBox(height: height * .05),
                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: pageArray.map((e) {
                        var index = pageArray.indexOf(e);
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
                    //
                    SizedBox(height: height * .05),
                    // Bold text
                    Text(
                      pageArray[index].title,
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 25.sp,
                        fontFamily: "Metropolis",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //
                    SizedBox(height: height * .03),
                    // normal text
                    Text(
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      pageArray[index].subTitle,
                      style: TextStyle(
                        color: AppColors.secondaryText,
                        fontFamily: "Metropolis",
                      ),
                    ),
                    //
                    SizedBox(height: height * .07),
                    // Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: CustomButton(
                        text: "Next",
                        onPressed: () {
                          if (selectedIndex >= 2) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RootScreen(),
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
                    //
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
