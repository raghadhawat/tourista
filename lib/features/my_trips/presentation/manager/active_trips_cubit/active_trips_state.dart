part of 'active_trips_cubit.dart';

@immutable
sealed class ActiveTripsState {}

final class ActiveTripsInitial extends ActiveTripsState {}

final class ActiveTripsLoading extends ActiveTripsState {}

final class ActiveTripsSuccess extends ActiveTripsState {
  final AllTripsModel allTripsModel;

  ActiveTripsSuccess({required this.allTripsModel});
}

final class ActiveTripsFailure extends ActiveTripsState {
  final String errMessage;

  ActiveTripsFailure({required this.errMessage});
}
