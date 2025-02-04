import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/stays/data/models/hotels_model/hotel.dart';

class FeaturesRow extends StatelessWidget {
  const FeaturesRow({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(hotel.features!.length, (index) {
        var children = [
          if (hotel.features![index].toLowerCase().contains('parking'))
            SvgPicture.asset(Assets.imagesFreeParking),
          if (hotel.features![index].toLowerCase().contains('condition'))
            SvgPicture.asset(Assets.imagesAirCondition),
          if (hotel.features![index].toLowerCase().contains('wi-fi'))
            SvgPicture.asset(Assets.imagesFreeWifi),
          if (hotel.features![index].toLowerCase().contains('restaurant'))
            SvgPicture.asset(Assets.imagesRestaurant),
          if (!(hotel.features![index].toLowerCase().contains('restaurant')) &&
              !(hotel.features![index].toLowerCase().contains('wi-fi')) &&
              !(hotel.features![index].toLowerCase().contains('condition')) &&
              !(hotel.features![index].toLowerCase().contains('parking')))
            SvgPicture.asset(Assets.imagesHotelFeatures),
          Text(
            hotel.features![index],
            style: AppStyles.styleSourceSemiBold15(context)
                .copyWith(color: Colors.grey),
          )
        ];
        return Column(
          children: children,
        );
      }),
    );
  }
}
