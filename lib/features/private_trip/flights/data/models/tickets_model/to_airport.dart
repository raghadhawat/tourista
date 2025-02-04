class ToAirport {
  int? id;
  String? name;
  String? country;

  ToAirport({this.id, this.name, this.country});

  factory ToAirport.fromJson(Map<String, dynamic> json) => ToAirport(
        id: json['id'] as int?,
        name: json['name'] as String?,
        country: json['country'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'country': country,
      };
}
