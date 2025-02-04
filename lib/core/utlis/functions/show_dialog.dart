import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/cancele_text_column.dart';
import 'package:tourista/features/profile/presentation/views/widgets/custom_rich_text.dart';

import '../../translations/locale_keys.g.dart';

class CustomShowDialog {
  Future<dynamic> canceleTripDialog(
      BuildContext context, Widget widget, double radius) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(radius),
          ),
          title: Text(
            'To Cancel This Trip:',
            style: AppStyles.styleSourceBold18(context)
                .copyWith(color: kPrimaryColor, fontSize: 18),
          ),
          content: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CanceleTextColumn(),
              Gap(16),
              // Add some spacing between the options and the question
              Text('Are you sure from canceling this trip?'),
            ],
          ),
          actions: <Widget>[
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  widget,
                  CustomButton(
                    onTap: () => Navigator.of(context).pop(),
                    text: 'No',
                    width: 73,
                    borderRadius: radius,
                    height: 31,
                    style: AppStyles.styleSourceBold20(context)
                        .copyWith(color: Colors.white),
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> showConfirmationDialog({
    required BuildContext context,
    required String titleText,
    required String contentText,
    required Function()? onConfirmPressed,
    required bool cancel,
    bool? deleteProfile,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: deleteProfile == true
              ? Center(
                  child: Column(
                  children: [
                    SvgPicture.asset(Assets.imagesIconsAreYouSureDeleteIcon),
                    const Gap(5),
                    Text(titleText),
                  ],
                ))
              : Text(titleText),
          content: deleteProfile == true
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        LocaleKeys.you_will_lose_all_of_your_data.tr(),
                        style: AppStyles.styleInterMedium19(context),
                      ),
                    ),
                    const Gap(10),
                    CustomRichText(
                      text: LocaleKeys.all_your_trips.tr(),
                    ),
                    const Gap(5),
                    CustomRichText(
                      text: LocaleKeys.if_there_is_booking.tr(),
                    ),
                    const Gap(5),
                    CustomRichText(
                      text: '${LocaleKeys.booking_from_two_week.tr()} 50%',
                    ),
                    const Gap(5),
                    CustomRichText(
                      text: '${LocaleKeys.less_than_2_week.tr()} 30%',
                    ),
                  ],
                )
              : Text(contentText),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          actions: deleteProfile == true
              ? <Widget>[
                  Center(
                    child: CustomButton(
                      onTap: onConfirmPressed,
                      text: LocaleKeys.Delete_Account.tr(),
                      borderRadius: 5,
                      height: 37,
                      style: AppStyles.styleInterMedium18(context),
                      color: const Color(0xffF5F3A9),
                      width: MediaQuery.sizeOf(context).width,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: CustomButton(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      text: LocaleKeys.cancel.tr(),
                      borderRadius: 5,
                      height: 37,
                      style: AppStyles.styleInterMedium18(context),
                      color: const Color(0xffA0D8B3),
                      width: MediaQuery.sizeOf(context).width,
                    ),
                  )
                ]
              : <Widget>[
                  cancel == true
                      ? TextButton(
                          child: Text(LocaleKeys.cancel.tr()),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      : const Text(''),
                  cancel == true
                      ? TextButton(
                          onPressed: onConfirmPressed,
                          child: Text(LocaleKeys.confirm.tr()),
                        )
                      : TextButton(
                          onPressed: onConfirmPressed,
                          child: Text(LocaleKeys.ok.tr()),
                        ),
                ],
        );
      },
    );
  }
}
