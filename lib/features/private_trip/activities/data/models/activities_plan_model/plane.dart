class Plane {
  int? tripDayId;
  int? tourismPlaceId;
  int? id;

  Plane({this.tripDayId, this.tourismPlaceId, this.id});

  factory Plane.fromJson(Map<String, dynamic> json) => Plane(
        tripDayId: json['tripDay_id'] as int?,
        tourismPlaceId: json['tourismPlace_id'] as int?,
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'tripDay_id': tripDayId,
        'tourismPlace_id': tourismPlaceId,
        'id': id,
      };
}
