import 'booking.dart';

class AddHotelModel {
  String? message;
  List<Booking>? bookings;
  int? totalPrice;
  int? numberOfNights;

  AddHotelModel({
    this.message,
    this.bookings,
    this.totalPrice,
    this.numberOfNights,
  });

  factory AddHotelModel.fromJson(Map<String, dynamic> json) => AddHotelModel(
        message: json['message'] as String?,
        bookings: (json['bookings'] as List<dynamic>?)
            ?.map((e) => Booking.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalPrice: json['totalPrice'] as int?,
        numberOfNights: json['numberOfNights'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'bookings': bookings?.map((e) => e.toJson()).toList(),
        'totalPrice': totalPrice,
        'numberOfNights': numberOfNights,
      };
}
