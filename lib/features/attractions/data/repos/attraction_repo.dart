import 'package:dartz/dartz.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/features/attractions/data/models/attractions_model/attractions_model.dart';
import '../models/public_trip_attractions/public_trip_attractions_model.dart';

abstract class AttractionRepo {
  Future<Either<Failure, AttractionsModel>> getAttraction();
  Future<Either<Failure, PublicTripAttractionsModel>> getPublicTripAttraction({
    required int publicTripId,
  });
}
