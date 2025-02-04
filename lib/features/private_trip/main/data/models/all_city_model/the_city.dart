class TheCity {
  int? id;
  String? name;
  String? country;

  TheCity({this.id, this.name, this.country});

  factory TheCity.fromJson(Map<String, dynamic> json) => TheCity(
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
