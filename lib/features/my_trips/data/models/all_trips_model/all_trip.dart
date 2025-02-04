class AllTrip {
  int? id;
  String? name;
  String? image;
  String? dateOfTrip;
  String? dateEndOfTrip;
  String? type;

  AllTrip({
    this.id,
    this.name,
    this.image,
    this.dateOfTrip,
    this.dateEndOfTrip,
    this.type,
  });

  factory AllTrip.fromJson(Map<String, dynamic> json) => AllTrip(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        dateOfTrip: json['dateOfTrip'] as String?,
        dateEndOfTrip: json['dateEndOfTrip'] as String?,
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'dateOfTrip': dateOfTrip,
        'dateEndOfTrip': dateEndOfTrip,
        'type': type,
      };
}
