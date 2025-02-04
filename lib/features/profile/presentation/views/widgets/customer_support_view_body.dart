import 'package:flutter/material.dart';
import 'contact_us_tab_bar_view.dart';
import 'customer_support_tab_bar.dart';
import 'faq_tab_bar_view.dart';

class CusrtomerSupportViewBody extends StatefulWidget {
  const CusrtomerSupportViewBody({
    super.key,
    required this.scereenWidth,
  });
  final double scereenWidth;
  @override
  State<CusrtomerSupportViewBody> createState() =>
      _CusrtomerSupportViewBodyState();
}

class _CusrtomerSupportViewBodyState extends State<CusrtomerSupportViewBody>
    with TickerProviderStateMixin {
  late TabController tabController1;
  late TabController tabController2;

  @override
  void initState() {
    super.initState();
    tabController1 = TabController(length: 2, vsync: this);
    tabController2 = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController1.dispose();
    tabController2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomerSupportTabBar(tabController1: tabController1),
        Expanded(
          child: TabBarView(
            controller: tabController1,
            children: [
              FaqTabBarView(
                tabController2: tabController2,
              ),
              const ContactUsTabBarView(),
            ],
          ),
        ),
      ],
    );
  }
}
