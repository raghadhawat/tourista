class DeleteActivitiesModel {
  String? message;
  String? tripDayId;

  DeleteActivitiesModel({this.message, this.tripDayId});

  factory DeleteActivitiesModel.fromJson(Map<String, dynamic> json) {
    return DeleteActivitiesModel(
      message: json['message'] as String?,
      tripDayId: json['tripDay_id:'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'tripDay_id:': tripDayId,
      };
}
