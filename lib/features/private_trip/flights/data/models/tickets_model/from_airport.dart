class FromAirport {
  int? id;
  String? name;
  int? cityId;

  FromAirport({this.id, this.name, this.cityId});

  factory FromAirport.fromJson(Map<String, dynamic> json) => FromAirport(
        id: json['id'] as int?,
        name: json['name'] as String?,
        cityId: json['city_id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'city_id': cityId,
      };
}
