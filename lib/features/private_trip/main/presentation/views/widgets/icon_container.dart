import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({
    super.key,
    required this.icon,
    required this.padding,
  });
  final Widget icon;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(.25),
          borderRadius: BorderRadius.circular(4)),
      child: Padding(padding: EdgeInsets.all(padding), child: icon),
    );
  }
}
