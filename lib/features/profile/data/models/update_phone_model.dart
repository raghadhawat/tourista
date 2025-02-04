class UpdatePhoneModel {
  String? message;
  String? userPhone;

  UpdatePhoneModel({this.message, this.userPhone});

  factory UpdatePhoneModel.fromJson(Map<String, dynamic> json) {
    return UpdatePhoneModel(
      message: json['message'] as String?,
      userPhone: json['user_phone'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'user_phone': userPhone,
      };
}
