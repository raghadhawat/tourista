class FromCity {
  int? id;
  String? name;
  String? country;

  FromCity({this.id, this.name, this.country});

  factory FromCity.fromJson(Map<String, dynamic> json) => FromCity(
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
