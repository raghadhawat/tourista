import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/widgets/icon_with_text_row.dart';

class PlacesTextDesc extends StatelessWidget {
  const PlacesTextDesc({
    super.key,
    required this.title,
    required this.desc,
    this.openingHour,
    this.features,
  });
  final String title;
  final String desc;
  final String? openingHour;
  final String? features;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.styleQuickBold30(context)
                .copyWith(color: kPrimaryColor),
          ),
          Gap(12),
          openingHour == null
              ? IconWithTextRow(
                  assetName: Assets.imagesEllipse,
                  data: 'Rating : ${features!}',
                  imagePhoto: kGreenColor,
                  style: AppStyles.styleQuickBold16(context)
                      .copyWith(fontSize: 15),
                )
              : IconWithTextRow(
                  assetName: Assets.imagesIconsHour,
                  data: 'Opening Time : ${openingHour!}',
                  imagePhoto: kGreenColor,
                  style: AppStyles.styleQuickBold22(context),
                ),
          Gap(12),
          Text(
              overflow: TextOverflow.ellipsis,
              style: AppStyles.styleInterMedium19(context),
              maxLines: 5,
              desc)
        ],
      ),
    );
  }
}
