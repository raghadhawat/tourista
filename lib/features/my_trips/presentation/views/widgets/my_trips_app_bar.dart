import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';

class MyTripsAppBar extends StatelessWidget {
  const MyTripsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      width: MediaQuery.sizeOf(context).width,
      height: 70,
      color: kPrimaryColor,
      child: Text(
        'My Trips',
        style: AppStyles.styleInterBold20(context)
            .copyWith(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
