import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/functions/custom_success_snack_bar.dart';
import 'package:tourista/core/widgets/loading_widget.dart';
import 'package:tourista/features/private_trip/activities/presentation/manager/get_trip_days_cubit/get_trip_days_cubit.dart';
import '../../../../../core/utlis/functions/custom_snack_bar.dart';
import '../../../../../core/widgets/snak_bar_widget.dart';
import '../../../main/data/models/create_trip_model/create_trip_model.dart';
import '../manager/activities_plan_cubit/activities_plan_cubit.dart';
import '../manager/activity_card_cubit/activity_card_cubit.dart';
import 'widgets/activities_button.dart';
import 'widgets/add_activities_button.dart';
import 'widgets/custom_added_activity_card.dart';
import 'widgets/date_text.dart';

class AddActivitiesViewBody extends StatefulWidget {
  const AddActivitiesViewBody({
    super.key,
    required this.createTripModel,
  });
  final CreateTripModel createTripModel;

  @override
  State<AddActivitiesViewBody> createState() => _AddActivitiesViewBodyState();
}

class _AddActivitiesViewBodyState extends State<AddActivitiesViewBody> {
  String? theDateString;
  DateTime theDate = DateTime.now();
  int dayId = 0;
  Map<String, dynamic> activitiesPlan = {"planes": []};

  @override
  void initState() {
    super.initState();
    getTripDays();
  }

  Future<void> getTripDays() async {
    await BlocProvider.of<GetTripDaysCubit>(context)
        .getTripDays(tripId: widget.createTripModel.tripId!.id);
  }

  @override
  Widget build(BuildContext context) {
    // final cubit = context.read<ActivityCardCubit>();

    print('tripId: ${widget.createTripModel.tripId!.id}'.toString());
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocListener<ActivitiesPlanCubit, ActivitiesPlanState>(
      listener: (context, state) {
        if (state is ActivitiesPlanSuccess) {
          activitiesPlan = {"planes": []};
          customSuccessSnackBar(
              context, "Activities Added Successfully to the plan");
        } else if (state is ActivitiesPlanFailure) {
          customSnackBar(context, state.errMessage);
        }
      },
      child: BlocBuilder<GetTripDaysCubit, GetTripDaysState>(
        builder: (context, state) {
          if (state is GetTripDaysSuccess) {
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        dayId = state.getTripDaysModel.days![index].id!;
                        theDateString =
                            state.getTripDaysModel.days![index].date;
                        return Column(
                          children: [
                            const Gap(20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DateText(theDateString: theDateString!),
                                GestureDetector(
                                    onTap: () {
                                      //    cubit.removeAllActivitiesForDay(state
                                      //    .getTripDaysModel.days![index].id!);
                                      GoRouter.of(context).push(
                                          AppRouter.kActivitiesView,
                                          extra: {
                                            'tripId': widget
                                                .createTripModel.tripId!.id,
                                            'dayId': state.getTripDaysModel
                                                .days![index].id!,
                                            'dayDate': state.getTripDaysModel
                                                .days![index].date
                                          });
                                    },
                                    child: const Icon(
                                      Icons.edit,
                                      size: 18,
                                    ))
                              ],
                            ),
                            const Gap(20),
                            BlocBuilder<ActivityCardCubit, ActivityCardState>(
                              builder: (context, state) {
                                activitiesPlan = {"planes": []};
                                if (state.activitiesCardData != null) {
                                  state.activitiesCardData
                                      ?.forEach((dayId, activities) {
                                    activitiesPlan['planes'].add({
                                      "tripDay_id": dayId,
                                      "places": activities
                                          .map((activity) => activity['id'])
                                          .toList(),
                                    });
                                  });
                                }
                                final activitiesForDay =
                                    state.activitiesCardData?[dayId];

                                return activitiesForDay == null ||
                                        activitiesForDay.isEmpty
                                    ? Align(
                                        alignment: Alignment.center,
                                        child: AddActivitiesButton(
                                          dayId: dayId,
                                          screenWidth: screenWidth,
                                          tripId:
                                              widget.createTripModel.tripId!.id,
                                          dayDate: theDateString!,
                                        ),
                                      )
                                    : CustomAddedActivityCard(
                                        activitiesForDay: activitiesForDay);
                              },
                            ),
                          ],
                        );
                      },
                      itemCount: state.getTripDaysModel.days!.length,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child:
                        BlocBuilder<ActivitiesPlanCubit, ActivitiesPlanState>(
                      builder: (context, state) {
                        if (state is ActivitiesPlanLoading) {
                          return const LoadingWidget();
                        } else {
                          return CustomAddButton(
                            screenWidth: screenWidth,
                            onTap: () {
                              print(activitiesPlan.toString());

                              BlocProvider.of<ActivitiesPlanCubit>(context)
                                  .postActivitiesPlan(body: activitiesPlan);
                            },
                            theplan: false,
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            );
          } else if (state is GetTripDaysFailure) {
            return SnakBarWidget(message: state.errMessage);
          } else {
            return const LoadingWidget();
          }
        },
      ),
    );
  }
}
