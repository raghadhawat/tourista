import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';

class HotelDetailsLocation extends StatelessWidget {
  const HotelDetailsLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.propertyLocation.tr(),
          style: AppStyles.styleInterBold20(context),
        ),
        Gap(15),
        Image.asset(Assets.imagesTestMap),
        Gap(15),
        Text(
          'Sheikh Mohammad Bin Rashid, Old town, downtown Dubai, 114788 Dubai, United Arab Emirates',
          style: AppStyles.styleInterMedium14(context)
              .copyWith(color: Colors.black45),
        )
      ],
    );
  }
}
