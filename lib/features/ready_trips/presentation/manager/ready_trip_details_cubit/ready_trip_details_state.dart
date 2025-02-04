part of 'ready_trip_details_cubit.dart';

@immutable
sealed class ReadyTripDetailsState {}

final class ReadyTripDetailsInitial extends ReadyTripDetailsState {}

final class ReadyTripDetailsLoading extends ReadyTripDetailsState {}

final class ReadyTripDetailsSuccess extends ReadyTripDetailsState {
  final ReadyTripsDetailsModel readyTripsDetailsModel;

  ReadyTripDetailsSuccess({required this.readyTripsDetailsModel});
}

final class ReadyTripDetailsFailure extends ReadyTripDetailsState {
  final String errMessage;

  ReadyTripDetailsFailure({required this.errMessage});
}
