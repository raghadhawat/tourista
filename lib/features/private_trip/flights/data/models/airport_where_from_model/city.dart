class City {
  int? id;
  String? name;
  String? country;

  City({this.id, this.name, this.country});

  factory City.fromJson(Map<String, dynamic> json) => City(
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
