class Day {
  int? id;
  int? tripId;
  String? date;

  Day({this.id, this.tripId, this.date});

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        id: json['id'] as int?,
        tripId: json['trip_id'] as int?,
        date: json['date'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'trip_id': tripId,
        'date': date,
      };
}
