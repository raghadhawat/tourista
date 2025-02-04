import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/stays/data/models/hotels_model/hotel.dart';

class HotelDetailsPhotosDownGrid extends StatelessWidget {
  const HotelDetailsPhotosDownGrid({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisSpacing: 4,
      crossAxisCount: 3,
      children: List.generate(
        3,
        (index) {
          if (index == 2 && hotel.images!.length >= 5) {
            return GestureDetector(
                onTap: () => GoRouter.of(context)
                    .push(AppRouter.kAllPhotoView, extra: hotel),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Stack(
                      children: [
                        CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: '$kBaseUrl${hotel.images![index + 3]}',
                          width: constraints.maxWidth,
                          height: constraints.maxHeight,
                        ),
                        Opacity(
                          opacity: 0.5,
                          child: Container(
                            color: Colors.black,
                          ),
                        ),
                        Positioned.fill(
                          child: Center(
                            child: Text(
                              '+${hotel.images!.length - 5}',
                              style: AppStyles.styleSourceSemiBold22(context)
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ));
          } else {
            return GestureDetector(
              onTap: () => GoRouter.of(context)
                  .push(AppRouter.kAllPhotoView, extra: hotel),
              child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: '$kBaseUrl${hotel.images![index + 3]}'),
            );
          }
        },
      ),
    );
  }
}
