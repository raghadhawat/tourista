class NormalUser {
  int? id;
  String? phone;
  int? userId;
  String? role;
  String? verificationCode;
  int? isVerified;

  NormalUser({
    this.id,
    this.phone,
    this.userId,
    this.role,
    this.verificationCode,
    this.isVerified,
  });

  factory NormalUser.fromJson(Map<String, dynamic> json) => NormalUser(
        id: json['id'] as int?,
        phone: json['phone'] as String?,
        userId: json['user_id'] as int?,
        role: json['role'] as String?,
        verificationCode: json['verification_code'] as String?,
        isVerified: json['is_verified'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'phone': phone,
        'user_id': userId,
        'role': role,
        'verification_code': verificationCode,
        'is_verified': isVerified,
      };
}
