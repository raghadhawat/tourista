import 'attraction.dart';

class AttractionsModel {
  List<Attraction>? attraction;

  AttractionsModel({this.attraction});

  factory AttractionsModel.fromJson(Map<String, dynamic> json) {
    return AttractionsModel(
      attraction: (json['Attraction'] as List<dynamic>?)
          ?.map((e) => Attraction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'Attraction': attraction?.map((e) => e.toJson()).toList(),
      };
}
