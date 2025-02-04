import 'public_trip.dart';

class CancelePublicTripModel {
  String? message;
  int? refundAmount;
  PublicTrip? publicTrip;

  CancelePublicTripModel({
    this.message,
    this.refundAmount,
    this.publicTrip,
  });

  factory CancelePublicTripModel.fromJson(Map<String, dynamic> json) {
    return CancelePublicTripModel(
      message: json['message'] as String?,
      refundAmount: json['refundAmount'] as int?,
      publicTrip: json['publicTrip'] == null
          ? null
          : PublicTrip.fromJson(json['publicTrip'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'refundAmount': refundAmount,
        'publicTrip': publicTrip?.toJson(),
      };
}
