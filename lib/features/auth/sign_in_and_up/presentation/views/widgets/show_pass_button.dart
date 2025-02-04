import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';

class ShowPasswordButton extends StatelessWidget {
  const ShowPasswordButton({
    super.key,
    required this.onTap,
    required this.showPass,
  });

  final Function()? onTap;
  final bool showPass;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: showPass == true
          ? Text(
              LocaleKeys.show.tr(),
              style: AppStyles.styleSourceBold16(context)
                  .copyWith(color: kPrimaryColor),
            )
          : Text(
              "Hide",
              style: AppStyles.styleSourceBold16(context)
                  .copyWith(color: kPrimaryColor),
            ),
    );
  }
}
