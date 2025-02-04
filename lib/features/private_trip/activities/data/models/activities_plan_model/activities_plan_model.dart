import 'plane.dart';

class ActivitiesPlanModel {
  String? message;
  List<Plane>? planes;

  ActivitiesPlanModel({this.message, this.planes});

  factory ActivitiesPlanModel.fromJson(Map<String, dynamic> json) {
    return ActivitiesPlanModel(
      message: json['message'] as String?,
      planes: (json['Planes'] as List<dynamic>?)
          ?.map((e) => Plane.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'Planes': planes?.map((e) => e.toJson()).toList(),
      };
}
