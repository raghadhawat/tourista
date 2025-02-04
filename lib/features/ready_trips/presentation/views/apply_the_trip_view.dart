import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/features/attractions/presentation/manager/public_attraction_cubit/public_attraction_cubit.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/apply_the_trip_view_body.dart';

class ApplyTheTripView extends StatefulWidget {
  const ApplyTheTripView({super.key, required this.tripId});
  final int tripId;

  @override
  State<ApplyTheTripView> createState() => _ApplyTheTripViewState();
}

class _ApplyTheTripViewState extends State<ApplyTheTripView> {
  @override
  void initState() {
    BlocProvider.of<PublicAttractionCubit>(context)
        .getPublicTripAttractions(publicTripId: widget.tripId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ApplyTheTripViewBody(
          tripId: widget.tripId,
        ),
      ),
    );
  }
}
