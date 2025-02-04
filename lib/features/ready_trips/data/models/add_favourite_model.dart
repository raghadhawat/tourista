class AddFavouriteModel {
  String? message;

  AddFavouriteModel({this.message});

  factory AddFavouriteModel.fromJson(Map<String, dynamic> json) {
    return AddFavouriteModel(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
      };
}
