part of 'get_trip_days_cubit.dart';

@immutable
sealed class GetTripDaysState {}

final class GetTripDaysInitial extends GetTripDaysState {}

class GetTripDaysLoading extends GetTripDaysState {}

class GetTripDaysSuccess extends GetTripDaysState {
  final GetTripDaysModel getTripDaysModel;

  GetTripDaysSuccess(this.getTripDaysModel);
}

class GetTripDaysFailure extends GetTripDaysState {
  final String errMessage;

  GetTripDaysFailure(this.errMessage);
}
