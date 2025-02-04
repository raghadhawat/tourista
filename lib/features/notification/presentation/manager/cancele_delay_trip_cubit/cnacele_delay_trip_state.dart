part of 'cnacele_delay_trip_cubit.dart';

@immutable
sealed class CnaceleDelayTripState {}

final class CnaceleDelayTripInitial extends CnaceleDelayTripState {}

final class CnaceleDelayTripLoading extends CnaceleDelayTripState {}

final class CnaceleDelayTripSuccess extends CnaceleDelayTripState {
  final CancelDelayTrips cancelDelayTrips;

  CnaceleDelayTripSuccess({required this.cancelDelayTrips});
}

final class CnaceleDelayTripFailure extends CnaceleDelayTripState {
  final String errMessage;

  CnaceleDelayTripFailure({required this.errMessage});
}
