import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/styles.dart';

class AddActivitiesButton extends StatelessWidget {
  const AddActivitiesButton({
    super.key,
    required this.screenWidth,
    required this.tripId,
    required this.dayId,
    required this.dayDate,
  });
  final int tripId;

  final double screenWidth;
  final int dayId;
  final String dayDate;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * .75,
      height: 50,
      child: OutlinedButton.icon(
        onPressed: () {
          GoRouter.of(context).push(AppRouter.kActivitiesView,
              extra: {'tripId': tripId, 'dayId': dayId, 'dayDate': dayDate});
        },
        icon: SvgPicture.asset(
          Assets.imagesIconsRoundedPlus,
          width: 20,
          height: 20,
        ),
        label: Text(
          LocaleKeys.Add_Activities.tr(),
          style: AppStyles.styleInterSemiBold20(context)
              .copyWith(color: kPrimaryColor),
        ),
        style: ButtonStyle(
            side: MaterialStateProperty.all(
              const BorderSide(
                width: 3,
                color: kPrimaryColor,
                style: BorderStyle.solid,
              ),
            ),
            shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero))),
      ),
    );
  }
}
