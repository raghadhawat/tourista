import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.data,
    this.textButtondata,
    required this.onPressed,
    this.style,
    required this.mainAxisAlignment,
  });
  final String data;
  final String? textButtondata;
  final Function() onPressed;
  final TextStyle? style;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Text(
            data,
            style: style ??
                AppStyles.styleSourceSemiBold20(context)
                    .copyWith(color: Colors.black),
          ),
          const Gap(5),
          if (textButtondata != null)
            Text(textButtondata!,
                style: AppStyles.styleSourceBold20(context)
                    .copyWith(color: kPrimaryColor, fontSize: 18)),
        ],
      ),
    );
  }
}
