class Review {
  String? review;
  String? comment;
  int? userId;
  DateTime? createdAt;
  int? id;

  Review({this.review, this.comment, this.userId, this.createdAt, this.id});

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        review: json['review'] as String?,
        comment: json['comment'] as String?,
        userId: json['user_id'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'review': review,
        'comment': comment,
        'user_id': userId,
        'created_at': createdAt?.toIso8601String(),
        'id': id,
      };
}
