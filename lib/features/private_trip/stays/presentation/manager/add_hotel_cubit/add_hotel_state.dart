part of 'add_hotel_cubit.dart';

@immutable
sealed class AddHotelState {}

final class AddHotelInitial extends AddHotelState {}

final class AddHotelLoading extends AddHotelState {}

final class AddHotelSuccess extends AddHotelState {
  final AddHotelModel addHotelModel;

  AddHotelSuccess({required this.addHotelModel});
}

final class AddHotelFailure extends AddHotelState {
  final String errMessage;

  AddHotelFailure({required this.errMessage});
}
