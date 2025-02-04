import 'package:flutter/material.dart';
import 'package:tourista/features/my_trips/data/models/active_user_point_model/active_user_point_model.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/trip_point_card.dart';

class PointListView extends StatelessWidget {
  const PointListView({
    super.key,
    required this.activeUserPointModel,
    required this.isDelay,
  });
  final ActiveUserPointModel activeUserPointModel;
  final bool isDelay;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: activeUserPointModel.activeUserPublicTrip!.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(6.0),
          child: TripPointCard(
            isDelay: isDelay,
            activeUserPublicTrip:
                activeUserPointModel.activeUserPublicTrip![index],
          ),
        );
      },
    );
  }
}
