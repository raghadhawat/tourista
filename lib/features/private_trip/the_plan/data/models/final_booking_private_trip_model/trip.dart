class Trip {
  String? tripId;
  double? price;
  int? id;

  Trip({this.tripId, this.price, this.id});

  factory Trip.fromJson(Map<String, dynamic> json) => Trip(
        tripId: json['trip_id'] as String?,
        price: (json['price'] as num?)?.toDouble(),
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'trip_id': tripId,
        'price': price,
        'id': id,
      };
}
