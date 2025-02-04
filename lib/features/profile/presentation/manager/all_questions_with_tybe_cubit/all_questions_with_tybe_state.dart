part of 'all_questions_with_tybe_cubit.dart';

@immutable
sealed class AllQuestionsWithTybeState {}

final class AllQuestionsWithTybeInitial extends AllQuestionsWithTybeState {}

class AllQuestionsWithTybeLoading extends AllQuestionsWithTybeState {}

class AllQuestionsWithTybeSuccess extends AllQuestionsWithTybeState {
  final AllQuestionsWithTybeModel allQuestionsWithTybeModel;

  AllQuestionsWithTybeSuccess(this.allQuestionsWithTybeModel);
}

class AllQuestionsWithTybeFailure extends AllQuestionsWithTybeState {
  final String errMessage;

  AllQuestionsWithTybeFailure(this.errMessage);
}
