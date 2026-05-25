import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_monkey/core/models/inbox_model.dart';
import 'package:meal_monkey/core/themes/app_colors.dart';
import 'package:meal_monkey/core/widgets/custom_app_bar_with_arrow.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  // List Inbox
  List<InboxModel> inboxArray = [
    InboxModel(
      title: "MealMonkey Promotions",
      details:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
      date: "6th July",
    ),
    InboxModel(
      title: "MealMonkey Promotions",
      details:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
      date: "5th July",
    ),
    InboxModel(
      title: "MealMonkey Promotions",
      details:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
      date: "3th July",
    ),
    InboxModel(
      title: "MealMonkey Promotions",
      details:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
      date: "1th July",
    ),
    InboxModel(
      title: "MealMonkey Promotions",
      details:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
      date: "23th may",
    ),
    InboxModel(
      title: "MealMonkey Promotions",
      details:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
      date: "20th may",
    ),
    InboxModel(
      title: "MealMonkey Promotions",
      details:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
      date: "12th may",
    ),
    InboxModel(
      title: "MealMonkey Promotions",
      details:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
      date: "8th may",
    ),
    InboxModel(
      title: "MealMonkey Promotions",
      details:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
      date: "6th may",
    ),
  ];
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithArrow(title: "Inbox"),
      body: Expanded(
        child: ListView.separated(
          itemCount: inboxArray.length,
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: 80.h,
              decoration: BoxDecoration(
                color: index % 2 == 0
                    ? Colors.white
                    : const Color.fromARGB(255, 220, 220, 220),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Row(
                      children: [
                        // Ball
                        SvgPicture.asset("assets/svgs/orange.svg"),
                        SizedBox(width: 30.w),
                        // Text Title
                        Expanded(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            inboxArray[index].title,
                            style: TextStyle(
                              fontFamily: "Metropolis",
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryText,
                            ),
                          ),
                        ),
                        //
                        Text(
                          overflow: TextOverflow.ellipsis,
                          inboxArray[index].date,
                          style: TextStyle(
                            fontFamily: "Metropolis",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Text Time
                  Padding(
                    padding: EdgeInsets.only(left: 67.w, right: 20.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            inboxArray[index].details,
                            style: TextStyle(
                              fontFamily: "Metropolis",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.secondaryText,
                            ),
                          ),
                        ),
                        //
                        SizedBox(width: 20.w),
                        //
                        SvgPicture.asset("assets/svgs/out_star.svg"),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(color: Colors.grey, height: 1);
          },
        ),
      ),
    );
  }
}
