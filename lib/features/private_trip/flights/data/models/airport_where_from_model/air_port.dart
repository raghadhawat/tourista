import 'city.dart';

class AirPort {
  int? id;
  String? name;
  int? cityId;
  City? city;

  AirPort({this.id, this.name, this.cityId, this.city});

  factory AirPort.fromJson(Map<String, dynamic> json) => AirPort(
        id: json['id'] as int?,
        name: json['name'] as String?,
        cityId: json['city_id'] as int?,
        city: json['city'] == null
            ? null
            : City.fromJson(json['city'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'city_id': cityId,
        'city': city?.toJson(),
      };
}
