import 'public_trip_point.dart';

class ReadyTripsPointModel {
  List<PublicTripPoint>? publicTripPoints;

  ReadyTripsPointModel({this.publicTripPoints});

  factory ReadyTripsPointModel.fromJson(Map<String, dynamic> json) {
    return ReadyTripsPointModel(
      publicTripPoints: (json['publicTripPoints'] as List<dynamic>?)
          ?.map((e) => PublicTripPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'publicTripPoints': publicTripPoints?.map((e) => e.toJson()).toList(),
      };
}
