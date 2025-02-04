part of 'create_trip_cubit.dart';

@immutable
sealed class CreateTripState {}

final class CreateTripInitial extends CreateTripState {}

final class CreateTripLoading extends CreateTripState {}

final class CreateTripSuccess extends CreateTripState {
  final CreateTripModel createTripModel;

  CreateTripSuccess({required this.createTripModel});
}

final class CreateTripFailure extends CreateTripState {
  final String errMessage;

  CreateTripFailure({required this.errMessage});
}
