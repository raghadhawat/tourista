class CancelDelayTrips {
  String? message;

  CancelDelayTrips({this.message});

  factory CancelDelayTrips.fromJson(Map<String, dynamic> json) {
    return CancelDelayTrips(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
      };
}
