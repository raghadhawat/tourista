import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/core/utlis/styles.dart';

class HotelsMainAppBarCard extends StatelessWidget {
  const HotelsMainAppBarCard({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });
  final String icon;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: ListTile(
        onTap: onTap,
        leading: SvgPicture.asset(
          icon,
          color: Colors.black,
        ),
        title: Text(
          title,
          style: AppStyles.styleSourceSemiBold18(context),
        ),
      ),
    );
  }
}
