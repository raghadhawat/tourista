import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox(
      {super.key, required this.onChanged, required this.value});
  final ValueChanged<bool?> onChanged;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 5),
      child: Checkbox(
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        activeColor: kPrimaryColor,
        checkColor: Colors.white,
        hoverColor: Colors.black,
        tristate: true,
        onChanged: onChanged,
        value: value,
      ),
    );
  }
}
