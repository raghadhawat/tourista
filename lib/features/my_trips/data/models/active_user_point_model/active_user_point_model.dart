import 'active_user_public_trip.dart';

class ActiveUserPointModel {
  List<ActiveUserPublicTrip>? activeUserPublicTrip;

  ActiveUserPointModel({this.activeUserPublicTrip});

  factory ActiveUserPointModel.fromJson(Map<String, dynamic> json) {
    return ActiveUserPointModel(
      activeUserPublicTrip: (json['activeUserPublicTrip'] as List<dynamic>?)
          ?.map((e) => ActiveUserPublicTrip.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'activeUserPublicTrip':
            activeUserPublicTrip?.map((e) => e.toJson()).toList(),
      };
}
