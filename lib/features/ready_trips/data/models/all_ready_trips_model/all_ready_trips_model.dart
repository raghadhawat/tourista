import 'the_trip.dart';

class AllReadyTripsModel {
  List<TheTrip>? theTrips;

  AllReadyTripsModel({this.theTrips});

  factory AllReadyTripsModel.fromJson(Map<String, dynamic> json) {
    return AllReadyTripsModel(
      theTrips: (json['theTrips'] as List<dynamic>?)
          ?.map((e) => TheTrip.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'theTrips': theTrips?.map((e) => e.toJson()).toList(),
      };
}
