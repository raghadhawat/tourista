import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/core/utlis/api_server.dart';
import 'package:tourista/features/private_trip/main/data/models/all_city_model/all_city.dart';
import 'package:tourista/features/private_trip/main/data/models/create_trip_model/create_trip_model.dart';
import 'package:tourista/features/private_trip/main/data/repos/main_repo.dart';

class MainRepoImpl implements MainRepo {
  final ApiServer apiServer;

  MainRepoImpl(this.apiServer);
  @override
  Future<Either<Failure, AllCityModel>> getAllCity(
      {required String city}) async {
    try {
      var data = await apiServer.get(
        endPoint: 'searchCity/$city',
      );
      AllCityModel allCityModel = AllCityModel.fromJson(data);
      return right(allCityModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CreateTripModel>> createTrip(
      {required String idFrom,
      required String idTo,
      required String dateOfTrip,
      required String dateEndOfTrip,
      required String personNumber}) async {
    try {
      var data = await apiServer.post(
          endPoint: 'createTrip',
          body: {
            'from': idFrom,
            'to': idTo,
            'dateOfTrip': dateOfTrip,
            'dateEndOfTrip': dateEndOfTrip,
            'numOfPersons': personNumber
          },
          token: Hive.box(kTokenBox).get(kTokenRef));
      print(Hive.box(kTokenBox).get(kTokenRef));

      CreateTripModel createTripModel = CreateTripModel.fromJson(data);
      return right(createTripModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
