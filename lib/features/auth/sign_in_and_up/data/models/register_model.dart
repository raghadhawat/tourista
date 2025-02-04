class RegisterModel {
  final String? message;
  final int? userId;

  const RegisterModel({this.message, this.userId});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        message: json['message'] as String?,
        userId: json['user_id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'user_id': userId,
      };
}
