import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';

class PercentReviewWithTitle extends StatelessWidget {
  const PercentReviewWithTitle({
    super.key,
    required this.title,
    required this.review,
  });

  final String title;
  final double review;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: AppStyles.styleInterSemiBold20(context),
            ),
            if (review > 5)
              const Icon(
                Icons.arrow_upward_rounded,
                color: kPrimaryColor,
              ),
            if (review < 5)
              const Icon(
                Icons.arrow_downward_rounded,
                color: Color(0xffD4111F),
              ),
            Spacer(),
            Text(
              '$review',
              style: AppStyles.styleInterMedium18(context),
            )
          ],
        ),
        const Gap(12),
        LinearPercentIndicator(
          padding: const EdgeInsets.all(0),
          barRadius: Radius.circular(24),
          lineHeight: 10.0,
          percent: review / 10,
          backgroundColor: Colors.black.withOpacity(0.15),
          progressColor: review > 5
              ? kPrimaryColor
              : review > 5
                  ? Color(0xff003B95)
                  : Color(0xffD4111F),
        ),
      ],
    );
  }
}
