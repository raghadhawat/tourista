import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/stays/data/models/hotels_model/hotel.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_main_review_row.dart';

class HotelDetailsReviews extends StatelessWidget {
  const HotelDetailsReviews({
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
          LocaleKeys.guestReviews.tr(),
          style: AppStyles.styleInterBold20(context),
        ),
        Gap(18),
        HotelMainReviewRow(hotel: hotel),
        Gap(34)
      ],
    );
  }
}
