part of 'hotel_info_cubit.dart';

@immutable
class HotelInfoState {
  final DateTime? checkIn;
  final DateTime? checkOut;
  final Map<int, dynamic>? rooms;
  final double? price;

  const HotelInfoState(
      {required this.checkIn,
      required this.checkOut,
      required this.rooms,
      required this.price});
  HotelInfoState copyWith(
      {DateTime? checkIn,
      DateTime? checkOut,
      Map<int, dynamic>? rooms,
      double? price}) {
    return HotelInfoState(
      checkIn: checkIn ?? this.checkIn,
      price: price ?? this.price,
      checkOut: checkOut ?? this.checkOut,
      rooms: rooms ?? this.rooms,
    );
  }
}
