import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/service_locator.dart';
import 'package:tourista/core/widgets/err_animation.dart';
import 'package:tourista/features/my_trips/data/models/all_trips_model/all_trip.dart';
import 'package:tourista/features/my_trips/data/repos/my_trips_repo_impl.dart';
import 'package:tourista/features/my_trips/presentation/manager/uncompleted_trips_cubit/uncompleted_trips_cubit.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/empty_trips.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/my_trips_card.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/my_trips_shimmer.dart';
import 'package:tourista/features/private_trip/main/data/models/create_trip_model/create_trip_model.dart';

class UncompletedBody extends StatelessWidget {
  const UncompletedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UncompletedTripsCubit(getIt.get<MyTripsRepoImpl>())
        ..getUncompletedTripsFun(),
      child: BlocBuilder<UncompletedTripsCubit, UncompletedTripsState>(
          builder: (context, state) {
        if (state is UncompletedTripsLoading) {
          return const MyTripsShimmerLoading();
        } else if (state is UncompletedTripsSuccess) {
          if (state.uncompletedTripsModel.underConstructionTrip == null ||
              state.uncompletedTripsModel.underConstructionTrip!.isEmpty) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: EmptyTrips(
                desc:
                    'Add Trips To Your Favorit To Can Book It When You Want!!',
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                itemCount:
                    state.uncompletedTripsModel.underConstructionTrip!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kPrivateTripTapBar,
                          extra: CreateTripModel(
                              message: 'hello',
                              tripId: state.uncompletedTripsModel
                                  .underConstructionTrip![index]));
                    },
                    child: MyTripsCard(
                      allTrip: AllTrip(
                          name: state.uncompletedTripsModel
                              .underConstructionTrip![index].toCity!.name,
                          image: state.uncompletedTripsModel
                              .underConstructionTrip![index].image,
                          dateEndOfTrip: state.uncompletedTripsModel
                              .underConstructionTrip![index].dateEndOfTrip,
                          dateOfTrip: state.uncompletedTripsModel
                              .underConstructionTrip![index].dateOfTrip),
                    ),
                  );
                },
              ),
            );
          }
        } else if (state is UncompletedTripsFailure) {
          return ErrAnimation(
            errMessage: state.errMessage,
            onPressed: () {
              BlocProvider.of<UncompletedTripsCubit>(context)
                  .getUncompletedTripsFun();
            },
          );
        } else {
          return ErrAnimation(
            errMessage: 'There is a problem Please try later',
            onPressed: () {
              BlocProvider.of<UncompletedTripsCubit>(context)
                  .getUncompletedTripsFun();
            },
          );
        }
      }),
    );
  }
}
