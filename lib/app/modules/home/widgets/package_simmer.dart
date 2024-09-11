import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class PackageListShimmer extends StatelessWidget {
  const PackageListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(bottom: 20.h),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30.h,
                      width: 30.w,
                      color: Colors.grey[300],
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 30.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Container(
                  height: 18.h,
                  width: 150.w,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 10.h),
                Container(
                  height: 10.h,
                  width: double.infinity,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 10.h),
                Container(
                  height: 10.h,
                  width: 200.w,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
