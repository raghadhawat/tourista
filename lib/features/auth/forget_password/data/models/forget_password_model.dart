class ForgetPasswordModel {
  String? message;
  int? userId;

  ForgetPasswordModel({this.message, this.userId});

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordModel(
      message: json['message'] as String?,
      userId: json['user_id'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'user_id': userId,
      };
}
