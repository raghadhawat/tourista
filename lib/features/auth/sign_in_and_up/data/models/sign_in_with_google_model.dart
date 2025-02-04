class SignInWithGoogleModel {
  String? message;
  String? token;

  SignInWithGoogleModel({this.message, this.token});

  factory SignInWithGoogleModel.fromJson(Map<String, dynamic> json) {
    return SignInWithGoogleModel(
      message: json['message'] as String?,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'token': token,
      };
}
