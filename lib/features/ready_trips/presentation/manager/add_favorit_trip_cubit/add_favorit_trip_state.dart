part of 'add_favorit_trip_cubit.dart';

@immutable
sealed class AddFavoritTripState {}

final class AddFavoritTripInitial extends AddFavoritTripState {}

final class AddFavoritTripSuccess extends AddFavoritTripState {
  final AddFavouriteModel addFavouriteModel;

  AddFavoritTripSuccess({required this.addFavouriteModel});
}

final class AddFavoritTripFailure extends AddFavoritTripState {
  final String errMessage;

  AddFavoritTripFailure({required this.errMessage});
}
