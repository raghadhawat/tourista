part of 'room_hotel_cubit.dart';

@immutable
sealed class RoomHotelState {}

final class RoomHotelInitial extends RoomHotelState {}

final class RoomHotelLoading extends RoomHotelState {}

final class RoomHotelSuccess extends RoomHotelState {
  final RoomHotelModel roomHotelModel;

  RoomHotelSuccess({required this.roomHotelModel});
}

final class RoomHotelFailure extends RoomHotelState {
  final String errMessage;

  RoomHotelFailure({required this.errMessage});
}
