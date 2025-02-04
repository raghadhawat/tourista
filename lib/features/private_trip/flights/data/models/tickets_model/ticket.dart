import 'air_line.dart';
import 'from_airport.dart';
import 'to_airport.dart';

class Ticket {
  int? id;
  int? airlineId;
  int? airportId1;
  int? airportId2;
  String? typeOfTicket;
  String? timeOfticket;
  String? roundOrOneTrip;
  String? dateOfTicket;
  String? dateEndOfTicket;
  String? duration;
  double? price;
  int? numOfTickets;
  AirLine? airLine;
  FromAirport? fromAirport;
  ToAirport? toAirport;

  Ticket({
    this.id,
    this.airlineId,
    this.airportId1,
    this.airportId2,
    this.typeOfTicket,
    this.timeOfticket,
    this.roundOrOneTrip,
    this.dateOfTicket,
    this.dateEndOfTicket,
    this.duration,
    this.price,
    this.numOfTickets,
    this.airLine,
    this.fromAirport,
    this.toAirport,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        id: json['id'] as int?,
        airlineId: json['airline_id'] as int?,
        airportId1: json['airport_id1'] as int?,
        airportId2: json['airport_id2'] as int?,
        typeOfTicket: json['typeOfTicket'] as String?,
        timeOfticket: json['timeOfticket'] as String?,
        roundOrOneTrip: json['roundOrOne_trip'] as String?,
        dateOfTicket: json['dateOfTicket'] as String?,
        dateEndOfTicket: json['dateEndOfTicket'] as String?,
        duration: json['duration'] as String?,
        price: (json['price'] as num?)?.toDouble(),
        numOfTickets: json['numOfTickets'] as int?,
        airLine: json['air_line'] == null
            ? null
            : AirLine.fromJson(json['air_line'] as Map<String, dynamic>),
        fromAirport: json['from_airport'] == null
            ? null
            : FromAirport.fromJson(
                json['from_airport'] as Map<String, dynamic>),
        toAirport: json['to_airport'] == null
            ? null
            : ToAirport.fromJson(json['to_airport'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'airline_id': airlineId,
        'airport_id1': airportId1,
        'airport_id2': airportId2,
        'typeOfTicket': typeOfTicket,
        'timeOfticket': timeOfticket,
        'roundOrOne_trip': roundOrOneTrip,
        'dateOfTicket': dateOfTicket,
        'dateEndOfTicket': dateEndOfTicket,
        'duration': duration,
        'price': price,
        'numOfTickets': numOfTickets,
        'air_line': airLine?.toJson(),
        'from_airport': fromAirport?.toJson(),
        'to_airport': toAirport?.toJson(),
      };
}
