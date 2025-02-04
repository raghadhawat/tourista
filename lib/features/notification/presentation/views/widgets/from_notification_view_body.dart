import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/notification/presentation/views/widgets/cancele_delay_trip_button.dart';

class FromNotificationsViewBody extends StatelessWidget {
  const FromNotificationsViewBody({super.key, required this.tripId});
  final int tripId;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
              border: Border.all(color: kYellowColor, width: 2),
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'You Can Cancele This Trip And Get All Your Money Back',
                  style: AppStyles.styleInterBold20(context),
                  textAlign: TextAlign.center,
                ),
                Gap(32),
                CanceleDelayTripButton(
                  tripId: tripId,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
