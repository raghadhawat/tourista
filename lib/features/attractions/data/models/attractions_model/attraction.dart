class Attraction {
  int? id;
  String? image;
  int? publicTripId;
  String? description;
  int? display;
  String? type;
  dynamic discount;
  int? discountPoints;
  String? diraction;

  Attraction({
    this.id,
    this.image,
    this.publicTripId,
    this.description,
    this.display,
    this.type,
    this.discount,
    this.discountPoints,
    this.diraction,
  });

  factory Attraction.fromJson(Map<String, dynamic> json) => Attraction(
        id: json['id'] as int?,
        image: json['image'] as String?,
        publicTripId: json['publicTrip_id'] as int?,
        description: json['description'] as String?,
        display: json['display'] as int?,
        type: json['type'] as String?,
        discount: json['discount'] as dynamic,
        discountPoints: json['discount_points'] as int?,
        diraction: json['diraction'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'publicTrip_id': publicTripId,
        'description': description,
        'display': display,
        'type': type,
        'discount': discount,
        'discount_points': discountPoints,
        'diraction': diraction,
      };
}
