import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/profile/presentation/views/widgets/faq_tab_bar_view.dart';

import '../../../../../core/translations/locale_keys.g.dart';
import '../../../../../core/utlis/app_assets.dart';
import '../../../../private_trip/main/presentation/views/widgets/custom_tab_TabBar.dart';

class CustomQuestionsTybeTabBar extends StatelessWidget {
  const CustomQuestionsTybeTabBar({
    super.key,
    required this.widget,
  });

  final FaqTabBarView widget;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        overlayColor: MaterialStateProperty.all(
          Colors.transparent,
        ),
        automaticIndicatorColorAdjustment: false,
        labelPadding: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.only(top: 10),
        indicatorPadding:
            const EdgeInsets.symmetric(horizontal: 0, vertical: 10.2),
        controller: widget.tabController2,
        labelColor: Colors.black,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        labelStyle: AppStyles.styleInterMedium19(context),
        unselectedLabelColor: Colors.black,
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(.5)),
            borderRadius: BorderRadius.circular(5)),
        tabs: [
          Tab(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13, vertical: 3.5),
              child: CustomTabForTabBar(
                data: LocaleKeys.all.tr(),
                assetName: Assets.imagesIconsAllIcon,
              ),
            ),
          ),
          Tab(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13, vertical: 3.5),
              child: CustomTabForTabBar(
                data: LocaleKeys.Flights.tr(),
                assetName: Assets.imagesIconsFlightsSupportIcon,
              ),
            ),
          ),
          Tab(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13, vertical: 3.5),
              child: CustomTabForTabBar(
                data: LocaleKeys.Stays.tr(),
                assetName: Assets.imagesIconsStays,
                iconColor: Colors.black,
              ),
            ),
          ),
          Tab(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13, vertical: 3.5),
              child: CustomTabForTabBar(
                data: LocaleKeys.Activities.tr(),
                assetName: Assets.imagesIconsActivities,
                iconColor: Colors.black,
              ),
            ),
          ),
        ]);
  }
}
