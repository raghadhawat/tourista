import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/widgets/activities_button.dart';
import '../../../../../../core/utlis/styles.dart';
import '../../manager/activities_cubit/activities_cubit.dart';
import 'activities_list_view.dart';
import 'custom_shimmer_activity.dart';

class ActivitiesTabBarView extends StatelessWidget {
  const ActivitiesTabBarView({
    super.key,
    required this.screenWidth,
    required this.tripId,
    required this.tourismTybe,
    required this.dayId,
    required this.dayDate,
  });

  final double screenWidth;
  final int tripId;
  final String tourismTybe;
  final int dayId;
  final String dayDate;
  @override
  Widget build(BuildContext context) {
    DateTime theDate = DateFormat('yyyy-MM-dd').parse(dayDate);

    double height = MediaQuery.of(context).size.height;
    BlocProvider.of<ActivitiesCubit>(context)
        .getTourismPlaces(tourismTybe: tourismTybe, tripId: tripId);

    return BlocBuilder<ActivitiesCubit, ActivitiesState>(
      builder: (context, state) {
        if (state is ActivitiesSuccess) {
          return Stack(children: [
            ActivitiesListView(
              dayId: dayId,
              dayDate: dayDate,
              screenWidth: screenWidth,
              tourismActivitiesModel: state.tourismActivitiesModel,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomAddButton(
                theplan: false,
                screenWidth: screenWidth,
                onTap: () {
                  Navigator.pop(context);
                },
                text: 'Add To ${DateFormat('EEEE d MMMM ').format(theDate)}',
              ),
            )
          ]);
        } else if (state is ActivitiesFailure) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                state.errMessage,
                style: AppStyles.styleSourceSemiBold22(context),
              ),
            ),
          );
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              return CustomShimmerActivity(
                  screenWidth: screenWidth, height: height);
            },
            itemCount: 10,
          );
        }
      },
    );
  }
}
