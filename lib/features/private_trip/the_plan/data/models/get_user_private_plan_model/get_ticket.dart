import 'package:tourista/features/private_trip/flights/data/models/tickets_model/ticket.dart';

class GetTicket {
  int? id;
  int? tripId;
  int? ticketId;
  num? price;
  Ticket? ticket;

  GetTicket({this.id, this.tripId, this.ticketId, this.price, this.ticket});

  factory GetTicket.fromJson(Map<String, dynamic> json) => GetTicket(
        id: json['id'] as int?,
        tripId: json['trip_id'] as int?,
        ticketId: json['ticket_id'] as int?,
        price: json['price'] as num?,
        ticket: json['ticket'] == null
            ? null
            : Ticket.fromJson(json['ticket'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'trip_id': tripId,
        'ticket_id': ticketId,
        'price': price,
        'ticket': ticket?.toJson(),
      };
}
