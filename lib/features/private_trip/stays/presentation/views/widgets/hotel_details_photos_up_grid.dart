import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/features/private_trip/stays/data/models/hotels_model/hotel.dart';

class HotelDetailsPhotosUpGrid extends StatelessWidget {
  const HotelDetailsPhotosUpGrid({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      childAspectRatio: 1.3,
      crossAxisSpacing: 5,
      crossAxisCount: 2,
      children: List.generate(2, (index) {
        return GestureDetector(
          onTap: () =>
              GoRouter.of(context).push(AppRouter.kAllPhotoView, extra: hotel),
          child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: '$kBaseUrl${hotel.images![index + 1]}'),
        );
      }),
    );
  }
}
