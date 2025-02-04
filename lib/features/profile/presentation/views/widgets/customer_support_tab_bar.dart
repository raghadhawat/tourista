import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';

class CustomerSupportTabBar extends StatefulWidget {
  const CustomerSupportTabBar({
    super.key,
    required this.tabController1,
  });

  final TabController tabController1;

  @override
  State<CustomerSupportTabBar> createState() => _CustomerSupportTabBarState();
}

class _CustomerSupportTabBarState extends State<CustomerSupportTabBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: widget.tabController1,
      dividerColor: Colors.black.withOpacity(.5),
      labelColor: kPrimaryColor,
      labelStyle: AppStyles.styleInterSemiBold18(context),
      unselectedLabelColor: Colors.black.withOpacity(.5),
      indicatorWeight: 5,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorPadding: EdgeInsets.zero,
      padding: const EdgeInsets.only(top: 5),
      tabs: const [
        Tab(text: 'FAQ'),
        Tab(text: 'Contact Us'),
      ],
    );
  }
}
