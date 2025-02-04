import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';

class CustomAddButton extends StatelessWidget {
  const CustomAddButton({
    super.key,
    required this.screenWidth,
    required this.onTap,
    this.text,
    this.color,
    required this.theplan,
    this.screenheight,
    this.finalPrice,
  });
  final String? text;
  final double screenWidth;
  final double? screenheight;

  final Function() onTap;
  final Color? color;
  final bool theplan;
  final double? finalPrice;
  @override
  Widget build(BuildContext context) {
    return theplan == false
        ? Container(
            width: screenWidth,
            height: 70,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              kboxShadow,
            ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 50, right: 50, top: 13, bottom: 10),
              child: CustomButton(
                text: text == null ? LocaleKeys.Add_To_The_plan.tr() : text!,
                width: screenWidth * .8,
                borderRadius: 5,
                height: 50,
                style: AppStyles.styleSourceBold20(context)
                    .copyWith(color: Colors.white),
                color: color == null ? kPrimaryColor : color!,
                onTap: onTap,
              ),
            ),
          )
        : Container(
            width: screenWidth,
            height: screenheight != null ? screenheight! * .145 : 70,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              kboxShadow,
            ]),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Gap(8),
                  Text(
                    'The total Price of this trip :',
                    style: AppStyles.styleInterBold20(context),
                  ),
                  const Gap(3),
                  Text(
                    '$finalPrice \$'.toString(),
                    style: AppStyles.styleSourceRegular23(context),
                  ),
                  //   const Gap(5),
                  CustomButton(
                    text:
                        text == null ? LocaleKeys.Add_To_The_plan.tr() : text!,
                    width: screenWidth * .8,
                    borderRadius: 5,
                    height: 50,
                    style: AppStyles.styleSourceBold20(context)
                        .copyWith(color: Colors.white),
                    color: color == null ? kPrimaryColor : color!,
                    onTap: onTap,
                  ),
                ],
              ),
            ),
          );
  }
}
