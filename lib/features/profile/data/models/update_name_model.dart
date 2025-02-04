class UpdateNameModel {
  String? message;
  bool? user;

  UpdateNameModel({this.message, this.user});

  factory UpdateNameModel.fromJson(Map<String, dynamic> json) {
    return UpdateNameModel(
      message: json['message'] as String?,
      user: json['user'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'user': user,
      };
}
