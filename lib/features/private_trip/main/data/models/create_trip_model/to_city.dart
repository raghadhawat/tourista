class ToCity {
  int? id;
  String? name;
  String? country;

  ToCity({this.id, this.name, this.country});

  factory ToCity.fromJson(Map<String, dynamic> json) => ToCity(
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
