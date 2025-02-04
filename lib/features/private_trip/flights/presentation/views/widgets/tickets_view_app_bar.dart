import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';

class TickesViewAppBar extends StatelessWidget {
  const TickesViewAppBar({
    super.key,
    required this.width,
    required this.height,
    required this.airFrom,
    required this.airTo,
    required this.dateFrom,
    required this.dateTo,
    required this.ticketsNumber,
  });

  final double width;
  final double height;
  final int ticketsNumber;
  final String airFrom, airTo, dateFrom, dateTo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            Container(
              width: width,
              height: height * .09,
              color: kPrimaryColor,
            ),
            Container(
              width: width,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.1),
                  blurRadius: 1,
                  offset: const Offset(0, 4),
                )
              ]),
              child: Padding(
                padding:
                    EdgeInsets.only(top: height * .035, bottom: 10, left: 16),
                child: Text(
                  '$ticketsNumber  ${LocaleKeys.flightsFound.tr()}',
                  style: AppStyles.styleSourceSemiBold20(context)
                      .copyWith(color: Colors.black.withOpacity(.8)),
                ),
              ),
            ),
          ],
        ),
        Positioned(
            top: height * .04,
            left: width * .2,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: kYellowColor, width: 2)),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    ' ${dateFrom.substring(5)} ',
                    style: AppStyles.styleInterMedium18(context),
                  ),
                  Gap(10),
                  SvgPicture.asset(Assets.imagesIconsArrowRightLeft),
                  Gap(10),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    ' ${dateTo.substring(5)} ',
                    style: AppStyles.styleInterMedium18(context),
                  ),
                  Gap(25),
                ],
              ),
            )),
      ],
    );
  }
}
