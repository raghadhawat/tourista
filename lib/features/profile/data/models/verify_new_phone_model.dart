class VerifyNewPhoneModel {
  String? message;

  VerifyNewPhoneModel({this.message});

  factory VerifyNewPhoneModel.fromJson(Map<String, dynamic> json) {
    return VerifyNewPhoneModel(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
      };
}
