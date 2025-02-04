import 'package:flutter/material.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/ready_trip_details_view_body.dart';

class ReadyTripDetailsView extends StatelessWidget {
  const ReadyTripDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ReadyTripDetailsViewBody(),
      ),
    );
  }
}
