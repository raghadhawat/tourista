import 'package:tourista/features/private_trip/stays/data/models/hotels_model/hotel.dart';
import 'package:tourista/features/private_trip/the_plan/data/models/get_user_private_plan_model/get_ticket.dart';
import 'get_tourism_places/get_tourism_places.dart';

class GetUserPrivatePlanModel {
  GetTicket? ticket;
  List<Hotel>? hotels;
  int? totalRoomPrice;
  List<GetTourismPlaces>? tourismPlaces;
  double? finalPrice;

  GetUserPrivatePlanModel({
    this.ticket,
    this.hotels,
    this.totalRoomPrice,
    this.tourismPlaces,
    this.finalPrice,
  });

  factory GetUserPrivatePlanModel.fromJson(Map<String, dynamic> json) {
    return GetUserPrivatePlanModel(
      ticket: json['Ticket'] == null
          ? null
          : GetTicket.fromJson(json['Ticket'] as Map<String, dynamic>),
      hotels: (json['Hotels'] as List<dynamic>?)
          ?.map((e) => Hotel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalRoomPrice: json['TotalRoomPrice'] as int?,
      tourismPlaces: (json['TourismPlaces'] as List<dynamic>?)
          ?.map((e) => GetTourismPlaces.fromJson(e as Map<dynamic, dynamic>))
          .toList(),
      finalPrice: (json['FinalPrice'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'Ticket': ticket?.toJson(),
        'Hotels': hotels?.map((e) => e.toJson()).toList(),
        'TotalRoomPrice': totalRoomPrice,
        'TourismPlaces': tourismPlaces?.map((e) => e.toJson()).toList(),
        'FinalPrice': finalPrice,
      };
}
