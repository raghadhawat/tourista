import 'the_user.dart';

class ChangeLanguageModel {
  TheUser? theUser;

  ChangeLanguageModel({this.theUser});

  factory ChangeLanguageModel.fromJson(Map<String, dynamic> json) {
    return ChangeLanguageModel(
      theUser: json['theUser'] == null
          ? null
          : TheUser.fromJson(json['theUser'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'theUser': theUser?.toJson(),
      };
}
