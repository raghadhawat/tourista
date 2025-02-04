import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/widgets/err_animation.dart';
import 'package:tourista/features/notification/data/services/notification_services.dart';
import 'package:tourista/features/ready_trips/presentation/manager/all_ready_trips_cubit/all_ready_trips_cubit.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/ready_trips_card.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/ready_trips_sort_by.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/shimmer_ready_trips_loading.dart';

class ReadyTripsTabBarView extends StatefulWidget {
  const ReadyTripsTabBarView({super.key, required this.value});
  final int value;

  @override
  State<ReadyTripsTabBarView> createState() => _ReadyTripsTabBarViewState();
}

class _ReadyTripsTabBarViewState extends State<ReadyTripsTabBarView> {
  Future<void> _refreshData(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));

    if (widget.value == 0) {
      BlocProvider.of<AllReadyTripsCubit>(context).getAllReadyTripsFun();
    } else {
      BlocProvider.of<AllReadyTripsCubit>(context)
          .getAllReadyTripsFun(classificationId: widget.value);
    }
  }

  bool notificationListenerSet = false;

  @override
  void initState() {
    if (!notificationListenerSet) {
      listenToNotificationStream();
      notificationListenerSet = true;
    }
    super.initState();
  }

  void listenToNotificationStream() {
    LocalNotificationService.streamController.stream.listen(
      (notificationResponse) {
        log(notificationResponse.id!.toString());
        log(notificationResponse.payload!.toString());

        if (notificationResponse.payload!.toString() == 'new-attraction') {
          GoRouter.of(context).push(AppRouter.kHomeView, extra: 1);
        } else if (notificationResponse.payload!.toString() ==
                'updatePublicTrip' ||
            notificationResponse.payload!.toString() ==
                'public-deducatedPoints') {
          GoRouter.of(context).push(AppRouter.kFromNotificationview,
              extra: notificationResponse.id);
        } else if (notificationResponse.payload!.toString() ==
                'deletePublicTrip' ||
            notificationResponse.payload!.toString() ==
                'deletePublicTripPoint' ||
            notificationResponse.payload!.toString() == 'add_to_wallet' ||
            notificationResponse.payload!.toString() ==
                'restore_money_publicTrip' ||
            notificationResponse.payload!.toString() == 'deletePublicTrip' ||
            notificationResponse.payload!.toString() == 'canceledPrivateTrip' ||
            notificationResponse.payload!.toString() == 'canceledPuplicTrip' ||
            notificationResponse.payload!.toString() ==
                'delete_booking_hotel' ||
            notificationResponse.payload!.toString() ==
                'booking_private_trip' ||
            notificationResponse.payload!.toString() ==
                'private_distroyedAirport' ||
            notificationResponse.payload!.toString() ==
                'public-deducatedWallett') {
          //Rama Here I want to go route to profile or wlaaet same is ok
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          ReadyTripsSortBy(
            classificationId: widget.value,
          ),
          BlocBuilder<AllReadyTripsCubit, AllReadyTripsState>(
            builder: (context, state) {
              if (state is AllReadyTripsSuccess) {
                if (state.allReadyTripsModel.theTrips == null ||
                    state.allReadyTripsModel.theTrips!.isEmpty) {
                  return ErrAnimation(errMessage: 'There is no trips');
                }
                return Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => _refreshData(context),
                    child: ListView.builder(
                      itemCount: state.allReadyTripsModel.theTrips!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 18),
                          child: ReadyTripsCard(
                            value: widget.value,
                            theTrip: state.allReadyTripsModel.theTrips![index],
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else if (state is AllReadyTripsLoading) {
                return Expanded(
                    child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: ShimmerReadyTripsLoading(),
                    );
                  },
                ));
              } else if (state is AllReadyTripsFailure) {
                return ErrAnimation(
                    errMessage: state.errMessage,
                    onPressed: () {
                      if (widget.value == 0) {
                        BlocProvider.of<AllReadyTripsCubit>(context)
                            .getAllReadyTripsFun();
                      } else {
                        BlocProvider.of<AllReadyTripsCubit>(context)
                            .getAllReadyTripsFun(
                                classificationId: widget.value);
                      }
                    });
              } else {
                return ErrAnimation(
                    errMessage: 'Please Try Again ',
                    onPressed: () {
                      if (widget.value == 0) {
                        BlocProvider.of<AllReadyTripsCubit>(context)
                            .getAllReadyTripsFun();
                      } else {
                        BlocProvider.of<AllReadyTripsCubit>(context)
                            .getAllReadyTripsFun(
                                classificationId: widget.value);
                      }
                    });
              }
            },
          )
        ],
      ),
    );
  }
}
