import 'package:cartgeek/app/core/theme/app_color.dart';
import 'package:cartgeek/app/modules/home/controller/home_controller.dart';
import 'package:cartgeek/app/modules/home/widgets/package_simmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PackageList extends GetView<HomeController> {
  const PackageList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.packageLoading.value
          ? const PackageListShimmer()
          : ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.packageList.length,
              itemBuilder: (context, index) {
                final package = controller.packageList[index];
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? AppColor.pinkColor
                          : AppColor.lightPurpleColor,
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.only(bottom: 20.h),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset("assets/images/date.svg"),
                          Container(
                            alignment: Alignment.center,
                            height: 30.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: index % 2 == 0
                                  ? AppColor.darkPinkColor
                                  : const Color(0xff0098D0),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Book Now",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            package.title!,
                            style: TextStyle(
                              fontSize: 18.sp,
                            ),
                          ),
                          Text(
                            "₹ ${package.price!}",
                            style: TextStyle(
                              color: AppColor.purpleColor,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        package.desc!,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColor.textColor,
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
