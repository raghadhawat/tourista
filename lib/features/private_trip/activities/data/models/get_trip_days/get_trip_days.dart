import 'day.dart';

class GetTripDaysModel {
  List<Day>? days;

  GetTripDaysModel({this.days});

  factory GetTripDaysModel.fromJson(Map<String, dynamic> json) =>
      GetTripDaysModel(
        days: (json['Days'] as List<dynamic>?)
            ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'Days': days?.map((e) => e.toJson()).toList(),
      };
}
