part of 'canceled_trips_cubit.dart';

@immutable
sealed class CanceledTripsState {}

final class CanceledTripsInitial extends CanceledTripsState {}

final class CanceledTripsLoading extends CanceledTripsState {}

final class CanceledTripsSuccess extends CanceledTripsState {
  final AllTripsModel allTripsModel;

  CanceledTripsSuccess({required this.allTripsModel});
}

final class CanceledTripsFailure extends CanceledTripsState {
  final String errMessage;

  CanceledTripsFailure({required this.errMessage});
}
