import 'user.dart';

class UserInfoModel {
  User? user;

  UserInfoModel({this.user});

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        user: json['user:'] == null
            ? null
            : User.fromJson(json['user:'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'user:': user?.toJson(),
      };
}
