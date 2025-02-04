part of 'uncompleted_trips_cubit.dart';

@immutable
sealed class UncompletedTripsState {}

final class UncompletedTripsInitial extends UncompletedTripsState {}

final class UncompletedTripsLoading extends UncompletedTripsState {}

final class UncompletedTripsSuccess extends UncompletedTripsState {
  final UncompletedTripsModel uncompletedTripsModel;

  UncompletedTripsSuccess({required this.uncompletedTripsModel});
}

final class UncompletedTripsFailure extends UncompletedTripsState {
  final String errMessage;

  UncompletedTripsFailure({required this.errMessage});
}
