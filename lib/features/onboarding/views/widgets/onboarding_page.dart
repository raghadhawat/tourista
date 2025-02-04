import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/onboarding/data/models/onboarding_model.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.onboardingModel,
  });

  final OnboardingModel onboardingModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          opacity: .85,
          image: AssetImage(
            onboardingModel.imageUrl,
          ),
        ),
      ),
      child: Padding(
        padding: onboardingModel.padding == true
            ? EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height * .7,
                bottom: MediaQuery.sizeOf(context).height * .15,
              )
            : EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height * .15,
                bottom: MediaQuery.sizeOf(context).height * .7,
              ),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          color: onboardingModel.color,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * .1),
            child: Center(
              child: Text(
                onboardingModel.desc,
                textAlign: TextAlign.center,
                style: AppStyles.styleIntro23(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
