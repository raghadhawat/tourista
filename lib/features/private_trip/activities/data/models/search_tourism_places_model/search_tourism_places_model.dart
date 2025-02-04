import '../tourism_activities/activity_model.dart';

class SearchTourismPlacesModel {
  List<ActivityModel>? activities;

  SearchTourismPlacesModel({this.activities});

  factory SearchTourismPlacesModel.fromJson(Map<String, dynamic> json) {
    return SearchTourismPlacesModel(
      activities: (json['activities'] as List<dynamic>?)
          ?.map((e) => ActivityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'activities': activities?.map((e) => e.toJson()).toList(),
      };
}
