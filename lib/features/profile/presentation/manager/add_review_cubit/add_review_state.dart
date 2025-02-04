part of 'add_review_cubit.dart';

@immutable
sealed class AddReviewState {}

final class AddReviewInitial extends AddReviewState {}

class AddReviewLoading extends AddReviewState {}

class AddReviewSuccess extends AddReviewState {
  final AddReviewModel addReviewModel;

  AddReviewSuccess(this.addReviewModel);
}

class AddReviewFailure extends AddReviewState {
  final String errMessage;

  AddReviewFailure(this.errMessage);
}
