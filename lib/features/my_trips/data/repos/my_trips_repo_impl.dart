import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/core/utlis/api_server.dart';
import 'package:tourista/features/my_trips/data/models/active_user_point_model/active_user_point_model.dart';
import 'package:tourista/features/my_trips/data/models/all_trips_model/all_trips_model.dart';
import 'package:tourista/features/my_trips/data/models/cancel_private_trip_model.dart';
import 'package:tourista/features/my_trips/data/models/cancele_public_trip_model/cancele_public_trip_model.dart';
import 'package:tourista/features/my_trips/data/models/favorit_trips_model/favorit_trips_model.dart';
import 'package:tourista/features/my_trips/data/models/uncompleted_trips_model/uncompleted_trips_model.dart';
import 'package:tourista/features/my_trips/data/repos/my_trips_repo.dart';

class MyTripsRepoImpl implements MyTripsRepo {
  final ApiServer apiServer;

  MyTripsRepoImpl(this.apiServer);

  @override
  Future<Either<Failure, FavoritTripsModel>> getFavoritTrips() async {
    try {
      var data = await apiServer.get(
        endPoint: 'favorite',
        token: kToken,
      );
      FavoritTripsModel favoritTripsModel = FavoritTripsModel.fromJson(data);
      return right(favoritTripsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AllTripsModel>> getPastTrips() async {
    try {
      var data = await apiServer.get(
        endPoint: 'pastTrips',
        token: kToken,
      );
      AllTripsModel allTripsModel = AllTripsModel.fromJson(data);
      return right(allTripsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AllTripsModel>> getActiveTrips() async {
    try {
      var data = await apiServer.get(
        endPoint: 'activeTrips',
        token: Hive.box(kTokenBox).get(kTokenRef),
      );
      AllTripsModel allTripsModel = AllTripsModel.fromJson(data);
      return right(allTripsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AllTripsModel>> getCanceledTrips() async {
    try {
      var data = await apiServer.get(
        endPoint: 'getCancelledTrip',
        token: kToken,
      );
      AllTripsModel allTripsModel = AllTripsModel.fromJson(data);
      return right(allTripsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CancelPrivateTripModel>> cancelPrivateTrip(
      {required int tripId}) async {
    try {
      var data = await apiServer
          .post(endPoint: 'cancelePrivateTripe/$tripId', body: {});
      CancelPrivateTripModel cancelPrivateTripModel =
          CancelPrivateTripModel.fromJson(data);
      return right(cancelPrivateTripModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CancelePublicTripModel>> cancelPublicTrip(
      {required int userTripPoint}) async {
    try {
      var data = await apiServer
          .post(endPoint: 'cancelPublicTrip/$userTripPoint', body: {});
      CancelePublicTripModel cancelePublicTripModel =
          CancelePublicTripModel.fromJson(data);
      return right(cancelePublicTripModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UncompletedTripsModel>> getUncompletedTrips() async {
    try {
      var data = await apiServer.get(
        endPoint: 'getUnderConstructionTrip?',
        token: kToken,
      );
      UncompletedTripsModel uncompletedTripsModel =
          UncompletedTripsModel.fromJson(data);
      return right(uncompletedTripsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ActiveUserPointModel>> getActiveUserPointTrips(
      {required int tripId}) async {
    try {
      var data = await apiServer.get(
        endPoint: 'getActiveUserPublicTrip/$tripId',
        token: kToken,
      );
      ActiveUserPointModel activeUserPointModel =
          ActiveUserPointModel.fromJson(data);
      return right(activeUserPointModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
