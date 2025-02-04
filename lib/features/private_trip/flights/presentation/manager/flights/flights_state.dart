part of 'flights_cubit.dart';

@immutable
class FlightsState {
  final String? cabinClass;
  final String? vlaueCabin;
  final String? flightWay;
  final String? whereFromAirport;
  final int? whereFromAirportId;
  final int? whereToAirportId;
  final String? whereToAirport;

  const FlightsState({
    required this.cabinClass,
    required this.vlaueCabin,
    required this.flightWay,
    required this.whereFromAirport,
    required this.whereFromAirportId,
    required this.whereToAirportId,
    required this.whereToAirport,
  });
  FlightsState copyWith({
    String? cabinClass,
    String? vlaueCabin,
    String? flightWay,
    String? whereFromAirport,
    int? whereFromAirportId,
    int? whereToAirportId,
    String? whereToAirport,
  }) {
    return FlightsState(
      cabinClass: cabinClass ?? this.cabinClass,
      vlaueCabin: vlaueCabin ?? this.vlaueCabin,
      flightWay: flightWay ?? this.flightWay,
      whereFromAirport: whereFromAirport ?? this.whereFromAirport,
      whereFromAirportId: whereFromAirportId ?? this.whereFromAirportId,
      whereToAirportId: whereToAirportId ?? this.whereToAirportId,
      whereToAirport: whereToAirport ?? this.whereToAirport,
    );
  }
}
