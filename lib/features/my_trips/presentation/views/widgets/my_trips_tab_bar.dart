import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';

class MyTripsTabBar extends StatelessWidget {
  const MyTripsTabBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: TabBar(
          labelPadding: EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          labelColor: kPrimaryColor,
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          overlayColor: const MaterialStatePropertyAll(Colors.white),
          labelStyle:
              AppStyles.styleSourceSemiBold20(context).copyWith(fontSize: 18),
          unselectedLabelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            border: Border.all(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(30),
            color: Colors.white.withOpacity(.20),
          ),
          controller: tabController,
          tabs: [
            Tab(
              text: 'Active',
            ),
            Tab(
              text: 'Past',
            ),
            Tab(
              text: 'Canceled',
            ),
            Tab(
              text: 'Favorit',
            ),
            Tab(
              text: 'Uncompleted',
            ),
          ]),
    );
  }
}
