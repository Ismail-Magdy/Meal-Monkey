import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/features/last_screens/about_us_screen.dart';
import 'package:meal_monkey/features/last_screens/inbox_screen.dart';
import 'package:meal_monkey/features/last_screens/my_order_screen.dart';
import 'package:meal_monkey/features/last_screens/notification_screen.dart';
import 'package:meal_monkey/features/last_screens/payment_details_screen.dart';
import 'package:meal_monkey/core/widgets/custom_app_bar.dart';
import 'package:meal_monkey/core/widgets/custom_container_with_stack.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(title: "More", isMobile: true),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 35.h),
            //
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentDetailsScreen(),
                  ),
                );
              },
              child: CustomContainerWithStack(
                image: "assets/images/more_payment.png",
                title: "Payment Details",
                badge: false,
              ),
            ),
            SizedBox(height: height * .025),
            //
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyOrderScreen()),
                );
              },
              child: CustomContainerWithStack(
                image: "assets/images/more_my_order.png",
                title: "My Orders",
                badge: false,
              ),
            ),
            SizedBox(height: height * .025),
            //
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
                );
              },
              child: CustomContainerWithStack(
                image: "assets/images/more_notification.png",
                title: "Notifications",
                badge: true,
              ),
            ),
            SizedBox(height: height * .025),
            //
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InboxScreen()),
                );
              },
              child: CustomContainerWithStack(
                image: "assets/images/more_inbox.png",
                title: "Inbox",
                badge: false,
              ),
            ),
            SizedBox(height: height * .025),
            //
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsScreen()),
                );
              },
              child: CustomContainerWithStack(
                image: "assets/images/more_info.png",
                title: "About Us",
                badge: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
