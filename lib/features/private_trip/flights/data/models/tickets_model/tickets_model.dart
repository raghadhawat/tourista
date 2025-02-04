import 'ticket.dart';

class TicketsModel {
  String? message;
  int? numberOfFlights;
  List<Ticket>? tickets;

  TicketsModel({this.message, this.numberOfFlights, this.tickets});

  factory TicketsModel.fromJson(Map<String, dynamic> json) => TicketsModel(
        message: json['message'] as String?,
        numberOfFlights: json['numberOfFlights'] as int?,
        tickets: (json['tickets'] as List<dynamic>?)
            ?.map((e) => Ticket.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'numberOfFlights': numberOfFlights,
        'tickets': tickets?.map((e) => e.toJson()).toList(),
      };
}
