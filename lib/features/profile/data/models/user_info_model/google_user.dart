class GoogleUser {
  int? id;
  String? email;
  int? userId;
  String? googleId;
  dynamic avatar;

  GoogleUser({
    this.id,
    this.email,
    this.userId,
    this.googleId,
    this.avatar,
  });

  factory GoogleUser.fromJson(Map<String, dynamic> json) => GoogleUser(
        id: json['id'] as int?,
        email: json['email'] as String?,
        userId: json['user_id'] as int?,
        googleId: json['google_id'] as String?,
        avatar: json['avatar'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'user_id': userId,
        'google_id': googleId,
        'avatar': avatar,
      };
}
