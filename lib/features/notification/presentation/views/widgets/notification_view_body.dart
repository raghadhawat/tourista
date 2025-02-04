import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/notification/presentation/manager/all_notificatio_cubit/all_notification_cubit.dart';
import 'package:tourista/features/notification/presentation/views/widgets/notification_card.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllNotificationCubit()..fetchAllNotificationFun(),
      child: BlocBuilder<AllNotificationCubit, AllNotificationState>(
        builder: (context, state) {
          if (state is AllNotificationSuccess) {
            return ListView.builder(
              itemCount: state.allNotificationModel.theNotifcations!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      navigateFromNotification(state, index, context);
                    },
                    child: NotificationCard(
                      title: state
                          .allNotificationModel.theNotifcations![index].body!,
                    ),
                  ),
                );
              },
            );
          }
          if (state is AllNotificationLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AllNotificationFailure) {
            return Center(
              child: Column(
                children: [
                  Text(
                    state.errMessage,
                    style: AppStyles.styleInterMedium19(context),
                  ),
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<AllNotificationCubit>(context)
                          .fetchAllNotificationFun();
                    },
                    child: Text(
                      'Retry',
                      style: AppStyles.styleInterMedium19(context),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: Column(
                children: [
                  Text(
                    'There is an error please try later',
                    style: AppStyles.styleInterMedium19(context),
                  ),
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<AllNotificationCubit>(context)
                          .fetchAllNotificationFun();
                    },
                    child: Text(
                      'Retry',
                      style: AppStyles.styleInterMedium19(context),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }

  void navigateFromNotification(
      AllNotificationSuccess state, int index, BuildContext context) {
    if (state.allNotificationModel.theNotifcations![index].event!.toString() ==
        'new-attraction') {
      GoRouter.of(context).push(AppRouter.kHomeView, extra: 1);
    } else if (state.allNotificationModel.theNotifcations![index].event!
                .toString() ==
            'updatePublicTrip' ||
        state.allNotificationModel.theNotifcations![index].event!.toString() ==
            'public-deducatedPoints') {
      GoRouter.of(context).push(AppRouter.kFromNotificationview,
          extra: state.allNotificationModel.theNotifcations![index].id);
    } else if (state.allNotificationModel.theNotifcations![index].event!
                .toString() ==
            'deletePublicTrip' ||
        state.allNotificationModel.theNotifcations![index].event!.toString() ==
            'deletePublicTripPoint' ||
        state.allNotificationModel.theNotifcations![index].event!.toString() ==
            'add_to_wallet' ||
        state.allNotificationModel.theNotifcations![index].event!.toString() ==
            'restore_money_publicTrip' ||
        state.allNotificationModel.theNotifcations![index].event!.toString() ==
            'deletePublicTrip' ||
        state.allNotificationModel.theNotifcations![index].event!.toString() ==
            'canceledPrivateTrip' ||
        state.allNotificationModel.theNotifcations![index].event!.toString() ==
            'canceledPuplicTrip' ||
        state.allNotificationModel.theNotifcations![index].event!.toString() ==
            'delete_booking_hotel' ||
        state.allNotificationModel.theNotifcations![index].event!.toString() ==
            'booking_private_trip' ||
        state.allNotificationModel.theNotifcations![index].event!.toString() ==
            'private_distroyedAirport' ||
        state.allNotificationModel.theNotifcations![index].event!.toString() ==
            'public-deducatedWallett') {
      //Rama Here I want to go route to profile or wlaaet same is ok
    }
  }
}
