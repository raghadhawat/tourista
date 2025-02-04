import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';

class EmptyTextWidget extends StatelessWidget {
  const EmptyTextWidget({
    super.key,
    required this.data,
  });
  final String data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 30, right: 30),
      child: Center(
        child: Text(
          data,
          style: AppStyles.styleInterRegular18(context),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
