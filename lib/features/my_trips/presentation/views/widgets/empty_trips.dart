import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/utlis/styles.dart';

class EmptyTrips extends StatelessWidget {
  const EmptyTrips({
    super.key,
    required this.desc,
  });
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Where to next?',
          style: AppStyles.styleInterBold25(context),
        ),
        Gap(24),
        Text(
          desc,
          style: AppStyles.styleSourceRegular20(context),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
