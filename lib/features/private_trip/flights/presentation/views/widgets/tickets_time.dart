import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';

class TicketsTime extends StatelessWidget {
  const TicketsTime({
    super.key,
    required this.time,
    required this.airport,
    required this.date,
  });
  final String time, airport, date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          time,
          style: AppStyles.styleInterBold20(context).copyWith(fontSize: 17),
        ),
        Text(
          date,
          style: AppStyles.styleInterMedium18(context),
        ),
        Text(
          airport,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.styleInterMedium12(context),
        ),
      ],
    );
  }
}
