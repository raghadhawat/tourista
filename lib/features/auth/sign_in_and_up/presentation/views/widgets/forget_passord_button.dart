import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/views/widgets/custom_text_button.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      data: LocaleKeys.forget_password.tr(),
      style: AppStyles.styleSourceSemiBold18(context),
      onPressed: () {
        GoRouter.of(context).push(AppRouter.kForgetPassword);
      },
      mainAxisAlignment: MainAxisAlignment.end,
    );
  }
}
