class AirLine {
  int? id;
  String? name;
  String? image;

  AirLine({this.id, this.name, this.image});

  factory AirLine.fromJson(Map<String, dynamic> json) => AirLine(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };
}
