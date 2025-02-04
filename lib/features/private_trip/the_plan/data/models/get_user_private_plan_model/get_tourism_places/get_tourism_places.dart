import 'trip_day_place.dart';

class GetTourismPlaces {
  int? id;
  int? tripId;
  String? date;
  List<TripDayPlace>? tripDayPlace;

  GetTourismPlaces({this.id, this.tripId, this.date, this.tripDayPlace});

  factory GetTourismPlaces.fromJson(Map<dynamic, dynamic> json) {
    return GetTourismPlaces(
      id: json['id'] as int?,
      tripId: json['trip_id'] as int?,
      date: json['date'] as String?,
      tripDayPlace: (json['trip_day_place'] as List<dynamic>?)
          ?.map((e) => TripDayPlace.fromJson(e as Map<dynamic, dynamic>))
          .toList(),
    );
  }

  Map<dynamic, dynamic> toJson() => {
        'id': id,
        'trip_id': tripId,
        'date': date,
        'trip_day_place': tripDayPlace?.map((e) => e.toJson()).toList(),
      };
}
