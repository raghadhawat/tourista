import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/stays/data/models/hotels_model/hotel.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_main_card_title.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_main_review_row.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/stars_main_row.dart';

class HotelMainCardTitleAndReviewColumn extends StatelessWidget {
  const HotelMainCardTitleAndReviewColumn({
    super.key,
    required this.width,
    required this.hotel,
  });

  final double width;
  final Hotel hotel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HotelMainCardTitle(
          width: width,
          hotel: hotel,
        ),
        const Gap(4),
        StarsMainRow(
          hotel: hotel,
        ),
        const Gap(4),
        HotelMainReviewRow(
          hotel: hotel,
        ),
        const Gap(4),
        SizedBox(
          width: width * .3,
          child: Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            hotel.description!,
            style: AppStyles.styleSourceRegular14(context),
          ),
        ),
      ],
    );
  }
}
