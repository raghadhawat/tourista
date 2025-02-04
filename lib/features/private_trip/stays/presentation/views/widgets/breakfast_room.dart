import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';

class BreakfastRoom extends StatelessWidget {
  const BreakfastRoom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.imagesIconsBreakfastRoom),
        Gap(6),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * .76,
          child: Text(
            LocaleKeys.breakfastRoom.tr(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.styleInterSemiBold18(context),
          ),
        )
      ],
    );
  }
}
