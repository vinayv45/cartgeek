import 'dart:convert';

import 'package:cartgeek/app/core/config/app_urls.dart';
import 'package:cartgeek/app/modules/booking/view/booking_view.dart';
import 'package:cartgeek/app/modules/home/model/current_package_model.dart';
import 'package:cartgeek/app/modules/home/model/package_list_model.dart';
import 'package:cartgeek/app/modules/home/view/home_view.dart';
import 'package:cartgeek/app/modules/packages/view/package_view.dart';
import 'package:cartgeek/app/modules/profile/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart';

class HomeController extends GetxController {
  var currentPackage = CurrentPackageResponse(
    fromDate: '',
    fromTime: '',
    title: '',
    toDate: '',
    toTime: '',
  ).obs;

  var packageList = <PackageListResponse>[].obs;

  final List<Widget> _screens = [
    HomeView(),
    PackageView(),
    BookingView(),
    ProfileView()
  ];

  List<Widget> get screen => _screens;

  RxInt _currentIndex = 0.obs;

  RxInt get currentIndex => _currentIndex;
  var isLoading = false.obs;
  var packageLoading = false.obs;

  @override
  void onInit() {
    fetchCurrentPackage();
    fetchPackageList();
    super.onInit();
  }

  setScreenIndex(int index) {
    _currentIndex.value = index;
  }

  @override
  void onClose() {
    super.onClose();
  }

  fetchCurrentPackage() async {
    try {
      isLoading(true);
      var response = await get(Uri.parse(AppUrls.currentBookingUrl));
      if (response.statusCode == 200) {
        isLoading(false);
        var responseData = jsonDecode(response.body);
        List data = responseData['response'];
        for (int i = 0; i < data.length; i++) {
          currentPackage.value = CurrentPackageResponse(
            title: data[i]['title'],
            fromDate: data[i]['from_date'],
            fromTime: data[i]['from_time'],
            toDate: data[i]['to_date'],
            toTime: data[i]['to_time'],
          );
        }
      } else {
        isLoading(false);
        throw Exception("Failed to load current package list");
      }
    } on Exception catch (e) {
      isLoading(false);
      print("e $e");
    }
  }

  fetchPackageList() async {
    try {
      packageLoading(true);
      var response = await get(Uri.parse(AppUrls.packageListUrl));
      if (response.statusCode == 200) {
        packageLoading(false);
        var responseData = jsonDecode(response.body);
        List data = responseData['response'];
        for (int i = 0; i < data.length; i++) {
          packageList.add(PackageListResponse(
              desc: data[i]['desc'],
              title: data[i]['title'],
              price: data[i]['price']));
        }
      } else {
        packageLoading(false);
        throw Exception("Failed to load current package list");
      }
    } on Exception catch (e) {
      packageLoading(false);
      print("e $e");
    }
  }
}
