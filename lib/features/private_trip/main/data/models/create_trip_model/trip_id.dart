import 'from_city.dart';
import 'to_city.dart';

class TripId {
  int id;
  int? userId;
  int? from;
  int? to;
  String? dateOfTrip;
  String? dateEndOfTrip;
  int? numOfPersons;
  int? completed;
  FromCity? fromCity;
  ToCity? toCity;
  String? image;

  TripId({
    required this.id,
    this.userId,
    this.from,
    this.to,
    this.dateOfTrip,
    this.dateEndOfTrip,
    this.numOfPersons,
    this.completed,
    this.fromCity,
    this.toCity,
    this.image,
  });

  factory TripId.fromJson(Map<String, dynamic> json) => TripId(
        id: json['id'] as int,
        userId: json['user_id'] as int?,
        from: json['from'] as int?,
        to: json['to'] as int?,
        dateOfTrip: json['dateOfTrip'] as String?,
        dateEndOfTrip: json['dateEndOfTrip'] as String?,
        numOfPersons: json['numOfPersons'] as int?,
        completed: json['completed'] as int?,
        image: json["image"] as String?,
        fromCity: json['from_city'] == null
            ? null
            : FromCity.fromJson(json['from_city'] as Map<String, dynamic>),
        toCity: json['to_city'] == null
            ? null
            : ToCity.fromJson(json['to_city'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'from': from,
        'to': to,
        'dateOfTrip': dateOfTrip,
        'dateEndOfTrip': dateEndOfTrip,
        'numOfPersons': numOfPersons,
        'completed': completed,
        'from_city': fromCity?.toJson(),
        'to_city': toCity?.toJson(),
      };
}
