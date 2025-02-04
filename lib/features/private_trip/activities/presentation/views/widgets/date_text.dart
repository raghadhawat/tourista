import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';

class DateText extends StatelessWidget {
  const DateText({
    super.key,
    required this.theDateString,
  });

  final String theDateString;

  @override
  Widget build(BuildContext context) {
    DateTime theDate = DateFormat('yyyy-MM-dd').parse(theDateString);

    return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          DateFormat('EEEE d MMMM ').format(theDate),
          style: AppStyles.styleInterSemiBold20(context),
          textAlign: TextAlign.start,
        ));
  }
}
