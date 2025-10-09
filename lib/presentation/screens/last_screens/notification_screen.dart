import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_monkey/data/models/notification_model.dart';
import 'package:meal_monkey/presentation/core/app_colors.dart';
import 'package:meal_monkey/presentation/widgets/custom_app_bar_with_arrow.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // List Notification
  List<NotificationModel> notificationArray = [
    NotificationModel(title: "Your orders has been picked up", time: "Now"),
    NotificationModel(title: "Your order has been delivered", time: "1 h ago"),
    NotificationModel(
      title: "Lorem ipsum dolor sit amet, consectetur ",
      time: "3 h ago",
    ),
    NotificationModel(
      title: "Lorem ipsum dolor sit amet, consectetur ",
      time: "5 h ago",
    ),
    NotificationModel(
      title: "Lorem ipsum dolor sit amet, consectetur ",
      time: "05 Sep 2025",
    ),
    NotificationModel(
      title: "Lorem ipsum dolor sit amet, consectetur ",
      time: "12 Aug 2025",
    ),
    NotificationModel(
      title: "Lorem ipsum dolor sit amet, consectetur ",
      time: "20 Jul 2025",
    ),
    NotificationModel(
      title: "Lorem ipsum dolor sit amet, consectetur ",
      time: "12 Jul 2025",
    ),
    NotificationModel(
      title: "Lorem ipsum dolor sit amet, consectetur ",
      time: "1 may 2025",
    ),
    NotificationModel(
      title: "Lorem ipsum dolor sit amet, consectetur ",
      time: "9 mar 2025",
    ),
  ];
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithArrow(title: "Notifications"),
      body: Expanded(
        child: ListView.separated(
          itemCount: notificationArray.length,
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: 60.h,
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
                            notificationArray[index].title,
                            style: TextStyle(
                              fontFamily: "Metropolis",
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Text Time
                  Padding(
                    padding: EdgeInsets.only(left: 67.w),
                    child: Row(
                      children: [
                        Text(
                          notificationArray[index].time,
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
