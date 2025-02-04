import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utlis/app_assets.dart';
import '../../../../../../core/utlis/styles.dart';
import 'icon_with_text_row.dart';

class ActivityTextsDetails extends StatelessWidget {
  const ActivityTextsDetails({
    super.key,
    required this.activityName,
    required this.activityOpeningHours,
    required this.activityRecmmendTime,
    required this.activityTybe,
    required this.activityAbout,
  });
  final String? activityName;
  final String? activityOpeningHours;
  final String? activityRecmmendTime;
  final String? activityTybe;
  final String? activityAbout;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          activityName!,
          // overflow: TextOverflow.ellipsis,
          style: AppStyles.styleQuickBold25(context)
              .copyWith(color: kPrimaryColor),
          textAlign: TextAlign.left,
        ),
        const Gap(20),
        IconWithTextRow(
          assetName: Assets.imagesIconsHours,
          data: "Opening Hours: $activityOpeningHours",
        ),
        const Gap(15),
        IconWithTextRow(
          assetName: Assets.imagesIconsHour,
          data: "Recommended time: $activityRecmmendTime Hours",
        ),
        const Gap(15),
        IconWithTextRow(
          assetName: Assets.imagesIconsType,
          data: activityTybe == null
              ? 'General Activity'
              : "$activityTybe Activity ",
        ),
        const Gap(20),
        const Divider(
          color: Colors.grey,
          height: 20,
          thickness: 1,
          indent: 20,
          endIndent: 20,
        ),
        const Gap(10),
        IconWithTextRow(
          assetName: Assets.imagesIconsCirInfo,
          data: "About:",
          color: const Color(0xffEA4335),
        ),
        const Gap(15),
        Text(
          activityAbout!,
          style: AppStyles.styleSourceSemiBold20(context),
        )
      ],
    );
  }
}
