class PublicTrip {
  int? id;
  String? name;
  String? image;
  String? description;
  int? citiesHotelId;
  String? dateOfTrip;
  String? dateEndOfTrip;
  int? display;
  int? discountType;

  PublicTrip({
    this.id,
    this.name,
    this.image,
    this.description,
    this.citiesHotelId,
    this.dateOfTrip,
    this.dateEndOfTrip,
    this.display,
    this.discountType,
  });

  factory PublicTrip.fromJson(Map<String, dynamic> json) => PublicTrip(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        description: json['description'] as String?,
        citiesHotelId: json['citiesHotel_id'] as int?,
        dateOfTrip: json['dateOfTrip'] as String?,
        dateEndOfTrip: json['dateEndOfTrip'] as String?,
        display: json['display'] as int?,
        discountType: json['discountType'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'description': description,
        'citiesHotel_id': citiesHotelId,
        'dateOfTrip': dateOfTrip,
        'dateEndOfTrip': dateEndOfTrip,
        'display': display,
        'discountType': discountType,
      };
}
