import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/features/ready_trips/data/models/ready_trips_details_model/ready_trips_details_model.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/ready_trip_details_without_button.dart';

class CanceledPublicBody extends StatelessWidget {
  const CanceledPublicBody({super.key, required this.readyTripsDetailsModel});
  final ReadyTripsDetailsModel readyTripsDetailsModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            ReadyTripDetailsWithoutButton(
              readyTripsDetailsModel: readyTripsDetailsModel,
            ),
            Gap(8),
          ],
        ),
      ),
    );
  }
}
