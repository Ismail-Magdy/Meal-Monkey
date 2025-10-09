import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_monkey/presentation/core/app_colors.dart';

// ignore: must_be_immutable
class CustomContainerWithStack extends StatelessWidget {
  final String image;
  final String title;
  bool badge;
  CustomContainerWithStack({
    super.key,
    required this.image,
    required this.title,
    required this.badge,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        //
        Container(
          width: 310.w,
          height: 65.h,
          decoration: BoxDecoration(
            color: AppColors.textfield,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 213, 211, 211),
                  radius: 25.r,
                  child: Image.asset(
                    image,
                    width: 20.w,
                    height: 20.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              //
              SizedBox(width: width * .04),
              Text(
                title,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Metropolis",
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: -18,
          top: 25,
          child: CircleAvatar(
            backgroundColor: AppColors.textfield,
            child: SvgPicture.asset(
              "assets/svgs/next_arrow.svg",
              width: 11.w,
              height: 11.h,
            ),
          ),
        ),
        //
        badge
            ? Positioned(
                right: 35,
                top: 34,
                child: Badge(
                  backgroundColor: Colors.red,
                  smallSize: 30.sp,
                  label: Text(
                    "10",
                    style: TextStyle(fontSize: 13.sp, fontFamily: "Metropolis"),
                  ),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
    //;
  }
}
