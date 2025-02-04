import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/ready_trips/data/models/ready_trips_details_model/ready_trips_details_model.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/ready_trip_details_without_button.dart';

class ActivePublicDetailsBody extends StatelessWidget {
  const ActivePublicDetailsBody({
    super.key,
    required this.readyTripsDetailsModel,
  });
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
            CustomButton(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kPointsview,
                      extra: readyTripsDetailsModel.publicTrip!.id);
                },
                text: "Cancele This Trip",
                width: MediaQuery.sizeOf(context).width,
                borderRadius: 24,
                height: 50,
                style: AppStyles.styleInterBold20(context)
                    .copyWith(color: Colors.white),
                color: kPrimaryColor)
          ],
        ),
      ),
    );
  }
}
