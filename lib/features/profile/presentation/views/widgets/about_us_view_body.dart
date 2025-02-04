import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';

class AboutUsViewBody extends StatelessWidget {
  const AboutUsViewBody({super.key, required this.scereenWidth});
  final double scereenWidth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.imagesEarthLogo,
            width: 85,
            height: 105,
          ),
          const Gap(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              LocaleKeys.aboutUsText.tr(),
              textAlign: TextAlign.center,
              style: AppStyles.styleSourceRegular23(context),
            ),
          ),
          const Gap(50),
          Text(
            LocaleKeys.follow_us_on_social_media.tr(),
            style: AppStyles.styleInterBold20(context)
                .copyWith(color: Colors.black.withOpacity(.7)),
          ),
          const Gap(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.imagesIconsFacebookIcon),
              const Gap(15),
              SvgPicture.asset(Assets.imagesIconsYoutubeIcon),
              const Gap(15),
              SvgPicture.asset(Assets.imagesIconsInstagramIcon)
            ],
          )
        ],
      ),
    );
  }
}
