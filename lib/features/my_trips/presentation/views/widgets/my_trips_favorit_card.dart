import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/my_trips/data/models/favorit_trips_model/public_trip.dart';

class MyTripsFavoritCard extends StatelessWidget {
  const MyTripsFavoritCard({
    super.key,
    required this.publicTrip,
  });
  final PublicTrip publicTrip;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: AspectRatio(
        aspectRatio: 2 / 1.1,
        child: Container(
          alignment: Alignment.bottomLeft,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: CachedNetworkImageProvider(
                      '$kBaseUrl${publicTrip.image}'))),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: Colors.black26,
                  child: Text(
                    publicTrip.name!,
                    style: AppStyles.styleInterBold25(context)
                        .copyWith(color: Colors.white),
                  ),
                ),
                Container(
                  color: Colors.black26,
                  child: Text(
                    '${getSeason(DateTime.parse(publicTrip.dateOfTrip!))} ${DateTime.parse(publicTrip.dateOfTrip!).year} - ${DateTime.parse(publicTrip.dateOfTrip!).difference(DateTime.parse(publicTrip.dateEndOfTrip!)).inDays.toString().substring(1)} days',
                    style: AppStyles.styleInterMedium18(context)
                        .copyWith(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String getSeason(DateTime date) {
  final month = date.month;
  String season;

  switch (month) {
    case 12:
    case 1:
    case 2:
      season = 'Winter';
      break;
    case 3:
    case 4:
    case 5:
      season = 'Spring';
      break;
    case 6:
    case 7:
    case 8:
      season = 'Summer';
      break;
    case 9:
    case 10:
    case 11:
      season = 'Autumn';
      break;
    default:
      season = 'Invalid month';
  }

  return season;
}
