import 'package:flutter/cupertino.dart';
import 'package:tourista/features/private_trip/stays/data/models/hotels_model/hotel.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_main_card.dart';

class HotelMainListView extends StatelessWidget {
  const HotelMainListView({
    super.key,
    required this.width,
    required this.height,
    required this.hotels,
    required this.tripId,
  });
  final List<Hotel> hotels;
  final double width;
  final double height;
  final int tripId;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: hotels.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 15, bottom: 12),
          child: HotelMainCard(
            tripId: tripId,
            width: width,
            height: height,
            hotel: hotels[index],
            showButton: true,
          ),
        );
      },
    );
  }
}
