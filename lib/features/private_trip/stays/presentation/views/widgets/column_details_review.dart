import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/features/private_trip/stays/data/models/hotels_model/hotel.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/percent_review_with_title.dart';

class ColumnDetailsReview extends StatelessWidget {
  const ColumnDetailsReview({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(22),
        PercentReviewWithTitle(
          title: LocaleKeys.cleanless.tr(),
          review: double.parse(hotel.review!.cleanliness!),
        ),
        const Gap(15),
        PercentReviewWithTitle(
          title: LocaleKeys.comfort.tr(),
          review: double.parse(hotel.review!.comfort!),
        ),
        const Gap(15),
        PercentReviewWithTitle(
          title: LocaleKeys.facilities.tr(),
          review: double.parse(hotel.review!.facilities!),
        ),
        const Gap(32),
      ],
    );
  }
}
