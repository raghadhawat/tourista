import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/widgets/err_animation.dart';
import 'package:tourista/features/ready_trips/presentation/manager/ready_trip_details_cubit/ready_trip_details_cubit.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/ready_trip_details_without_button.dart';

class PastPublicTripDetailsView extends StatelessWidget {
  const PastPublicTripDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: BlocBuilder<ReadyTripDetailsCubit, ReadyTripDetailsState>(
        builder: (context, state) {
          if (state is ReadyTripDetailsLoading) {
            return Center(
                child: LottieBuilder.asset(Assets.imagesLottieReadyTrips));
          } else if (state is ReadyTripDetailsSuccess) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: ReadyTripDetailsWithoutButton(
                  readyTripsDetailsModel: state.readyTripsDetailsModel,
                ),
              ),
            );
          } else if (state is ReadyTripDetailsFailure) {
            return ErrAnimation(errMessage: state.errMessage);
          } else {
            return ErrAnimation(errMessage: 'Please try again');
          }
        },
      )),
    );
  }
}
