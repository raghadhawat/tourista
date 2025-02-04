import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';

class AddToPlanButton extends StatelessWidget {
  const AddToPlanButton(
      {super.key,
      required this.screenWidth,
      required this.onTap,
      this.text,
      this.color,
      this.price});
  final String? text;

  final double? price;
  final double screenWidth;
  final Function() onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: screenWidth,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          kboxShadow,
        ]),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              price == null
                  ? const SizedBox()
                  : Text(
                      'Total Price $price',
                      style: AppStyles.styleInterRegular14(context)
                          .copyWith(fontSize: 12),
                    ),
              price == null
                  ? const SizedBox()
                  : Text(
                      'For All Nights',
                      style: AppStyles.styleInterRegular12(context)
                          .copyWith(fontSize: 12),
                    ),
              const Gap(6),
              Center(
                child: CustomButton(
                  text: text == null ? LocaleKeys.Add_To_The_plan.tr() : text!,
                  width: screenWidth,
                  borderRadius: 5,
                  height: 50,
                  style: AppStyles.styleSourceBold20(context)
                      .copyWith(color: Colors.white),
                  color: kPrimaryColor,
                  onTap: onTap,
                ),
              ),
            ],
          ),
        ));
  }
}
