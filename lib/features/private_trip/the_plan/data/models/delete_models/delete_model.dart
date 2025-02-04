class DeleteFromPlanModel {
  String? message;
  String? tripDayId;

  DeleteFromPlanModel({this.message, this.tripDayId});

  factory DeleteFromPlanModel.fromJson(Map<String, dynamic> json) {
    return DeleteFromPlanModel(
      message: json['message'] as String?,
      tripDayId: json['tripDay_id:'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'tripDay_id': tripDayId,
      };
}
