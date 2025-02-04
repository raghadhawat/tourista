import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.text,
      this.onTap,
      required this.width,
      required this.borderRadius,
      this.padding,
      this.height,
      required this.style,
      required this.color,
      this.boxShadow});
  String text;
  Function()? onTap;
  final double width;
  final double borderRadius;
  double? padding;
  final double? height;
  final TextStyle style;
  final Color color;
  final List<BoxShadow>? boxShadow;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          boxShadow: boxShadow,
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Text(text, style: style),
        ),
      ),
    );
  }
}
