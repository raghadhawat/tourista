import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/ready_trips/data/models/all_ready_trips_model/the_trip.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/fav_with_photo_ready_trips.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/price_and_show_button.dart';

class ReadyTripsCardColumn extends StatelessWidget {
  const ReadyTripsCardColumn({
    super.key,
    required this.theTrip,
    required this.value,
  });
  final TheTrip theTrip;
  final int value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FavWithPhotoReadyTrips(
          value: value,
          theTrip: theTrip,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          child: Text(
            theTrip.name!,
            style: AppStyles.styleSourceSemiBold22(context)
                .copyWith(color: kPrimaryColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          child: Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            theTrip.description!,
            style: AppStyles.styleInterMedium18(context),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          child: PriceAndShowButton(
            theTrip: theTrip,
          ),
        )
      ],
    );
  }
}
