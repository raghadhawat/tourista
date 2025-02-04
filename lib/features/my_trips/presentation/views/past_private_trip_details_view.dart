import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/private_trip_details_view_body.dart';

class PastPrivateTripDetailsView extends StatelessWidget {
  const PastPrivateTripDetailsView({super.key, required this.tripId});
  final int tripId;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: PrivateTripDetailsViewBody(tripId: tripId),
    ));
  }
}
