import 'review.dart';

class AddReviewModel {
  String? message;
  Review? review;

  AddReviewModel({this.message, this.review});

  factory AddReviewModel.fromJson(Map<String, dynamic> json) {
    return AddReviewModel(
      message: json['message:'] as String?,
      review: json['review'] == null
          ? null
          : Review.fromJson(json['review'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message:': message,
        'review': review?.toJson(),
      };
}
