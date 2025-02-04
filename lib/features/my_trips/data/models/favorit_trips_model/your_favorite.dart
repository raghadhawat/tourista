import 'public_trip.dart';

class YourFavorite {
  int? id;
  int? userId;
  int? publicTripId;
  PublicTrip? publicTrip;

  YourFavorite({this.id, this.userId, this.publicTripId, this.publicTrip});

  factory YourFavorite.fromJson(Map<String, dynamic> json) => YourFavorite(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        publicTripId: json['publicTrip_id'] as int?,
        publicTrip: json['public_trip'] == null
            ? null
            : PublicTrip.fromJson(json['public_trip'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'publicTrip_id': publicTripId,
        'public_trip': publicTrip?.toJson(),
      };
}
