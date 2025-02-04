import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';

class EartLogoWithText extends StatelessWidget {
  const EartLogoWithText({
    super.key,
    required this.data,
  });
  final String data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.imagesEarthLogo,
          width: 85,
          height: 105,
        ),
        const Gap(30),
        Text(
          data,
          style: AppStyles.styleInterBold25(context)
              .copyWith(color: kPrimaryColor),
        ),
      ],
    );
  }
}
