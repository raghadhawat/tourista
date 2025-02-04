import 'hotel_info.dart';
import 'review.dart';

class Hotel {
  int? id;
  int? cityId;
  int? hotelId;
  List<dynamic>? images;
  String? description;
  List<dynamic>? features;
  int? avarageOfPrice;
  Review? review;
  HotelInfo? hotelInfo;

  Hotel({
    this.id,
    this.cityId,
    this.hotelId,
    this.images,
    this.description,
    this.features,
    this.avarageOfPrice,
    this.review,
    this.hotelInfo,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        id: json['id'] as int?,
        cityId: json['city_id'] as int?,
        hotelId: json['hotel_id'] as int?,
        images: json['images'] as List<dynamic>?,
        description: json['description'] as String?,
        features: json['features'] as List<dynamic>?,
        avarageOfPrice: json['avarageOfPrice'] as int?,
        review: json['review'] == null
            ? null
            : Review.fromJson(json['review'] as Map<String, dynamic>),
        hotelInfo: json['hotel'] == null
            ? null
            : HotelInfo.fromJson(json['hotel'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'city_id': cityId,
        'hotel_id': hotelId,
        'images': images,
        'description': description,
        'features': features,
        'avarageOfPrice': avarageOfPrice,
        'review': review?.toJson(),
        'hotel': hotelInfo?.toJson(),
      };
}
