import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black),
        children: <TextSpan>[
          const TextSpan(text: '• ', style: TextStyle(fontSize: 20)), // Bullet
          TextSpan(
            text: text,
            style: AppStyles.styleInterRegular16(context),
          ),
        ],
      ),
    );
  }
}
