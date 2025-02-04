class SignOutModel {
  String? message;

  SignOutModel({this.message});

  factory SignOutModel.fromJson(Map<String, dynamic> json) => SignOutModel(
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
      };
}
