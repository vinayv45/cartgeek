import 'package:cartgeek/app/modules/home/widgets/over_lap_widget.dart';
import 'package:cartgeek/app/modules/home/widgets/package_card.dart';
import 'package:cartgeek/app/modules/home/widgets/package_list.dart';
import 'package:cartgeek/app/modules/home/widgets/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return HomeWidget();
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UserTile(),
                SizedBox(height: 10.h),
                const OverLapWidget(),
                const CurrentPackageCard(),
                SizedBox(height: 20.h),
                const PackageList()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
