import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/features/private_trip/activities/presentation/manager/search_activity_cubit/search_activity_cubit.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/widgets/activities_button.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/widgets/search_result_activities_list.dart';
import '../../../../../../core/utlis/styles.dart';
import 'custom_shimmer_activity.dart';

class ActivitiesSearchResultTabBarView extends StatelessWidget {
  const ActivitiesSearchResultTabBarView({
    super.key,
    required this.screenWidth,
    required this.tripId,
    required this.dayId,
    required this.dayDate,
  });

  final double screenWidth;
  final int tripId;
  final int dayId;
  final String dayDate;
  @override
  Widget build(BuildContext context) {
    DateTime theDate = DateFormat('yyyy-MM-dd').parse(dayDate);
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<SearchActivityCubit, SearchActivityState>(
      builder: (context, state) {
        if (state is SearchActivitySuccess) {
          return Stack(children: [
            SearchResultActivitiesListView(
              dayId: dayId,
              dayDate: dayDate,
              screenWidth: screenWidth,
              searchTourismPlacesModel: state.searchTourismPlacesModel,
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
        } else if (state is SearchActivityFailure) {
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
