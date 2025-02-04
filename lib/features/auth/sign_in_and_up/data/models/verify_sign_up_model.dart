class VerifySignUpModel {
  final String? message;
  final String? token;

  const VerifySignUpModel({this.message, this.token});

  factory VerifySignUpModel.fromJson(Map<String, dynamic> json) {
    return VerifySignUpModel(
      message: json['message'] as String?,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'token': token,
      };
}
