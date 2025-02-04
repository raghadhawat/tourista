import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/core/widgets/loading_widget.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/widgets/activities_button.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/final_booking_private_trip/final_booking_private_trip_cubit.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/views/thePlan_view_body.dart';

class FinalBookingButton extends StatelessWidget {
  const FinalBookingButton({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.widget,
    required this.finalPrice,
    this.showConfirmationDialog,
  });

  final double screenWidth;
  final double screenHeight;
  final ThePlanViewBody widget;
  final double finalPrice;
  final dynamic showConfirmationDialog;
  @override
  Widget build(BuildContext context) {
    return BlocListener<FinalBookingPrivateTripCubit,
        FinalBookingPrivateTripState>(
      listener: (context, state) {
        if (state is FinalBookingPrivateTripSuccess) {
          GoRouter.of(context).push(AppRouter.kHomeView);
        } else if (state is FinalBookingPrivateTripFailure) {
          customSnackBar(context, state.errMessage);
        } else {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const LoadingWidget();
            },
          );
        }
      },
      child: CustomAddButton(
        finalPrice: finalPrice,
        screenWidth: screenWidth,
        screenheight: screenHeight,
        onTap: () {
          showConfirmationDialog.showConfirmationDialog(
              context: context,
              titleText: LocaleKeys.are_you_sure.tr(),
              contentText:
                  'Are you sure you want to confirm this tour plan with all the costs involved?',
              onConfirmPressed: () {
                BlocProvider.of<FinalBookingPrivateTripCubit>(context)
                    .finalBookingPrivateTrip(
                        tripId: widget.createTripModel.tripId!.id);
              },
              cancel: true);
        },
        text: 'Submit this trip',
        theplan: true,
      ),
    );
  }
}
