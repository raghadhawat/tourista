import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/features/private_trip/stays/data/models/hotels_model/hotel.dart';

class HotelMainCardPhoto extends StatelessWidget {
  const HotelMainCardPhoto({
    super.key,
    required this.width,
    required this.hotel,
  });

  final double width;
  final Hotel hotel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * .31,
      child: AspectRatio(
        aspectRatio: 2.5 / 4.75,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
                imageUrl: "$kBaseUrl ${hotel.images?[0]}",
                imageBuilder: (context, imageProvider) => Image(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                errorWidget: (context, url, error) {
                  return Icon(Icons.error_outline);
                })
            // Image.asset(
            //   fit: BoxFit.fill,
            //   Assets.imagesHotelTest,
            // ),
            ),
      ),
    );
  }
}
