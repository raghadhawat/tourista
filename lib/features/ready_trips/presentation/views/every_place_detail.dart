import 'package:flutter/material.dart';
import 'package:tourista/features/ready_trips/data/models/ready_trips_details_model/tourism_place.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/every_place_detail_body.dart';

class EveryPlaceDetail extends StatelessWidget {
  const EveryPlaceDetail({super.key, required this.tourismPlace});
  final TourismPlace tourismPlace;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: EveryPlaceDetailBody(
          tourismPlace: tourismPlace,
        ),
      ),
    );
  }
}
