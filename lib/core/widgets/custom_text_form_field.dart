import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.icon,
    required this.hintText,
    this.keyboardType,
    this.onChanged,
    this.showPass = false,
    required this.color,
    required this.controller,
    this.suffix,
    this.focusColor,
    this.focusedBordercolor,
    this.hoverColor,
    this.outlinedborder,
    this.fontSize,
  });
  final Widget? icon;
  final String hintText;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Color color;
  final TextEditingController controller;
  final bool showPass;
  final Widget? suffix;
  final Color? focusColor;
  final Color? focusedBordercolor;
  final Color? hoverColor;
  final bool? outlinedborder;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: showPass,
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      cursorColor: color,
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
        return null;
      },
      style: TextStyle(fontSize: fontSize ?? 20),
      decoration: outlinedborder == false || outlinedborder == null
          ? InputDecoration(
              hoverColor: hoverColor ?? color,
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: focusedBordercolor ?? color, width: 2)),
              focusColor: focusColor ?? color,
              prefixIcon: icon,
              suffix: suffix,
              hintText: hintText,
              hintStyle: AppStyles.styleSourceRegular20(context).copyWith(
                color: Colors.black.withOpacity(0.54),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: color, width: 2),
              ),
            )
          : InputDecoration(
              hoverColor: hoverColor ?? color,
              focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide:
                      BorderSide(color: focusedBordercolor ?? color, width: 2)),
              focusColor: focusColor ?? color,
              prefixIcon: icon,
              suffix: suffix,
              hintText: hintText,
              hintStyle: AppStyles.styleSourceRegular20(context).copyWith(
                color: Colors.black.withOpacity(0.54),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: color, width: 1.2),
              ),
            ),
    );
  }
}
