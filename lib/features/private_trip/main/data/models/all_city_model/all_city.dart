import 'the_city.dart';

class AllCityModel {
  List<TheCity>? theCities;

  AllCityModel({this.theCities});

  factory AllCityModel.fromJson(Map<String, dynamic> json) => AllCityModel(
        theCities: (json['the Cities :'] as List<dynamic>?)
            ?.map((e) => TheCity.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'the Cities :': theCities?.map((e) => e.toJson()).toList(),
      };
}
