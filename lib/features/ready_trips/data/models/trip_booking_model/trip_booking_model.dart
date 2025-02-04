import 'the_booking.dart';

class TripBookingModel {
  String? message;
  TheBooking? theBooking;

  TripBookingModel({this.message, this.theBooking});

  factory TripBookingModel.fromJson(Map<String, dynamic> json) {
    return TripBookingModel(
      message: json['message'] as String?,
      theBooking: json['theBooking:'] == null
          ? null
          : TheBooking.fromJson(json['theBooking:'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'theBooking:': theBooking?.toJson(),
      };
}
