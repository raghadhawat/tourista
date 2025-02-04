class TheBooking {
  int? userId;
  int? tripPointId;
  int? numberOfTickets;
  int? price;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  TheBooking({
    this.userId,
    this.tripPointId,
    this.numberOfTickets,
    this.price,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory TheBooking.fromJson(Map<String, dynamic> json) => TheBooking(
        userId: json['user_id'] as int?,
        tripPointId: json['tripPoint_id'] as int?,
        numberOfTickets: json['numberOfTickets'] as int?,
        price: json['price'] as int?,
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'tripPoint_id': tripPointId,
        'numberOfTickets': numberOfTickets,
        'price': price,
        'updated_at': updatedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'id': id,
      };
}
