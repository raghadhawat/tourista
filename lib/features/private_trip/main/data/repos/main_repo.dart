import 'package:dartz/dartz.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/features/private_trip/main/data/models/all_city_model/all_city.dart';
import 'package:tourista/features/private_trip/main/data/models/create_trip_model/create_trip_model.dart';

abstract class MainRepo {
  Future<Either<Failure, AllCityModel>> getAllCity({required String city});
  Future<Either<Failure, CreateTripModel>> createTrip(
      {required String idFrom,
      required String idTo,
      required String dateOfTrip,
      required String dateEndOfTrip,
      required String personNumber});
}
