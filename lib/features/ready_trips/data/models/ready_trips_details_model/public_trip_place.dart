import 'tourism_place.dart';

class PublicTripPlace {
  int? id;
  int? tourismPlacesId;
  int? publicTripId;
  TourismPlace? tourismPlace;

  PublicTripPlace({
    this.id,
    this.tourismPlacesId,
    this.publicTripId,
    this.tourismPlace,
  });

  factory PublicTripPlace.fromJson(Map<String, dynamic> json) {
    return PublicTripPlace(
      id: json['id'] as int?,
      tourismPlacesId: json['tourismPlaces_id'] as int?,
      publicTripId: json['publicTrip_id'] as int?,
      tourismPlace: json['tourism_place'] == null
          ? null
          : TourismPlace.fromJson(
              json['tourism_place'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'tourismPlaces_id': tourismPlacesId,
        'publicTrip_id': publicTripId,
        'tourism_place': tourismPlace?.toJson(),
      };
}
