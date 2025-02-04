import 'package:flutter/cupertino.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/stays/data/models/hotels_model/hotel.dart';

class HotelMainCardTitle extends StatelessWidget {
  const HotelMainCardTitle({
    super.key,
    required this.width,
    required this.hotel,
  });

  final double width;
  final Hotel hotel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * .6,
      child: Text(
        maxLines: 2,
        hotel.hotelInfo!.name!,
        style: AppStyles.styleSourceSemiBold20(context),
      ),
    );
  }
}
