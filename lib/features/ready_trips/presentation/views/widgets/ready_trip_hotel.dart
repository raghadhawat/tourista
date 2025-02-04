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
import 'package:tourista/features/ready_trips/data/models/ready_trips_details_model/cities_hotel.dart';

class ReadyTripHotel extends StatelessWidget {
  const ReadyTripHotel({super.key, required this.citiesHotel});
  final CitiesHotel citiesHotel;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(Assets.imagesReadyTripDetailIcon1),
        Gap(13),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .45,
              child: Text(
                maxLines: 2,
                citiesHotel.hotel!.name!,
                style: AppStyles.styleQuickBold22(context),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Gap(4),
            Text(
              'Hotel',
              style: AppStyles.styleSourceBold18(context),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .45,
              child: Text(
                maxLines: 2,
                citiesHotel.description!,
                style: AppStyles.styleQuickSemiBold18(context)
                    .copyWith(color: Colors.black),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kreadyTripHotelDetailsview,
                    extra: citiesHotel);
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
