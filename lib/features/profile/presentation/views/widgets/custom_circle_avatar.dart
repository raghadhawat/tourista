import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    this.circleAvatarName,
  });
  final String? circleAvatarName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kCircleAvatarColoe,
        border: Border.all(color: kYellowColor, width: 3),
      ),
      child: Center(
        child: Text(
          circleAvatarName ?? '',
          style:
              AppStyles.styleInterBold27(context).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
