part of 'all_ready_trips_cubit.dart';

@immutable
sealed class AllReadyTripsState {}

final class AllReadyTripsInitial extends AllReadyTripsState {}

final class AllReadyTripsLoading extends AllReadyTripsState {}

final class AllReadyTripsSuccess extends AllReadyTripsState {
  final AllReadyTripsModel allReadyTripsModel;

  AllReadyTripsSuccess({required this.allReadyTripsModel});
}

final class AllReadyTripsFailure extends AllReadyTripsState {
  final String errMessage;

  AllReadyTripsFailure({required this.errMessage});
}
