part of 'trip_info_cubit.dart';

@immutable
class TripInfoState {
  final int? pointId;
  final int? price;
  final int? ticketNumber;
  final String? pointName;
  final bool? vipTicket;
  final bool? pointsOrNot;

  const TripInfoState({
    required this.vipTicket,
    required this.ticketNumber,
    required this.pointId,
    required this.price,
    required this.pointName,
    required this.pointsOrNot,
  });
  TripInfoState copyWith(
      {int? pointId,
      String? pointName,
      int? price,
      int? ticketNumber,
      bool? vipTicket,
      bool? pointsOrNot}) {
    return TripInfoState(
        price: price ?? this.price,
        vipTicket: vipTicket ?? this.vipTicket,
        pointsOrNot: pointsOrNot ?? this.pointsOrNot,
        ticketNumber: ticketNumber ?? this.ticketNumber,
        pointId: pointId ?? this.pointId,
        pointName: pointName ?? this.pointName);
  }
}
