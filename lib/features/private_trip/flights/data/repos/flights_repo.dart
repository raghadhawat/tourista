import 'package:dartz/dartz.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/features/private_trip/flights/data/models/airport_where_from_model/airport_where_model.dart';
import 'package:tourista/features/private_trip/flights/data/models/choose_ticket_model/choose_ticket_model.dart';
import 'package:tourista/features/private_trip/flights/data/models/tickets_model/tickets_model.dart';

abstract class FlightsRepo {
  Future<Either<Failure, AirportWhereModel>> getAirportFrom(
      {required int cityId});
  Future<Either<Failure, AirportWhereModel>> getAirportTo(
      {required int cityId});
  Future<Either<Failure, TicketsModel>> searchForTickets(
      {required int tripId,
      required int airFromId,
      required int airToId,
      required String cabinClass,
      required String flightsWay});
  Future<Either<Failure, ChooseTicketModel>> chooseTicket(
      {required String tripId, required String ticketId});
}
