import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/core/utlis/app_router.dart';

import '../../../../../core/translations/locale_keys.g.dart';
import '../../../../../core/utlis/app_assets.dart';
import 'profile_text_button.dart';

class AboutUsButton extends StatelessWidget {
  const AboutUsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileTextButton(
      onPressed: () {
        GoRouter.of(context).push(AppRouter.kAboutUsView);
      },
      width: 27,
      height: 27,
      data: LocaleKeys.About_us.tr(),
      assetName: Assets.imagesIconsAboutCircleIcon,
    );
  }
}
