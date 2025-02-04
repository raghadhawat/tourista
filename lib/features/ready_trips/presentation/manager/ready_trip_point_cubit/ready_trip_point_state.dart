part of 'ready_trip_point_cubit.dart';

@immutable
sealed class ReadyTripPointState {}

final class ReadyTripPointInitial extends ReadyTripPointState {}

final class ReadyTripPointLoading extends ReadyTripPointState {}

final class ReadyTripPointSuccess extends ReadyTripPointState {
  final ReadyTripsPointModel readyTripsPointModel;

  ReadyTripPointSuccess({required this.readyTripsPointModel});
}

final class ReadyTripPointFailure extends ReadyTripPointState {
  final String errMessage;

  ReadyTripPointFailure({required this.errMessage});
}
