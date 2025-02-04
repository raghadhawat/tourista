import 'package:flutter/cupertino.dart';
import 'package:tourista/features/private_trip/stays/data/models/hotels_model/hotel.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_main_card_title_and_review_column.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_main_card_photo.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_main_card_price_and_description.dart';

class HotelMainCard extends StatelessWidget {
  const HotelMainCard({
    super.key,
    required this.width,
    required this.height,
    required this.hotel,
    required this.tripId,
    required this.showButton,
  });
  final Hotel hotel;
  final double width;
  final double height;
  final int tripId;
  final bool showButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HotelMainCardPhoto(
          width: width,
          hotel: hotel,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              HotelMainCardTitleAndReviewColumn(
                width: width,
                hotel: hotel,
              ),
              HotelMainCardPriceAndDescription(
                tripId: tripId,
                width: width,
                height: height,
                hotel: hotel,
                showButton: showButton,
              )
            ],
          ),
        )
      ],
    );
  }
}
