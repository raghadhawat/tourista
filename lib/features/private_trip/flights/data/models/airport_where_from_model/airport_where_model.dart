import 'air_port.dart';

class AirportWhereModel {
  String? message;
  List<AirPort>? airPorts;

  AirportWhereModel({this.message, this.airPorts});

  factory AirportWhereModel.fromJson(Map<String, dynamic> json) {
    return AirportWhereModel(
      message: json['message'] as String?,
      airPorts: (json['airPorts'] as List<dynamic>?)
          ?.map((e) => AirPort.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'airPorts': airPorts?.map((e) => e.toJson()).toList(),
      };
}
