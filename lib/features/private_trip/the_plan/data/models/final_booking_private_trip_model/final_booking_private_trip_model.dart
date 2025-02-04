import 'trip.dart';

class FinalBookingPrivateTripModel {
  String? message;
  Trip? trip;

  FinalBookingPrivateTripModel({this.message, this.trip});

  factory FinalBookingPrivateTripModel.fromJson(Map<String, dynamic> json) {
    return FinalBookingPrivateTripModel(
      message: json['message'] as String?,
      trip: json['trip'] == null
          ? null
          : Trip.fromJson(json['trip'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'trip': trip?.toJson(),
      };
}
