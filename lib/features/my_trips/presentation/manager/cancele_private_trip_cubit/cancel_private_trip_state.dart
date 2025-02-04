part of 'cancel_private_trip_cubit.dart';

@immutable
sealed class CancelPrivateTripState {}

final class CancelPrivateTripInitial extends CancelPrivateTripState {}

final class CancelPrivateTripLoading extends CancelPrivateTripState {}

final class CancelPrivateTripSuccess extends CancelPrivateTripState {
  final CancelPrivateTripModel cancelPrivateTripModel;

  CancelPrivateTripSuccess({required this.cancelPrivateTripModel});
}

final class CancelPrivateTripFailure extends CancelPrivateTripState {
  final String errMessage;

  CancelPrivateTripFailure({required this.errMessage});
}
