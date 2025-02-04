import 'all_trip.dart';

class AllTripsModel {
  List<AllTrip>? allTrips;

  AllTripsModel({this.allTrips});

  factory AllTripsModel.fromJson(Map<String, dynamic> json) => AllTripsModel(
        allTrips: (json['AllTrips'] as List<dynamic>?)
            ?.map((e) => AllTrip.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'AllTrips': allTrips?.map((e) => e.toJson()).toList(),
      };
}
