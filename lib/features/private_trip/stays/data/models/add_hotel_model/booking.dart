class Booking {
  String? tripId;
  int? roomHotelId;
  int? numberOfRoom;
  String? checkIn;
  String? checkOut;
  int? price;
  int? id;

  Booking({
    this.tripId,
    this.roomHotelId,
    this.numberOfRoom,
    this.checkIn,
    this.checkOut,
    this.price,
    this.id,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        tripId: json['trip_id'] as String?,
        roomHotelId: json['roomHotel_id'] as int?,
        numberOfRoom: json['numberOfRoom'] as int?,
        checkIn: json['checkIn'] as String?,
        checkOut: json['checkOut'] as String?,
        price: json['price'] as int?,
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'trip_id': tripId,
        'roomHotel_id': roomHotelId,
        'numberOfRoom': numberOfRoom,
        'checkIn': checkIn,
        'checkOut': checkOut,
        'price': price,
        'id': id,
      };
}
