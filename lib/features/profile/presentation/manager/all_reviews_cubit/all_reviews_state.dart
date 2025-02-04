part of 'all_reviews_cubit.dart';

@immutable
sealed class AllReviewsState {}

final class AllReviewsInitial extends AllReviewsState {}

class AllReviewsLoading extends AllReviewsState {}

class AllReviewsSuccess extends AllReviewsState {
  final AllReviewsModel allReviewsModel;

  AllReviewsSuccess(this.allReviewsModel);
}

class AllReviewsFailure extends AllReviewsState {
  final String errMessage;

  AllReviewsFailure(this.errMessage);
}
