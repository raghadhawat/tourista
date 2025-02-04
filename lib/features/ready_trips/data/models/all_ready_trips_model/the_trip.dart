class TheTrip {
  int? id;
  String? name;
  String? image;
  String? description;
  int? citiesHotelId;
  String? dateOfTrip;
  String? dateEndOfTrip;
  int? display;
  int? discountType;
  bool? favorite;
  int? averagePrice;

  TheTrip(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.citiesHotelId,
      this.dateOfTrip,
      this.dateEndOfTrip,
      this.display,
      this.discountType,
      this.favorite,
      this.averagePrice});

  factory TheTrip.fromJson(Map<String, dynamic> json) => TheTrip(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      citiesHotelId: json['citiesHotel_id'] as int?,
      dateOfTrip: json['dateOfTrip'] as String?,
      dateEndOfTrip: json['dateEndOfTrip'] as String?,
      display: json['display'] as int?,
      discountType: json['discountType'] as int?,
      favorite: json['favorite'] as bool?,
      averagePrice: json['averagePrice'] as int?);

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
        'favorite': favorite,
        'averagePrice': averagePrice
      };
}
