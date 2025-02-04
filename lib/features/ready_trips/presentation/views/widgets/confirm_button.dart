import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/core/utlis/functions/custom_success_snack_bar.dart';
import 'package:tourista/core/utlis/service_locator.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/ready_trips/data/repos/ready_trip_repo_impl.dart';
import 'package:tourista/features/ready_trips/presentation/manager/trip_booking_cubit/trip_booking_cubit.dart';
import 'package:tourista/features/ready_trips/presentation/manager/trip_info_cubit/trip_info_cubit.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripBookingCubit(getIt.get<ReadyTripsRepoImpl>()),
      child: BlocBuilder<TripInfoCubit, TripInfoState>(
        builder: (context, tripState) {
          return BlocConsumer<TripBookingCubit, TripBookingState>(
            listener: (context, state) {
              if (state is TripBookingSuccess) {
                customSuccessSnackBar(context, 'The Trip Booked Successfully');
              } else if (state is TripBookingFailure) {
                customSnackBar(context, state.errMessage);
              }
            },
            builder: (context, state) {
              return state is TripBookingLoading
                  ? const Center(
                      child: SpinKitThreeBounce(
                      color: kGreenColor,
                      size: 30,
                    ))
                  : CustomButton(
                      onTap: () {
                        print(tripState.pointsOrNot);
                        BlocProvider.of<TripBookingCubit>(context)
                            .bookReadyTripFun(
                          pointsOrNot: tripState.pointsOrNot!,
                          tripPointId: tripState.pointId ?? 0,
                          ticketsNumber: tripState.ticketNumber ?? 0,
                          vipTicket: tripState.vipTicket!,
                        );
                      },
                      text: LocaleKeys.confirm.tr(),
                      width: 120,
                      borderRadius: 24,
                      height: 50,
                      style: AppStyles.styleInterBold20(context)
                          .copyWith(color: Colors.white),
                      color: kPrimaryColor);
            },
          );
        },
      ),
    );
  }
}
