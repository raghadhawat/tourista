import 'activity_model.dart';

class TourismActivitiesModel {
  List<ActivityModel>? activities;

  TourismActivitiesModel({this.activities});

  factory TourismActivitiesModel.fromJson(Map<String, dynamic> json) {
    return TourismActivitiesModel(
      activities: (json['activities'] as List<dynamic>?)
          ?.map((e) => ActivityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'activities': activities?.map((e) => e.toJson()).toList(),
      };
}
