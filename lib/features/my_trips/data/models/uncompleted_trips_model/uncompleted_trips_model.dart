import 'package:tourista/features/private_trip/main/data/models/create_trip_model/trip_id.dart';

class UncompletedTripsModel {
  List<TripId>? underConstructionTrip;

  UncompletedTripsModel({this.underConstructionTrip});

  factory UncompletedTripsModel.fromJson(Map<String, dynamic> json) {
    return UncompletedTripsModel(
      underConstructionTrip: (json['UnderConstructionTrip'] as List<dynamic>?)
          ?.map((e) => TripId.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'UnderConstructionTrip':
            underConstructionTrip?.map((e) => e.toJson()).toList(),
      };
}
