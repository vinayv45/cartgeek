import 'package:cartgeek/app/binding/main_binding.dart';
import 'package:cartgeek/app/core/theme/app_color.dart';
import 'package:cartgeek/app/modules/home/view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 770),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          initialBinding: MainBinding(),
          debugShowCheckedModeBanner: false,
          title: 'CartGeek',
          theme: ThemeData(
            textTheme: GoogleFonts.alegreyaSansTextTheme(
              Theme.of(context).textTheme,
            ).apply(
              fontSizeFactor: 1.sp,
              bodyColor: AppColor.textColor,
            ),
          ),
          home: child,
        );
      },
      child: const MainView(),
    );
  }
}
