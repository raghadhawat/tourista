import 'city.dart';

class PublicTripPoint {
  int? id;
  int? cityId;
  int? publicTripId;
  int? numberOfTickets;
  int? price;
  City? city;

  PublicTripPoint({
    this.id,
    this.cityId,
    this.publicTripId,
    this.numberOfTickets,
    this.price,
    this.city,
  });

  factory PublicTripPoint.fromJson(Map<String, dynamic> json) {
    return PublicTripPoint(
      id: json['id'] as int?,
      cityId: json['city_id'] as int?,
      publicTripId: json['publicTrip_id'] as int?,
      numberOfTickets: json['numberOfTickets'] as int?,
      price: json['price'] as int?,
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'city_id': cityId,
        'publicTrip_id': publicTripId,
        'numberOfTickets': numberOfTickets,
        'price': price,
        'city': city?.toJson(),
      };
}
