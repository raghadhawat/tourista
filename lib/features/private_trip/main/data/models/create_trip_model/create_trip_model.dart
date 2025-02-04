import 'trip_id.dart';

class CreateTripModel {
  String? message;
  TripId? tripId;

  CreateTripModel({this.message, this.tripId});

  factory CreateTripModel.fromJson(Map<String, dynamic> json) {
    return CreateTripModel(
      message: json['message'] as String?,
      tripId: json['trip_id'][0] == null
          ? null
          : TripId.fromJson(json['trip_id'][0] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'trip_id': tripId?.toJson(),
      };
}
