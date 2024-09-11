import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/common/widgets/controller.dart';
import '../../../core/common/widgets/wrapper.dart';
import '../../../core/theme/app_color.dart';
import 'package:cartgeek/app/modules/home/controller/home_controller.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  final homeController = Get.put(HomeController());
  FancyDrawerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = FancyDrawerController(
        vsync: this, duration: const Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FancyDrawerWrapper(
        backgroundColor: Colors.white,
        controller: _controller!,
        drawerItems: <Widget>[
          Material(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
                  child: Padding(
                    padding: EdgeInsets.only(left: 50.w),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/circular_image.png"),
                          radius: 50.r,
                        ),
                        SizedBox(height: 16.w),
                        Text(
                          "Emily Cyrus",
                          style: TextStyle(
                            color: AppColor.darkPinkColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
                  child: Column(
                    children: [
                      _buildDrawerItem("Home"),
                      Padding(
                        padding: EdgeInsets.only(right: 140.w),
                        child: const Divider(height: 0),
                      ),
                      _buildDrawerItem("Book A Nanny"),
                      Padding(
                        padding: EdgeInsets.only(right: 140.w),
                        child: const Divider(height: 0),
                      ),
                      _buildDrawerItem("How It Works"),
                      Padding(
                        padding: EdgeInsets.only(right: 140.w),
                        child: const Divider(height: 0),
                      ),
                      _buildDrawerItem("Why Nanny Vanny"),
                      Padding(
                        padding: EdgeInsets.only(right: 140.w),
                        child: const Divider(height: 0),
                      ),
                      _buildDrawerItem("My Bookings"),
                      Padding(
                        padding: EdgeInsets.only(right: 140.w),
                        child: const Divider(height: 0),
                      ),
                      _buildDrawerItem("Support"),
                      SizedBox(
                        height: 140.h,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: [
              InkWell(
                onTap: () {
                  _controller!.open();
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: SvgPicture.asset("assets/images/menu.svg"),
                ),
              ),
            ],
          ),
          body: homeController.screen[homeController.currentIndex.value],
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Row(
              children: [
                for (int i = 0; i < homeController.screen.length; i++)
                  _buildNavItem(
                    index: i,
                    icon: _getIcon(i),
                    label: _getLabel(i),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: const TextStyle(
          color: AppColor.purpleColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        _controller!.close();
      },
    );
  }

  Widget _buildNavItem({
    required int index,
    required Widget icon,
    required String label,
  }) {
    bool isSelected = homeController.currentIndex.value == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => homeController.setScreenIndex(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            icon,
            SizedBox(height: 4.h),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColor.pinkColor : AppColor.textColor,
              ),
            ),
            if (isSelected)
              Container(
                height: 5.h,
                width: 5.w,
                decoration: BoxDecoration(
                  color: AppColor.pinkColor,
                  borderRadius: BorderRadius.circular(10.w),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _getIcon(int index) {
    switch (index) {
      case 0:
        return Icon(
          Icons.home,
          color: homeController.currentIndex.value == 0
              ? AppColor.pinkColor
              : AppColor.textColor,
        );
      case 1:
        return SvgPicture.asset(
          "assets/images/sale.svg",
          color: homeController.currentIndex.value == 1
              ? AppColor.pinkColor
              : AppColor.textColor,
        );
      case 2:
        return SvgPicture.asset(
          "assets/images/clock.svg",
          color: homeController.currentIndex.value == 2
              ? AppColor.pinkColor
              : AppColor.textColor,
        );
      case 3:
        return SvgPicture.asset(
          "assets/images/user.svg",
          color: homeController.currentIndex.value == 3
              ? AppColor.pinkColor
              : AppColor.textColor,
        );
      default:
        return SizedBox();
    }
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return "Home";
      case 1:
        return "Package";
      case 2:
        return "Bookings";
      case 3:
        return "Profile";
      default:
        return "";
    }
  }
}
