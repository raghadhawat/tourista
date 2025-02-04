import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';

class ApplyToTripAppBar extends StatelessWidget {
  const ApplyToTripAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: kPrimaryColor,
            )),
        Gap(16),
        Text(
          LocaleKeys.toApply.tr(),
          style: AppStyles.styleInterBold25(context)
              .copyWith(color: kPrimaryColor),
        )
      ],
    );
  }
}
