class ResetPasswordModel {
  String? message;
  String? token;

  ResetPasswordModel({this.message, this.token});

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordModel(
      message: json['message'] as String?,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'token': token,
      };
}
