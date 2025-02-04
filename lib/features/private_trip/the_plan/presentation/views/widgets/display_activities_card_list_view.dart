import 'package:flutter/cupertino.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/views/widgets/display_activity_card.dart';

import '../../manager/get_user_private_plan_cubit/get_user_private_plan_cubit.dart';

class DisplayActivitiesCardListView extends StatelessWidget {
  const DisplayActivitiesCardListView({
    super.key,
    required this.state,
    required this.index,
  });
  final GetUserPrivatePlanSuccess state;
  final int index;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: state
            .getUserPrivatePlanModel.tourismPlaces![index].tripDayPlace!.length,
        itemBuilder: (context, activitiesindex) {
          return DisplayActivityCard(
            imageUrl: state.getUserPrivatePlanModel.tourismPlaces![index]
                .tripDayPlace![activitiesindex].tourismPlace!.images![0],
            activityName: state.getUserPrivatePlanModel.tourismPlaces![index]
                .tripDayPlace![activitiesindex].tourismPlace!.name!,
            activityDescription: state
                .getUserPrivatePlanModel
                .tourismPlaces![index]
                .tripDayPlace![activitiesindex]
                .tourismPlace!
                .description!,
          );
        });
  }
}
