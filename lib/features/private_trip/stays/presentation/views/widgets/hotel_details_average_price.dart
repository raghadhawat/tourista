import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/stays/data/models/hotels_model/hotel.dart';

class HotelDetailsAveragePrice extends StatelessWidget {
  const HotelDetailsAveragePrice({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.averagePrice.tr(),
          style: AppStyles.styleInterMedium18(context),
        ),
        Text(
          'US\$${hotel.avarageOfPrice}',
          style: AppStyles.styleInterBold20(context),
        ),
      ],
    );
  }
}
