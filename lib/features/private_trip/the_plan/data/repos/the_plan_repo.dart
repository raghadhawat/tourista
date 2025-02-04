import 'package:dartz/dartz.dart';
import 'package:tourista/features/private_trip/the_plan/data/models/delete_models/delete_model.dart';
import 'package:tourista/features/private_trip/the_plan/data/models/final_booking_private_trip_model/final_booking_private_trip_model.dart';

import '../../../../../core/errors/failures.dart';
import '../models/get_user_private_plan_model/get_user_private_plan_model.dart';

abstract class ThePlanRepo {
  Future<Either<Failure, GetUserPrivatePlanModel>> getUserPrivatePlan({
    required int tripId,
  });

  Future<Either<Failure, FinalBookingPrivateTripModel>>
      finalBookingPrivateTrip({
    required int tripId,
  });

  Future<Either<Failure, DeleteFromPlanModel>> deleteBookingHotel(
      {required int tripId, required int citiesHotelId});

  Future<Either<Failure, DeleteFromPlanModel>> deleteTicket(
      {required int bookingTicketId});

  Future<Either<Failure, DeleteFromPlanModel>> deleteActivity(
      {required int tripDayId});
}
