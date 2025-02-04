import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/features/ready_trips/data/models/all_ready_trips_model/the_trip.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/fav_ready_trips.dart';

class FavWithPhotoReadyTrips extends StatelessWidget {
  const FavWithPhotoReadyTrips({
    super.key,
    required this.theTrip,
    required this.value,
  });
  final TheTrip theTrip;
  final int value;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: AspectRatio(
                aspectRatio: 2.5 / 1.5,
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: CachedNetworkImage(
                        imageUrl: "$kBaseUrl ${theTrip.image}",
                        imageBuilder: (context, imageProvider) => Image(
                              image: imageProvider,
                              fit: BoxFit.fill,
                            ),
                        errorWidget: (context, url, error) {
                          return Icon(Icons.error_outline);
                        })))),
        FavReadyTrips(
          value: value,
          theTrip: theTrip,
        ),
      ],
    );
  }
}
