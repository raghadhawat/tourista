import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tourista/features/private_trip/the_plan/data/models/delete_models/delete_model.dart';
import 'package:tourista/features/private_trip/the_plan/data/models/final_booking_private_trip_model/final_booking_private_trip_model.dart';
import 'package:tourista/features/private_trip/the_plan/data/repos/the_plan_repo.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/utlis/api_server.dart';
import '../models/get_user_private_plan_model/get_user_private_plan_model.dart';

class ThePlanRepoImpl implements ThePlanRepo {
  final ApiServer apiServer;

  ThePlanRepoImpl(this.apiServer);

  @override
  Future<Either<Failure, GetUserPrivatePlanModel>> getUserPrivatePlan(
      {required int tripId}) async {
    try {
      var userPlanData = await apiServer.get(
        endPoint: 'getUserPlane/$tripId',
      );
      GetUserPrivatePlanModel getUserPrivatePlanModel =
          GetUserPrivatePlanModel.fromJson(userPlanData);
      return right(getUserPrivatePlanModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, FinalBookingPrivateTripModel>> finalBookingPrivateTrip(
      {required int tripId}) async {
    try {
      var finalBookingData = await apiServer.post(
        endPoint: 'bookingTrip/$tripId',
        body: null,
      );
      FinalBookingPrivateTripModel finalBookingPrivateTripModel =
          FinalBookingPrivateTripModel.fromJson(finalBookingData);
      return right(finalBookingPrivateTripModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DeleteFromPlanModel>> deleteBookingHotel(
      {required int tripId, required int citiesHotelId}) async {
    try {
      var deletedata = await apiServer.delete(
        endPoint: 'deleteBookingHotel/$tripId/$citiesHotelId',
      );
      DeleteFromPlanModel deleteFromPlanModel =
          DeleteFromPlanModel.fromJson(deletedata);
      return right(deleteFromPlanModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DeleteFromPlanModel>> deleteTicket(
      {required int bookingTicketId}) async {
    try {
      var deletedata = await apiServer.delete(
        endPoint: 'deleteTicket/$bookingTicketId',
      );
      DeleteFromPlanModel deleteFromPlanModel =
          DeleteFromPlanModel.fromJson(deletedata);
      return right(deleteFromPlanModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DeleteFromPlanModel>> deleteActivity(
      {required int tripDayId}) async {
    try {
      var deletedata = await apiServer.delete(
        endPoint: 'deleteActivities/$tripDayId',
      );
      DeleteFromPlanModel deleteFromPlanModel =
          DeleteFromPlanModel.fromJson(deletedata);
      return right(deleteFromPlanModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
