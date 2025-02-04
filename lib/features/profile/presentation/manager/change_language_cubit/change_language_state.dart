part of 'change_language_cubit.dart';

@immutable
sealed class ChangeLanguageState {}

final class ChangeLanguageInitial extends ChangeLanguageState {}

class ChangeLanguageLoading extends ChangeLanguageState {}

class ChangeLanguageSuccess extends ChangeLanguageState {
  final ChangeLanguageModel changeLanguageModel;

  ChangeLanguageSuccess(this.changeLanguageModel);
}

class ChangeLanguageFailure extends ChangeLanguageState {
  final String errMessage;

  ChangeLanguageFailure(this.errMessage);
}
