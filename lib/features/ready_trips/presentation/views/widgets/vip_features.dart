import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';

class VIPFeatures extends StatelessWidget {
  const VIPFeatures({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.imagesEllipse),
        Gap(8),
        Text(
          text,
          style: AppStyles.styleSourceRegular20(context),
          maxLines: 2,
        )
      ],
    );
  }
}
