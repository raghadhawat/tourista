import 'public_trip.dart';

class ReadyTripsDetailsModel {
  PublicTrip? publicTrip;

  ReadyTripsDetailsModel({this.publicTrip});

  factory ReadyTripsDetailsModel.fromJson(Map<String, dynamic> json) {
    return ReadyTripsDetailsModel(
      publicTrip: json['publicTrip'][0] == null
          ? null
          : PublicTrip.fromJson(json['publicTrip'][0] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'publicTrip': publicTrip?.toJson(),
      };
}
