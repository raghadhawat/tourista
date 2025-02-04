import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/functions/show_dialog.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/my_trips/data/models/active_user_point_model/active_user_public_trip.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/cancele_public_button.dart';
import 'package:tourista/features/notification/presentation/views/widgets/cancele_delay_trip_button.dart';

class TripPointCard extends StatelessWidget {
  const TripPointCard({
    super.key,
    required this.activeUserPublicTrip,
    required this.isDelay,
  });
  final ActiveUserPublicTrip activeUserPublicTrip;
  final bool isDelay;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: kYellowColor, width: 2),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${activeUserPublicTrip.tripPoint!.city!.name} ,${activeUserPublicTrip.tripPoint!.city!.country}',
                  style: AppStyles.styleInterBold20(context)
                      .copyWith(color: kPrimaryColor, fontSize: 18),
                ),
                Gap(5),
                Text(
                  'Number of Tickets: ${activeUserPublicTrip.numberOfTickets}',
                  style: AppStyles.styleInterMedium18(context),
                ),
                Gap(5),
                Text(
                  'Total Price : ${activeUserPublicTrip.price}',
                  style: AppStyles.styleInterSemiBold18(context),
                )
              ],
            ),
            Spacer(),
            isDelay
                ? CanceleDelayTripButton(tripId: activeUserPublicTrip.id!)
                : CustomButton(
                    onTap: () {
                      CustomShowDialog().canceleTripDialog(
                          context,
                          CancelePublicButton(
                              userPointId: activeUserPublicTrip.id!),
                          25);
                    },
                    text: 'Cancele',
                    width: 73,
                    borderRadius: 25,
                    height: 31,
                    style: AppStyles.styleSourceBold20(context)
                        .copyWith(color: Colors.white),
                    color: kPrimaryColor,
                  )
            //  CancelePublicButton(userPointId: activeUserPublicTrip.id!)
          ],
        ),
      ),
    );
  }
}
