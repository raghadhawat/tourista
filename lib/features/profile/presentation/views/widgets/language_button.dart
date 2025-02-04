import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/features/profile/presentation/views/widgets/profile_text_button.dart';

import '../../../../../core/translations/locale_keys.g.dart';
import '../../../../../core/utlis/app_assets.dart';
import '../../../../../core/utlis/app_router.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileTextButton(
      onPressed: () {
        GoRouter.of(context).push(AppRouter.kLanguageView);
      },
      width: 23,
      height: 23,
      data: LocaleKeys.Language.tr(),
      assetName: Assets.imagesIconsLanguageIcon,
    );
  }
}
