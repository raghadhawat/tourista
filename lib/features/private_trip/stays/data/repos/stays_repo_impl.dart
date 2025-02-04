import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/core/utlis/api_server.dart';
import 'package:tourista/features/private_trip/stays/data/models/add_hotel_model/add_hotel_model.dart';
import 'package:tourista/features/private_trip/stays/data/models/hotels_model/hotels_model.dart';
import 'package:tourista/features/private_trip/stays/data/models/room_hotel_model/room_hotel_model.dart';
import 'package:tourista/features/private_trip/stays/data/repos/stays_repo.dart';

class StaysRepoImpl implements StaysRepo {
  final ApiServer apiServer;

  StaysRepoImpl(this.apiServer);
  @override
  Future<Either<Failure, HotelsModel>> fetchHotels(
      {required int tripId, String? sortBy, String? search}) async {
    try {
      var data = await apiServer.post(
          endPoint: 'cityHotelsSortBy/$tripId',
          body: sortBy == null && search == null
              ? {}
              : search == null
                  ? {'sortBy': sortBy}
                  : sortBy == null
                      ? {'search': search}
                      : {'sortBy': sortBy, 'search': search});

      HotelsModel hotelsModel = HotelsModel.fromJson(data);

      return right(hotelsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RoomHotelModel>> fetchRoomHotels(
      {required int hotelId}) async {
    try {
      var data = await apiServer.get(
        endPoint: 'getRooms/$hotelId',
      );

      RoomHotelModel roomHotelModel = RoomHotelModel.fromJson(data);

      return right(roomHotelModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AddHotelModel>> addHotels(
      {required int tripId,
      required String checkIn,
      required String checkOut,
      required List<dynamic> rooms}) async {
    try {
      var data = await apiServer.post(
        endPoint: 'addBookingHotel/$tripId',
        body: {"checkIn": checkIn, "checkOut": checkOut, "rooms": rooms},
      );

      AddHotelModel addHotelModel = AddHotelModel.fromJson(data);

      return right(addHotelModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
