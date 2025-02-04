import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/get_user_private_plan_cubit/get_user_private_plan_cubit.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/views/widgets/display_all_activities_for_day.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/views/widgets/the_plan_container.dart';

import '../../../../../../core/utlis/functions/custom_snack_bar.dart';
import '../../../../../../core/widgets/loading_widget.dart';
import '../../../../../../core/utlis/functions/show_dialog.dart';
import '../../../../activities/presentation/manager/activity_card_cubit/activity_card_cubit.dart';
import '../../manager/delete_activities_for_day_cubit/delete_activities_for_day_cubit.dart';

class DisplayAllActivities extends StatelessWidget {
  const DisplayAllActivities({
    super.key,
    required this.screenWidth,
    required this.state,
    required this.showConfirmationDialog,
    required this.text,
    required this.withDeleteIcon,
  });
  final bool withDeleteIcon;
  final double screenWidth;
  final GetUserPrivatePlanSuccess state;
  final CustomShowDialog showConfirmationDialog;
  final String text;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ActivityCardCubit>();

    return BlocListener<DeleteActivitiesForDayCubit,
        DeleteActivitiesForDayState>(
      listener: (context, deleteActivitystate) {
        if (deleteActivitystate is DeleteActivitiesForDaySuccess) {
          String tripDayIdString =
              deleteActivitystate.deleteFromPlanModel.tripDayId!;
          int tripDayId = int.parse(tripDayIdString);
          cubit.removeAllActivitiesForDay(tripDayId);
          print(tripDayId);
          GoRouter.of(context).pop();
          GoRouter.of(context).pop();
          BlocProvider.of<GetUserPrivatePlanCubit>(context).getUserPrivatePlan(
              tripId: state.getUserPrivatePlanModel.tourismPlaces![0].tripId!);
        } else if (deleteActivitystate is DeleteActivitiesForDayFailure) {
          customSnackBar(context, deleteActivitystate.errMessage);
        } else {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const LoadingWidget();
            },
          );
        }
      },
      child: ThePlanContainer(
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
              withDeleteIcon: withDeleteIcon,
              text: text,
              state: state,
              index: index,
              screenWidth: screenWidth,
              showConfirmationDialog: showConfirmationDialog,
            );
          },
        ),
      ),
    );
  }
}
