import 'package:flutter/material.dart';
import 'package:tourista/features/ready_trips/data/models/ready_trips_details_model/cities_hotel.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/ready_trip_hotel_details_view_body.dart';

class ReadyTripHotelDtailsView extends StatelessWidget {
  const ReadyTripHotelDtailsView({super.key, required this.citiesHotel});
  final CitiesHotel citiesHotel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ReadyTripHotelDtailsViewBody(
        citiesHotel: citiesHotel,
      ),
    ));
  }
}
