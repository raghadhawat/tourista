import 'package:dartz/dartz.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/features/my_trips/data/models/active_user_point_model/active_user_point_model.dart';
import 'package:tourista/features/my_trips/data/models/all_trips_model/all_trips_model.dart';
import 'package:tourista/features/my_trips/data/models/cancel_private_trip_model.dart';
import 'package:tourista/features/my_trips/data/models/cancele_public_trip_model/cancele_public_trip_model.dart';
import 'package:tourista/features/my_trips/data/models/favorit_trips_model/favorit_trips_model.dart';
import 'package:tourista/features/my_trips/data/models/uncompleted_trips_model/uncompleted_trips_model.dart';

abstract class MyTripsRepo {
  Future<Either<Failure, FavoritTripsModel>> getFavoritTrips();
  Future<Either<Failure, AllTripsModel>> getPastTrips();
  Future<Either<Failure, AllTripsModel>> getActiveTrips();
  Future<Either<Failure, AllTripsModel>> getCanceledTrips();
  Future<Either<Failure, ActiveUserPointModel>> getActiveUserPointTrips(
      {required int tripId});
  Future<Either<Failure, UncompletedTripsModel>> getUncompletedTrips();
  Future<Either<Failure, CancelPrivateTripModel>> cancelPrivateTrip(
      {required int tripId});
  Future<Either<Failure, CancelePublicTripModel>> cancelPublicTrip(
      {required int userTripPoint});
}
