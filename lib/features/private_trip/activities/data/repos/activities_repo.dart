import 'package:dartz/dartz.dart';
import 'package:tourista/features/private_trip/activities/data/models/get_trip_days/get_trip_days.dart';
import 'package:tourista/features/private_trip/activities/data/models/search_tourism_places_model/search_tourism_places_model.dart';

import '../../../../../core/errors/failures.dart';
import '../models/activities_plan_model/activities_plan_model.dart';
import '../models/tourism_activities/tourism_activities_model.dart';

abstract class ActivitiesRepo {
  Future<Either<Failure, TourismActivitiesModel>> getTourismPlaces({
    required String tourismTybe,
    required int tripId,
  });

  Future<Either<Failure, ActivitiesPlanModel>> postActivitiesPlan({
    required Map<String, dynamic> body,
  });

  Future<Either<Failure, GetTripDaysModel>> getTripDays({
    required int tripId,
  });

  Future<Either<Failure, SearchTourismPlacesModel>> searchTourismPlaces({
    required String search,
    String? type,
    required int tripId,
  });
}
