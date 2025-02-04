class TheTicketId {
  String? tripId;
  String? ticketId;
  double? price;
  int? id;

  TheTicketId({this.tripId, this.ticketId, this.price, this.id});

  factory TheTicketId.fromJson(Map<String, dynamic> json) => TheTicketId(
        tripId: json['trip_id'] as String?,
        ticketId: json['ticket_id'] as String?,
        price: (json['price'] as num?)?.toDouble(),
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'trip_id': tripId,
        'ticket_id': ticketId,
        'price': price,
        'id': id,
      };
}
