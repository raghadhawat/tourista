import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/core/utlis/api_server.dart';
import 'package:tourista/features/attractions/data/models/attractions_model/attractions_model.dart';
import 'package:tourista/features/attractions/data/models/public_trip_attractions/public_trip_attractions_model.dart';
import 'package:tourista/features/attractions/data/repos/attraction_repo.dart';

class AttractionsRepoImpl implements AttractionRepo {
  final ApiServer apiServer;

  AttractionsRepoImpl(this.apiServer);

  @override
  Future<Either<Failure, AttractionsModel>> getAttraction() async {
    try {
      var attractionResult = await apiServer.get(endPoint: 'getAttractions');

      AttractionsModel attractionsModel =
          AttractionsModel.fromJson(attractionResult);
      return right(attractionsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PublicTripAttractionsModel>> getPublicTripAttraction({
    required int publicTripId,
  }) async {
    try {
      var publocAttractionResult =
          await apiServer.get(endPoint: 'PublicTripAttraction/$publicTripId');

      PublicTripAttractionsModel publicTripAttractionsModel =
          PublicTripAttractionsModel.fromJson(publocAttractionResult);
      return right(publicTripAttractionsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
