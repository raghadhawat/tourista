import 'package:dartz/dartz.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/features/private_trip/stays/data/models/add_hotel_model/add_hotel_model.dart';
import 'package:tourista/features/private_trip/stays/data/models/hotels_model/hotels_model.dart';
import 'package:tourista/features/private_trip/stays/data/models/room_hotel_model/room_hotel_model.dart';

abstract class StaysRepo {
  Future<Either<Failure, HotelsModel>> fetchHotels(
      {required int tripId, String? sortBy, String? search});
  Future<Either<Failure, AddHotelModel>> addHotels(
      {required int tripId,
      required String checkIn,
      required String checkOut,
      required List<dynamic> rooms});
  Future<Either<Failure, RoomHotelModel>> fetchRoomHotels(
      {required int hotelId});
}
