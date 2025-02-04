import 'hotel.dart';

class CitiesHotel {
  int? id;
  int? cityId;
  int? hotelId;
  List<dynamic>? images;
  String? description;
  List<dynamic>? features;
  int? avarageOfPrice;
  Hotel? hotel;

  CitiesHotel({
    this.id,
    this.cityId,
    this.hotelId,
    this.images,
    this.description,
    this.features,
    this.avarageOfPrice,
    this.hotel,
  });

  factory CitiesHotel.fromJson(Map<String, dynamic> json) => CitiesHotel(
        id: json['id'] as int?,
        cityId: json['city_id'] as int?,
        hotelId: json['hotel_id'] as int?,
        images: json['images'] as List<dynamic>?,
        description: json['description'] as String?,
        features: json['features'] as List<dynamic>?,
        avarageOfPrice: json['avarageOfPrice'] as int?,
        hotel: json['hotel'] == null
            ? null
            : Hotel.fromJson(json['hotel'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'city_id': cityId,
        'hotel_id': hotelId,
        'images': images,
        'description': description,
        'features': features,
        'avarageOfPrice': avarageOfPrice,
        'hotel': hotel?.toJson(),
      };
}
