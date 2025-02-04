import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/stays/data/models/hotels_model/hotel.dart';

class TitleDetailsHotel extends StatelessWidget {
  const TitleDetailsHotel({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Text(
      hotel.hotelInfo!.name!,
      style: AppStyles.styleSourceSemiBold22(context).copyWith(fontSize: 22),
    );
  }
}
