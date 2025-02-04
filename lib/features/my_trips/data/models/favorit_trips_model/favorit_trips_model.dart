import 'your_favorite.dart';

class FavoritTripsModel {
  List<YourFavorite>? yourFavorite;

  FavoritTripsModel({this.yourFavorite});

  factory FavoritTripsModel.fromJson(Map<String, dynamic> json) {
    return FavoritTripsModel(
      yourFavorite: (json['your favorite'] as List<dynamic>?)
          ?.map((e) => YourFavorite.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'your favorite': yourFavorite?.map((e) => e.toJson()).toList(),
      };
}
