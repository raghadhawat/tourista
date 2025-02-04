import 'user.dart';

class Review {
  int? id;
  int? review;
  String? comment;
  int? userId;
  DateTime? createdAt;
  User? user;

  Review({
    this.id,
    this.review,
    this.comment,
    this.userId,
    this.createdAt,
    this.user,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json['id'] as int?,
        review: json['review'] as int?,
        comment: json['comment'] as String?,
        userId: json['user_id'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'review': review,
        'comment': comment,
        'user_id': userId,
        'created_at': createdAt?.toIso8601String(),
        'user': user?.toJson(),
      };
}
