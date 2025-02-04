import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/features/private_trip/activities/data/models/search_tourism_places_model/search_tourism_places_model.dart';
import '../../../../../../core/utlis/styles.dart';
import 'custom_activity_card.dart';

class SearchResultActivitiesListView extends StatelessWidget {
  const SearchResultActivitiesListView({
    super.key,
    required this.screenWidth,
    required this.searchTourismPlacesModel,
    required this.dayId,
    required this.dayDate,
  });

  final double screenWidth;
  final SearchTourismPlacesModel searchTourismPlacesModel;
  final int dayId;
  final String dayDate;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Gap(15),
      Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Text(
          'Select Three activities at most:',
          style: AppStyles.styleSourceSemiBold22(context),
        ),
      ),
      const Gap(20),
      Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return CustomActivityCard(
              dayDate: dayDate,
              screenWidth: screenWidth,
              activityName: searchTourismPlacesModel.activities![index].name,
              activityDescription:
                  searchTourismPlacesModel.activities![index].description,
              activityImages: searchTourismPlacesModel
                      .activities![index].images?[0] ??
                  'https://images.unsplash.com/photo-1720206811364-684e8f8e803f?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              activityModel: searchTourismPlacesModel.activities![index],
              dayId: dayId,
            );
          },
          itemCount: searchTourismPlacesModel.activities!.length,
        ),
      ),
      const Gap(70)
    ]);
  }
}
