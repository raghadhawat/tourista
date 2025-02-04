class TheNotifcation {
  int? id;
  int? userId;
  String? body;
  String? event;
  int? tripId;

  TheNotifcation({
    this.id,
    this.userId,
    this.body,
    this.event,
    this.tripId,
  });

  factory TheNotifcation.fromJson(Map<String, dynamic> json) {
    return TheNotifcation(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      body: json['body'] as String?,
      event: json['event'] as String?,
      tripId: json['trip_id'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'body': body,
        'event': event,
        'trip_id': tripId,
      };
}
