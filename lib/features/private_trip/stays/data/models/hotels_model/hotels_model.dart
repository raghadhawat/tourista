import 'hotel.dart';

class HotelsModel {
  int? numberOfHotel;
  List<Hotel>? hotel;

  HotelsModel({this.numberOfHotel, this.hotel});

  factory HotelsModel.fromJson(Map<String, dynamic> json) => HotelsModel(
        numberOfHotel: json['numberOfHotel'] as int?,
        hotel: (json['hotel'] as List<dynamic>?)
            ?.map((e) => Hotel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'numberOfHotel:': numberOfHotel,
        'hotel': hotel?.map((e) => e.toJson()).toList(),
      };
}
