import 'tourism_place.dart';

class TripDayPlace {
  int? id;
  int? tripDayId;
  int? tourismPlaceId;
  TourismPlace? tourismPlace;

  TripDayPlace({
    this.id,
    this.tripDayId,
    this.tourismPlaceId,
    this.tourismPlace,
  });

  factory TripDayPlace.fromJson(Map<dynamic, dynamic> json) => TripDayPlace(
        id: json['id'] as int?,
        tripDayId: json['tripDay_id'] as int?,
        tourismPlaceId: json['tourismPlace_id'] as int?,
        tourismPlace: json['tourism_place'] == null
            ? null
            : TourismPlace.fromJson(
                json['tourism_place'] as Map<dynamic, dynamic>),
      );

  Map<dynamic, dynamic> toJson() => {
        'id': id,
        'tripDay_id': tripDayId,
        'tourismPlace_id': tourismPlaceId,
        'tourism_place': tourismPlace?.toJson(),
      };
}
