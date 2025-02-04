part of 'cancele_public_trip_cubit.dart';

@immutable
sealed class CancelePublicTripState {}

final class CancelePublicTripInitial extends CancelePublicTripState {}

final class CancelePublicTripLoading extends CancelePublicTripState {}

final class CancelePublicTripSuccess extends CancelePublicTripState {
  final CancelePublicTripModel cancelePublicTripModel;

  CancelePublicTripSuccess({required this.cancelePublicTripModel});
}

final class CancelePublicTripFailure extends CancelePublicTripState {
  final String errMessage;

  CancelePublicTripFailure({required this.errMessage});
}
