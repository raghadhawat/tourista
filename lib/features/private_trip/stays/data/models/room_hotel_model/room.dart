class Room {
  int? id;
  int? citiesHotelId;
  String? typeOfRoom;
  String? description;
  int? numberOfRoom;
  int? price;

  Room({
    this.id,
    this.citiesHotelId,
    this.typeOfRoom,
    this.description,
    this.numberOfRoom,
    this.price,
  });

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json['id'] as int?,
        citiesHotelId: json['citiesHotel_id'] as int?,
        typeOfRoom: json['typeOfRoom'] as String?,
        description: json['description'] as String?,
        numberOfRoom: json['numberOfRoom'] as int?,
        price: json['price'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'citiesHotel_id': citiesHotelId,
        'typeOfRoom': typeOfRoom,
        'description': description,
        'numberOfRoom': numberOfRoom,
        'price': price,
      };
}
