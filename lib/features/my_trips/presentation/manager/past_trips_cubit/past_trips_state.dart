part of 'past_trips_cubit.dart';

@immutable
sealed class PastTripsState {}

final class PastTripsInitial extends PastTripsState {}

final class PastTripsLoading extends PastTripsState {}

final class PastTripsSuccess extends PastTripsState {
  final AllTripsModel allTripsModel;

  PastTripsSuccess({required this.allTripsModel});
}

final class PastTripsFailure extends PastTripsState {
  final String errMessage;

  PastTripsFailure({required this.errMessage});
}
