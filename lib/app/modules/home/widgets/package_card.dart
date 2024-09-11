import 'package:cartgeek/app/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../controller/home_controller.dart';
import 'package_card_simmer.dart';

class CurrentPackageCard extends GetView<HomeController> {
  const CurrentPackageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: const PackageCardSimmer(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Current Booking",
                  style: TextStyle(
                    color: AppColor.purpleColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(width: 3, color: Colors.white),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        offset: const Offset(2, 2),
                        blurRadius: 5,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.currentPackage.value.title!,
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: AppColor.darkPinkColor,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 30.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                color: AppColor.darkPinkColor,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Start",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "From",
                                    style: TextStyle(
                                      color: AppColor.textColor,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/images/calendar.svg"),
                                      SizedBox(width: 10.w),
                                      Text(
                                        controller
                                            .currentPackage.value.fromDate!,
                                        style: const TextStyle(
                                          color: AppColor.textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/images/pink_clock.svg"),
                                          SizedBox(width: 10.w),
                                          Text(
                                            controller
                                                .currentPackage.value.fromTime!,
                                            style: TextStyle(
                                              color: AppColor.textColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 100.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "To",
                                    style: TextStyle(
                                      color: AppColor.textColor,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/images/calendar.svg"),
                                      SizedBox(width: 10.w),
                                      Text(
                                        controller.currentPackage.value.toDate!,
                                        style: TextStyle(
                                          color: AppColor.textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/images/pink_clock.svg"),
                                          SizedBox(width: 10.w),
                                          Text(
                                            controller
                                                .currentPackage.value.toTime!,
                                            style: TextStyle(
                                              color: AppColor.textColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColor.purpleColor,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            "assets/images/star.svg"),
                                        SizedBox(width: 4.w),
                                        const Text(
                                          "Rate Us",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColor.purpleColor,
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                "assets/images/location.svg"),
                                            SizedBox(width: 4.w),
                                            const Text(
                                              "Geolocation",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColor.purpleColor,
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                "assets/images/radio.svg"),
                                            SizedBox(width: 4.w),
                                            const Text(
                                              "Survillence",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
