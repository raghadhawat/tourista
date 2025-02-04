import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/translations/locale_keys.g.dart';
import '../../../../../core/utlis/app_assets.dart';
import '../../../../../core/utlis/app_router.dart';
import 'profile_text_button.dart';

class PasswordAndSecurityButton extends StatelessWidget {
  const PasswordAndSecurityButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileTextButton(
        onPressed: () {
          GoRouter.of(context).push(AppRouter.kPasswordAndSecurityView);
        },
        data: LocaleKeys.password_and_security.tr(),
        assetName: Assets.imagesIconsPasswordAndSecurityIcon);
  }
}
