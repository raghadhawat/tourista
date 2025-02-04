import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/service_locator.dart';
import 'package:tourista/core/widgets/err_animation.dart';
import 'package:tourista/features/my_trips/data/repos/my_trips_repo_impl.dart';
import 'package:tourista/features/my_trips/presentation/manager/canceled_trips_cubit/canceled_trips_cubit.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/empty_trips.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/my_trips_card.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/my_trips_shimmer.dart';
import 'package:tourista/features/ready_trips/presentation/manager/ready_trip_details_cubit/ready_trip_details_cubit.dart';

class CanceledBody extends StatelessWidget {
  const CanceledBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CanceledTripsCubit(getIt.get<MyTripsRepoImpl>())
        ..getCanceledTripsFun(),
      child: BlocBuilder<CanceledTripsCubit, CanceledTripsState>(
        builder: (context, state) {
          if (state is CanceledTripsLoading) {
            return MyTripsShimmerLoading();
          } else if (state is CanceledTripsSuccess) {
            if (state.allTripsModel.allTrips == null ||
                state.allTripsModel.allTrips!.isEmpty) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: EmptyTrips(
                  desc: 'Go, Book Your Trip And Experience The World With Us!!',
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  itemCount: state.allTripsModel.allTrips!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (state.allTripsModel.allTrips![index].type ==
                            'public') {
                          BlocProvider.of<ReadyTripDetailsCubit>(context)
                              .getReadyTripDetailsFun(
                                  tripId:
                                      state.allTripsModel.allTrips![index].id!);
                          GoRouter.of(context)
                              .push(AppRouter.kCanceledPublicTripDetailsview);
                        } else {
                          GoRouter.of(context).push(
                              AppRouter.kCanceledPrivateTripDetailsview,
                              extra: state.allTripsModel.allTrips![index].id!);
                        }
                      },
                      child: MyTripsCard(
                        allTrip: state.allTripsModel.allTrips![index],
                      ),
                    );
                  },
                ),
              );
            }
          } else if (state is CanceledTripsFailure) {
            return ErrAnimation(
              errMessage: state.errMessage,
              onPressed: () {
                BlocProvider.of<CanceledTripsCubit>(context)
                    .getCanceledTripsFun();
              },
            );
          } else {
            return ErrAnimation(
              errMessage: 'There is a problem Please try later',
              onPressed: () {
                BlocProvider.of<CanceledTripsCubit>(context)
                    .getCanceledTripsFun();
              },
            );
          }
        },
      ),
    );
  }
}
