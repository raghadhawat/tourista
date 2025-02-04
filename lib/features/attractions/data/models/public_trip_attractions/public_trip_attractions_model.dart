import 'package:tourista/features/attractions/data/models/attractions_model/attraction.dart';

class PublicTripAttractionsModel {
  bool? havePointsDiscountAttraction;
  List<Attraction>? attractions;

  PublicTripAttractionsModel({
    this.havePointsDiscountAttraction,
    this.attractions,
  });

  factory PublicTripAttractionsModel.fromJson(Map<String, dynamic> json) {
    return PublicTripAttractionsModel(
      havePointsDiscountAttraction:
          json['HavePointsDiscountAttraction'] as bool?,
      attractions: (json['Attractions'] as List<dynamic>?)
          ?.map((e) => Attraction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'HavePointsDiscountAttraction': havePointsDiscountAttraction,
        'Attractions': attractions?.map((e) => e.toJson()).toList(),
      };
}
