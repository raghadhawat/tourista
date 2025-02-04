import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/widgets/err_animation.dart';
import 'package:tourista/features/ready_trips/presentation/manager/ready_trip_details_cubit/ready_trip_details_cubit.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/ready_trip_details_list_view.dart';

class ReadyTripDetailsViewBody extends StatelessWidget {
  const ReadyTripDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 18.0, left: 18.0, right: 18.0),
      child: BlocBuilder<ReadyTripDetailsCubit, ReadyTripDetailsState>(
        builder: (context, state) {
          if (state is ReadyTripDetailsLoading) {
            return Center(
                child: LottieBuilder.asset(Assets.imagesLottieReadyTrips));
          } else if (state is ReadyTripDetailsSuccess) {
            return ReadyTripDetailsListView(
              readyTripsDetailsModel: state.readyTripsDetailsModel,
            );
          } else if (state is ReadyTripDetailsFailure) {
            return ErrAnimation(errMessage: state.errMessage);
          } else {
            return ErrAnimation(errMessage: 'Please try again');
          }
        },
      ),
    );
  }
}
