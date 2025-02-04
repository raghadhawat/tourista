import 'package:flutter/material.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/get_user_private_plan_cubit/get_user_private_plan_cubit.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/views/widgets/display_all_activities_for_day.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/views/widgets/the_plan_container.dart';
import 'package:tourista/core/utlis/functions/show_dialog.dart';

class ActivitiesPrivateContainer extends StatelessWidget {
  const ActivitiesPrivateContainer({
    super.key,
    required this.screenWidth,
    required this.showConfirmationDialog,
    required this.state,
  });

  final double screenWidth;
  final CustomShowDialog showConfirmationDialog;
  final GetUserPrivatePlanSuccess state;
  @override
  Widget build(BuildContext context) {
    return ThePlanContainer(
      withDeleteIcon: false,
      data: 'All Activities',
      screenwidth: screenWidth,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: state.getUserPrivatePlanModel.tourismPlaces!.length,
        itemBuilder: (context, index) {
          return DisplayAllActivitiesForDay(
            withDeleteIcon: false,
            text: "There is no Activity to display",
            state: state,
            index: index,
            screenWidth: screenWidth,
            showConfirmationDialog: showConfirmationDialog,
          );
        },
      ),
    );
  }
}
