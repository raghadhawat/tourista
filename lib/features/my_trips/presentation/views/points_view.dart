import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/points_view_body.dart';

class PointsView extends StatelessWidget {
  const PointsView({super.key, required this.tripId});
  final int tripId;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => GoRouter.of(context).pop(),
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: kPrimaryColor,
              )),
        ),
        body: PointsViewBody(
          isDelay: false,
          tripId: tripId,
        ),
      ),
    );
  }
}
