part of 'all_questions_cubit.dart';

@immutable
sealed class AllQuestionsState {}

final class AllQuestionsInitial extends AllQuestionsState {}

class AllQuestionsLoading extends AllQuestionsState {}

class AllQuestionsSuccess extends AllQuestionsState {
  final AllQuestionsModel allQuestionsModel;

  AllQuestionsSuccess(this.allQuestionsModel);
}

class AllQuestionsFailure extends AllQuestionsState {
  final String errMessage;

  AllQuestionsFailure(this.errMessage);
}
