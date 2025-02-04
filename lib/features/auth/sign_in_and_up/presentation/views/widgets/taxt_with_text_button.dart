import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';

import 'custom_text_button.dart';

class TextWithTextButton extends StatelessWidget {
  const TextWithTextButton({
    super.key,
    required this.data,
    required this.textButtondata,
    required this.onPressed,
  });
  final String data;
  final String textButtondata;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          data,
          style: AppStyles.styleSourceSemiBold20(context)
              .copyWith(color: Colors.black),
        ),
        //  kSizedBox5w,
        CustomTextButton(
          data: textButtondata,
          style: AppStyles.styleSourceBold20(context)
              .copyWith(color: kPrimaryColor, fontSize: 18),
          onPressed: onPressed,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ],
    );
  }
}
