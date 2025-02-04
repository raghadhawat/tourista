import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';

import '../../../../../../constants.dart';
import '../../../../main/presentation/views/widgets/custom_tab_TabBar.dart';

class CustomColorfulTabBar extends StatelessWidget {
  const CustomColorfulTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
        labelPadding: const EdgeInsets.symmetric(horizontal: 6),
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Colors.black,
        indicatorWeight: 1,
        padding: const EdgeInsets.only(left: 8),
        labelColor: Colors.black,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        labelStyle: AppStyles.styleSourceSemiBold20(context),
        unselectedLabelColor: Colors.black.withOpacity(.5),
        automaticIndicatorColorAdjustment: false,
        tabs: [
          const CustomTabForTabBar(
            data: "General",
            color: Color(0xffEEBBCC),
          ),
          CustomTabForTabBar(
            data: "Sports",
            color: kGreenColor.withOpacity(0.9),
          ),
          const CustomTabForTabBar(
            data: "Restaurant",
            color: Color(0xffF5F3A9),
          ),
          const CustomTabForTabBar(
            data: "Entertainment",
            color: kBlueColor,
          ),
          CustomTabForTabBar(
            data: "Cultural",
            color: const Color(0xffEEBBCC).withOpacity(.9),
          ),
          CustomTabForTabBar(
              data: "Natural", color: kGreenColor.withOpacity(0.7)),
          const CustomTabForTabBar(
              data: "Relaxation", color: Color(0xffF5F3A9)),
        ]);
  }
}
