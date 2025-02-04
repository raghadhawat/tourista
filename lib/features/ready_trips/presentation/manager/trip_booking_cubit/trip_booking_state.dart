part of 'trip_booking_cubit.dart';

@immutable
sealed class TripBookingState {}

final class TripBookingInitial extends TripBookingState {}

final class TripBookingLoading extends TripBookingState {}

final class TripBookingSuccess extends TripBookingState {
  final TripBookingModel tripBookingModel;

  TripBookingSuccess({required this.tripBookingModel});
}

final class TripBookingFailure extends TripBookingState {
  final String errMessage;

  TripBookingFailure({required this.errMessage});
}
