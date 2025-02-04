import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';

class ORDivider extends StatelessWidget {
  const ORDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Divider(
          color: Colors.black,
          thickness: 1.7,
          indent: 50,
          endIndent: 50,
        ),
        Center(
            child: Container(
          color: Colors.white,
          width: 50,
          height: 40,
          child: Center(
            child: Text(
              'or',
              style: AppStyles.styleSourceSemiBold28(context),
            ),
          ),
        )),
      ],
    );
  }
}
