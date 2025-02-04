import 'cities_hotel.dart';
import 'public_trip_place.dart';

class PublicTrip {
  int? id;
  String? name;
  String? image;
  String? description;
  int? citiesHotelId;
  String? dateOfTrip;
  String? dateEndOfTrip;
  int? display;
  int? discountType;
  List<PublicTripPlace>? publicTripPlace;
  CitiesHotel? citiesHotel;

  PublicTrip({
    this.id,
    this.name,
    this.image,
    this.description,
    this.citiesHotelId,
    this.dateOfTrip,
    this.dateEndOfTrip,
    this.display,
    this.discountType,
    this.publicTripPlace,
    this.citiesHotel,
  });

  factory PublicTrip.fromJson(Map<String, dynamic> json) => PublicTrip(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        description: json['description'] as String?,
        citiesHotelId: json['citiesHotel_id'] as int?,
        dateOfTrip: json['dateOfTrip'] as String?,
        dateEndOfTrip: json['dateEndOfTrip'] as String?,
        display: json['display'] as int?,
        discountType: json['discountType'] as int?,
        publicTripPlace: (json['public_trip_place'] as List<dynamic>?)
            ?.map((e) => PublicTripPlace.fromJson(e as Map<String, dynamic>))
            .toList(),
        citiesHotel: json['cities_hotel'] == null
            ? null
            : CitiesHotel.fromJson(
                json['cities_hotel'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'description': description,
        'citiesHotel_id': citiesHotelId,
        'dateOfTrip': dateOfTrip,
        'dateEndOfTrip': dateEndOfTrip,
        'display': display,
        'discountType': discountType,
        'public_trip_place': publicTripPlace?.map((e) => e.toJson()).toList(),
        'cities_hotel': citiesHotel?.toJson(),
      };
}
