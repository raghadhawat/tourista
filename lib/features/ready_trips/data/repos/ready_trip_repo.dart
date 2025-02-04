import 'package:dartz/dartz.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/features/ready_trips/data/models/add_favourite_model.dart';
import 'package:tourista/features/ready_trips/data/models/all_ready_trips_model/all_ready_trips_model.dart';
import 'package:tourista/features/ready_trips/data/models/ready_trips_details_model/ready_trips_details_model.dart';
import 'package:tourista/features/ready_trips/data/models/ready_trips_point_model/ready_trips_point_model.dart';
import 'package:tourista/features/ready_trips/data/models/trip_booking_model/trip_booking_model.dart';

abstract class ReadyTripsRepo {
  Future<Either<Failure, AllReadyTripsModel>> getAllReadyTrips(
      {int? classificationId, String? sortBy, String? search});
  Future<Either<Failure, ReadyTripsDetailsModel>> getReadyTripDetails(
      {required int tripId});
  Future<Either<Failure, ReadyTripsPointModel>> getReadyTripPoints(
      {required int tripId});
  Future<Either<Failure, AddFavouriteModel>> addFavouriteTrip(
      {required int tripId});
  Future<Either<Failure, TripBookingModel>> bookReadyTrip(
      {required int tripPointId,
      required int ticketsNumber,
      required bool vipTicket,
      required bool pointsOrNot});
}
