import 'google_user.dart';
import 'normal_user.dart';

class User {
  int? id;
  String? name;
  int? points;
  int? wallet;
  String? type;
  String? language;
  DateTime? createdAt;
  DateTime? updatedAt;
  GoogleUser? googleUser;
  NormalUser? normalUser;

  User({
    this.id,
    this.name,
    this.points,
    this.wallet,
    this.type,
    this.language,
    this.createdAt,
    this.updatedAt,
    this.googleUser,
    this.normalUser,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        name: json['name'] as String?,
        points: json['points'] as int?,
        wallet: json['wallet'] as int?,
        type: json['type'] as String?,
        language: json['language'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        googleUser: json['google_user'] == null
            ? null
            : GoogleUser.fromJson(json['google_user'] as Map<String, dynamic>),
        normalUser: json['normal_user'] == null
            ? null
            : NormalUser.fromJson(json['normal_user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'points': points,
        'wallet': wallet,
        'type': type,
        'language': language,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'google_user': googleUser?.toJson(),
        'normal_user': normalUser?.toJson(),
      };
}
