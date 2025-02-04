import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/utlis/service_locator.dart';
import 'package:tourista/core/widgets/loading_widget.dart';
import 'package:tourista/core/widgets/snak_bar_widget.dart';
import 'package:tourista/features/private_trip/main/data/models/create_trip_model/create_trip_model.dart';
import 'package:tourista/features/private_trip/the_plan/data/repos/the_plan_repo_impl.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/delete_activities_for_day_cubit/delete_activities_for_day_cubit.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/delete_hotel_cubit/delete_hotel_cubit.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/delete_ticket/delete_ticket_cubit.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/get_user_private_plan_cubit/get_user_private_plan_cubit.dart';
import 'package:tourista/core/utlis/functions/show_dialog.dart';
import 'widgets/display_the_activities.dart';
import 'widgets/display_the_hotels.dart';
import 'widgets/display_the_ticket.dart';
import 'widgets/final_booking_button.dart';

class ThePlanViewBody extends StatefulWidget {
  const ThePlanViewBody({super.key, required this.createTripModel});
  final CreateTripModel createTripModel;

  @override
  State<ThePlanViewBody> createState() => _ThePlanViewBodyState();
}

class _ThePlanViewBodyState extends State<ThePlanViewBody> {
  String? theDateString;
  DateTime theDate = DateTime.now();
  bool isActivitiesEmpty = false;
  bool isHotelEmpty = false;
  CustomShowDialog showConfirmationDialog = CustomShowDialog();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetUserPrivatePlanCubit>(context)
        .getUserPrivatePlan(tripId: widget.createTripModel.tripId!.id);
  }

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
                            text:
                                'Go To Flight and add The perfect Ticket for you',
                            screenWidth: screenWidth,
                            screenHeight: screenHeight,
                            state: state,
                            tripId: widget.createTripModel.tripId!.id,
                            numOfPerson:
                                widget.createTripModel.tripId!.numOfPersons!,
                          ),
                          //Hotels
                          DisplayTheHotels(
                            withDeleteIcon: true,
                            text:
                                'Go To Stays and add The perfect hotel for you',
                            screenWidth: screenWidth,
                            screenHeight: screenHeight,
                            state: state,
                            tripId: widget.createTripModel.tripId!.id,
                          ),

                          // Activities
                          DisplayAllActivities(
                            withDeleteIcon: true,
                            text:
                                'Go To Activities and add The perfect Activities for you',
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
                FinalBookingButton(
                  showConfirmationDialog: showConfirmationDialog,
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  widget: widget,
                  finalPrice: state.getUserPrivatePlanModel.finalPrice!,
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
