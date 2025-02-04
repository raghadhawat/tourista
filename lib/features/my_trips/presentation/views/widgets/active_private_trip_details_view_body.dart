import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/utlis/service_locator.dart';
import 'package:tourista/core/widgets/loading_widget.dart';
import 'package:tourista/core/widgets/snak_bar_widget.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/cancele_private_trip_button.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/widgets/activities_button.dart';
import 'package:tourista/features/private_trip/the_plan/data/repos/the_plan_repo_impl.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/delete_activities_for_day_cubit/delete_activities_for_day_cubit.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/delete_hotel_cubit/delete_hotel_cubit.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/delete_ticket/delete_ticket_cubit.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/get_user_private_plan_cubit/get_user_private_plan_cubit.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/views/widgets/display_the_activities.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/views/widgets/display_the_hotels.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/views/widgets/display_the_ticket.dart';
import 'package:tourista/core/utlis/functions/show_dialog.dart';

class ActivePrivateTripDetailsViewBody extends StatefulWidget {
  const ActivePrivateTripDetailsViewBody({super.key, required this.tripId});
  final int tripId;
  @override
  State<ActivePrivateTripDetailsViewBody> createState() =>
      _ActivePrivateTripDetailsViewBodyState();
}

class _ActivePrivateTripDetailsViewBodyState
    extends State<ActivePrivateTripDetailsViewBody> {
  String? theDateString;
  bool isActivitiesEmpty = false;
  bool isHotelEmpty = false;
  CustomShowDialog showConfirmationDialog = CustomShowDialog();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DeleteHotelCubit(getIt.get<ThePlanRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => DeleteTicketCubit(getIt.get<ThePlanRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              DeleteActivitiesForDayCubit(getIt.get<ThePlanRepoImpl>()),
        ),
        BlocProvider(
            create: (context) =>
                GetUserPrivatePlanCubit(getIt.get<ThePlanRepoImpl>())
                  ..getUserPrivatePlan(tripId: widget.tripId)),
      ],
      child: BlocBuilder<GetUserPrivatePlanCubit, GetUserPrivatePlanState>(
        builder: (context, state) {
          if (state is GetUserPrivatePlanSuccess) {
            return Container(
              color: Colors.grey.shade100,
              child: Stack(alignment: Alignment.bottomCenter, children: [
                CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          //Ticket
                          DisplayTheTicket(
                            withDeleteIcon: true,
                            text: "There is no Ticket to display",
                            screenWidth: screenWidth,
                            screenHeight: screenHeight,
                            state: state,
                            tripId: widget.tripId,
                            numOfPerson:
                                ((state.getUserPrivatePlanModel.ticket?.price ??
                                            1) /
                                        (state.getUserPrivatePlanModel.ticket
                                                ?.ticket!.price ??
                                            1))
                                    .toInt(),
                          ),
                          //Hotels
                          DisplayTheHotels(
                            withDeleteIcon: true,
                            text: "There is no Hotel to display",
                            screenWidth: screenWidth,
                            screenHeight: screenHeight,
                            state: state,
                            tripId: widget.tripId,
                          ),

                          // Activities
                          DisplayAllActivities(
                            withDeleteIcon: true,
                            text: "There is no Activity to display",
                            screenWidth: screenWidth,
                            state: state,
                            showConfirmationDialog: showConfirmationDialog,
                          ),
                          Gap(screenHeight * .15),
                        ],
                      ),
                    ),
                  ],
                ),
                CustomAddButton(
                  screenWidth: screenWidth,
                  onTap: () {
                    CustomShowDialog().canceleTripDialog(
                        context,
                        CancelePrivateButton(
                          tripId: widget.tripId,
                        ),
                        5);
                  },
                  theplan: false,
                  text: 'Cancele This Trip',
                )
              ]),
            );
          } else if (state is GetUserPrivatePlanFailure) {
            return SnakBarWidget(
              message: state.errMessage,
            );
          } else {
            return const LoadingWidget();
          }
        },
      ),
    );
  }
}
