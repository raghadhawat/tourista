import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/core/utlis/api_server.dart';
import 'package:tourista/features/private_trip/activities/data/models/activities_plan_model/activities_plan_model.dart';
import 'package:tourista/features/private_trip/activities/data/models/get_trip_days/get_trip_days.dart';
import 'package:tourista/features/private_trip/activities/data/models/search_tourism_places_model/search_tourism_places_model.dart';
import 'package:tourista/features/private_trip/activities/data/repos/activities_repo.dart';

import '../models/tourism_activities/tourism_activities_model.dart';

class ActivitiesRepoImpl implements ActivitiesRepo {
  final ApiServer apiServer;

  ActivitiesRepoImpl(this.apiServer);

  @override
  Future<Either<Failure, TourismActivitiesModel>> getTourismPlaces(
      {required String? tourismTybe, required int tripId}) async {
    try {
      var activitiesData = await apiServer.post(
        endPoint: 'getTourismPlaces/$tripId}',
        body: {
          "type": tourismTybe,
        },
      );
      TourismActivitiesModel tourismActivities =
          TourismActivitiesModel.fromJson(activitiesData);
      return right(tourismActivities);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ActivitiesPlanModel>> postActivitiesPlan(
      {required Map<String, dynamic> body}) async {
    try {
      var activitiesPlanData = await apiServer.post(
          endPoint: 'addPlane',
          body: body,
          headersfromRepo: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          });
      ActivitiesPlanModel activitiesPlanModel =
          ActivitiesPlanModel.fromJson(activitiesPlanData);

      return right(activitiesPlanModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetTripDaysModel>> getTripDays(
      {required int tripId}) async {
    try {
      var getTripDaysData = await apiServer.get(
        endPoint: 'getTripDays/$tripId}',
      );
      GetTripDaysModel getTripDays = GetTripDaysModel.fromJson(getTripDaysData);
      return right(getTripDays);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SearchTourismPlacesModel>> searchTourismPlaces({
    required String search,
    String? type,
    required int tripId,
  }) async {
    try {
      var searchTourismPlaceData = await apiServer.post(
        endPoint: 'searchTourismPlaces/$tripId}',
        body: {
          "search": search,
          "type": type,
        },
      );
      SearchTourismPlacesModel searchTourismPlacesModel =
          SearchTourismPlacesModel.fromJson(searchTourismPlaceData);
      return right(searchTourismPlacesModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
