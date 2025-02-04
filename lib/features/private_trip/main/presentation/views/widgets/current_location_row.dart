import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/main/presentation/views/widgets/icon_container.dart';

class CurrentLocationRow extends StatelessWidget {
  const CurrentLocationRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const IconContainer(
          padding: 3,
          icon: Icon(
            Icons.location_on_rounded,
            color: kPrimaryColor,
          ),
        ),
        const Gap(16),
        Text(
          'Current Location',
          style: AppStyles.styleInterBold16(context)
              .copyWith(color: kPrimaryColor),
        ),
      ],
    );
  }
}
