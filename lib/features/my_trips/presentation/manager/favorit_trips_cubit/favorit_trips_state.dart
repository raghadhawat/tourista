part of 'favorit_trips_cubit.dart';

@immutable
sealed class FavoritTripsState {}

final class FavoritTripsInitial extends FavoritTripsState {}

final class FavoritTripsLoading extends FavoritTripsState {}

final class FavoritTripsSuccess extends FavoritTripsState {
  final FavoritTripsModel favoritTripsModel;

  FavoritTripsSuccess({required this.favoritTripsModel});
}

final class FavoritTripsFailure extends FavoritTripsState {
  final String errMessage;

  FavoritTripsFailure({required this.errMessage});
}
