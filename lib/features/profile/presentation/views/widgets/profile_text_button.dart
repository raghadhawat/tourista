import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utlis/styles.dart';

class ProfileTextButton extends StatelessWidget {
  const ProfileTextButton(
      {super.key,
      required this.data,
      required this.assetName,
      this.width,
      this.height,
      this.textStyle,
      this.iconColor,
      this.onPressed});
  final String data;
  final String assetName;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final Color? iconColor;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      label: Text(
        data,
        style: textStyle ?? AppStyles.styleInterRegular18(context),
      ),
      icon: SvgPicture.asset(
        assetName,

        width: width ?? 30,
        height: height ?? 30,
        // ignore: deprecated_member_use
        color: iconColor ?? Colors.black,
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero, // Remove the default padding
        minimumSize: Size.zero, // Remove the minimum size constraint
        tapTargetSize: MaterialTapTargetSize
            .shrinkWrap, // Shrink the button size to the content
      ),
    );
  }
}
