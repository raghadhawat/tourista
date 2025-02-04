import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';

class Luggage extends StatelessWidget {
  const Luggage({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(Assets.imagesIconsLuggage1),
            SvgPicture.asset(Assets.imagesIconsLuggage2),
            SvgPicture.asset(Assets.imagesIconsLuggage3),
          ],
        ),
        SizedBox(
          width: width * .4,
          child: Text(
            LocaleKeys.included.tr(),
            style: AppStyles.styleInterMedium14(context)
                .copyWith(color: Colors.black.withOpacity(.5)),
          ),
        ),
      ],
    );
  }
}
