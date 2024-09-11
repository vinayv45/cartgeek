import 'package:cartgeek/app/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OverLapWidget extends StatelessWidget {
  const OverLapWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColor.pinkColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              margin: EdgeInsets.only(top: 30.h, bottom: 30.h, right: 30.w),
              height: 160.h,
            ),
            Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: 0,
              child: Image.asset(
                "assets/images/people.png",
                height: 220.h,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nanny And",
                style: TextStyle(
                  color: AppColor.purpleColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Babbysitting Services",
                style: TextStyle(
                  color: AppColor.purpleColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: 100.w,
                decoration: BoxDecoration(
                  color: AppColor.purpleColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Book Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
