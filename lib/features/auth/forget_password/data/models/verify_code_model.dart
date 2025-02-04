class VerifyCodeModel {
  String? message;

  VerifyCodeModel({this.message});

  factory VerifyCodeModel.fromJson(Map<String, dynamic> json) {
    return VerifyCodeModel(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
      };
}
