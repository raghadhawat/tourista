import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/features/onboarding/data/models/onboarding_model.dart';
import 'package:tourista/features/onboarding/views/widgets/onboarding_page.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  List<OnboardingModel> onboardingItems = [
    OnboardingModel(
      padding: true,
      color: const Color(0xffFCFCFE),
      desc: LocaleKeys.welcome_to_Tourista_where_you_can_explore_the_world.tr(),
      imageUrl: Assets.imagesIntro1,
      pageIndex: 0,
    ),
    OnboardingModel(
      padding: false,
      color: const Color(0xffE9DDB6),
      desc: LocaleKeys
          .join_to_our_special_trips_for_your_favorite_places_in_the_world
          .tr(),
      imageUrl: Assets.imagesIntro2,
      pageIndex: 1,
    ),
    OnboardingModel(
      padding: true,
      color: const Color(0xffA3BC9E),
      desc: LocaleKeys.Plan_your_trip_from_A_to_z_with_us.tr(),
      imageUrl: Assets.imagesIntro3,
      pageIndex: 2,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 3,
      controller: widget.controller,
      itemBuilder: (BuildContext context, int index) {
        return OnBoardingPage(
          onboardingModel: onboardingItems[index],
        );
      },
    );
  }
}
