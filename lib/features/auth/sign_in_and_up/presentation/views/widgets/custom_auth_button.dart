import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
    required this.text,
    required this.width,
    this.onTap,
  });

  final String text;
  final double width;
  final dynamic Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: onTap,
      text: text,
      // width: width,
      borderRadius: 8,
      height: 53,
      style: AppStyles.styleInterBold20(context).copyWith(color: Colors.white),
      color: kPrimaryColor, width: width,
    );
  }
}
