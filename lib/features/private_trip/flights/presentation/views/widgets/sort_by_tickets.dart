import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';

class SortByTickets extends StatelessWidget {
  const SortByTickets({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
  });
  final Color backgroundColor, textColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(2)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Text(
          text,
          style:
              AppStyles.styleInterMedium18(context).copyWith(color: textColor),
        ),
      ),
    );
  }
}
