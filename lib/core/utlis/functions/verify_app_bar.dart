import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';

AppBar verifyAppBar(BuildContext context, {required String appBarText}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      appBarText,
      style: AppStyles.styleInterSemiBold20(context),
    ),
  );
}
