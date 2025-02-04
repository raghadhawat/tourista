import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/ready_trips/data/models/ready_trips_details_model/tourism_place.dart';

class ReadyTripDetailsCard extends StatelessWidget {
  const ReadyTripDetailsCard({
    super.key,
    required this.isEnd,
    required this.tourismPlace,
  });
  final bool isEnd;
  final TourismPlace tourismPlace;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isEnd
            ? SvgPicture.asset(Assets.imagesReadyTripDetailIcon2)
            : SvgPicture.asset(Assets.imagesReadyTripDetailIcon1),
        Gap(13),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tourismPlace.name!,
              style: AppStyles.styleQuickBold22(context),
            ),
            Gap(4),
            Text(
              tourismPlace.type ?? "",
              style: AppStyles.styleSourceBold18(context),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .45,
              child: Text(
                maxLines: 2,
                tourismPlace.description!,
                style: AppStyles.styleQuickSemiBold18(context)
                    .copyWith(color: Colors.black),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context)
                    .push(AppRouter.kEveryPlaceDetail, extra: tourismPlace);
              },
              child: Text(
                LocaleKeys.seeMore.tr(),
                style: AppStyles.styleQuickSemiBold18(context)
                    .copyWith(color: kPrimaryColor.withOpacity(.7)),
              ),
            )
          ],
        ),
        Gap(13),
        Image.asset(Assets.imagesPlacesTest),
      ],
    );
  }
}
