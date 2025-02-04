import 'package:flutter/material.dart';
import 'package:tourista/features/ready_trips/data/models/all_ready_trips_model/the_trip.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/ready_trips_card_column.dart';

class ReadyTripsCard extends StatelessWidget {
  const ReadyTripsCard({super.key, required this.theTrip, required this.value});
  final TheTrip theTrip;
  final int value;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            boxShadow(4, 4, 4),
            boxShadow(4, 4, -4),
            boxShadow(-4, 4, -4),
            boxShadow(-4, 4, 4)
          ]),
      child: ReadyTripsCardColumn(
        value: value,
        theTrip: theTrip,
      ),
    );
  }

  BoxShadow boxShadow(double y, double blur, double x) {
    return BoxShadow(
      color: Colors.grey.withOpacity(.1),
      blurRadius: blur,
      offset: Offset(x, y),
    );
  }
}
