import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';

class ResetSuccessfullyWidget extends StatelessWidget {
  const ResetSuccessfullyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.congratulations.tr(),
          style: AppStyles.styleInterBold20(context),
        ),
        Gap(MediaQuery.sizeOf(context).height * .02),
        Text(
          LocaleKeys.passwordResetSuccessfuly.tr(),
          style: AppStyles.styleInterMedium18(context),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
