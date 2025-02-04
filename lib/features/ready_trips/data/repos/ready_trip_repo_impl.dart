import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/core/utlis/api_server.dart';
import 'package:tourista/features/ready_trips/data/models/add_favourite_model.dart';
import 'package:tourista/features/ready_trips/data/models/all_ready_trips_model/all_ready_trips_model.dart';
import 'package:tourista/features/ready_trips/data/models/ready_trips_details_model/ready_trips_details_model.dart';
import 'package:tourista/features/ready_trips/data/models/ready_trips_point_model/ready_trips_point_model.dart';
import 'package:tourista/features/ready_trips/data/models/trip_booking_model/trip_booking_model.dart';
import 'package:tourista/features/ready_trips/data/repos/ready_trip_repo.dart';

class ReadyTripsRepoImpl implements ReadyTripsRepo {
  final ApiServer apiServer;

  ReadyTripsRepoImpl(this.apiServer);

  @override
  Future<Either<Failure, AllReadyTripsModel>> getAllReadyTrips(
      {int? classificationId, String? sortBy, String? search}) async {
    try {
      Map<String, dynamic> queryParams = {};
      if (classificationId == null &&
          sortBy == null &&
          (search == null || search.isEmpty)) {
        queryParams = {};
      } else if (sortBy == null && (search == null || search.isEmpty)) {
        queryParams = {'classification_id': classificationId};
      } else if (classificationId == null &&
          (search == null || search.isEmpty)) {
        queryParams = {'sortBy': sortBy};
      } else if (classificationId == null && sortBy == null) {
        queryParams = {'search': search};
      } else if (sortBy == null) {
        queryParams = {'classification_id': classificationId, 'search': search};
      } else if (classificationId == null) {
        queryParams = {'sortBy': sortBy, 'search': search};
      } else if (search == null || search.isEmpty) {
        queryParams = {'classification_id': classificationId, 'sortBy': sortBy};
      } else {
        queryParams = {
          'classification_id': classificationId,
          'sortBy': sortBy,
          'search': search
        };
      }
      var data = await apiServer.post(
          endPoint: 'publicTripSortBy',
          token: Hive.box(kTokenBox).get(kTokenRef),
          body: queryParams);
      AllReadyTripsModel allReadyTripsModel = AllReadyTripsModel.fromJson(data);
      return right(allReadyTripsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ReadyTripsDetailsModel>> getReadyTripDetails(
      {required int tripId}) async {
    try {
      var data = await apiServer.get(
        endPoint: 'getPublicTripInfo/$tripId',
      );
      ReadyTripsDetailsModel readyTripsDetailsModel =
          ReadyTripsDetailsModel.fromJson(data);
      return right(readyTripsDetailsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AddFavouriteModel>> addFavouriteTrip(
      {required int tripId}) async {
    try {
      var data = await apiServer
          .post(endPoint: 'faveOrNot/$tripId', token: kToken, body: {});
      AddFavouriteModel addFavouriteModel = AddFavouriteModel.fromJson(data);
      return right(addFavouriteModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ReadyTripsPointModel>> getReadyTripPoints(
      {required int tripId}) async {
    try {
      var data = await apiServer.get(
        endPoint: 'getPublicTripPoints/$tripId',
      );
      ReadyTripsPointModel readyTripsPoint =
          ReadyTripsPointModel.fromJson(data);
      return right(readyTripsPoint);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TripBookingModel>> bookReadyTrip(
      {required int tripPointId,
      required bool pointsOrNot,
      required int ticketsNumber,
      required bool vipTicket}) async {
    try {
      var data = await apiServer
          .post(endPoint: 'bookingPublicTrip', token: kToken, body: {
        'tripPoint_id': tripPointId,
        'numberOfTickets': ticketsNumber,
        'VIP': vipTicket ? 1 : 0,
        'pointsOrNot': pointsOrNot ? 1 : 0
      });
      TripBookingModel tripBookingModel = TripBookingModel.fromJson(data);
      return right(tripBookingModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
