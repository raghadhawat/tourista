import 'review.dart';

class AllReviewsModel {
  int? reviewsCount;
  List<Review>? reviews;

  AllReviewsModel({this.reviewsCount, this.reviews});

  factory AllReviewsModel.fromJson(Map<String, dynamic> json) {
    return AllReviewsModel(
      reviewsCount: json['reviews_count'] as int?,
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'reviews_count': reviewsCount,
        'reviews': reviews?.map((e) => e.toJson()).toList(),
      };
}
