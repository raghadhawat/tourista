part of 'final_booking_private_trip_cubit.dart';

@immutable
sealed class FinalBookingPrivateTripState {}

final class FinalBookingPrivateTripInitial
    extends FinalBookingPrivateTripState {}

class FinalBookingPrivateTripLoading extends FinalBookingPrivateTripState {}

class FinalBookingPrivateTripSuccess extends FinalBookingPrivateTripState {
  final FinalBookingPrivateTripModel finalBookingPrivateTripModel;

  FinalBookingPrivateTripSuccess(this.finalBookingPrivateTripModel);
}

class FinalBookingPrivateTripFailure extends FinalBookingPrivateTripState {
  final String errMessage;

  FinalBookingPrivateTripFailure(this.errMessage);
}
