part of 'sent_google_user_info_cubit.dart';

@immutable
sealed class SentGoogleUserInfoState {}

final class SentGoogleUserInfoInitial extends SentGoogleUserInfoState {}

class SentGoogleUserInfoLoading extends SentGoogleUserInfoState {}

class SentGoogleUserInfoSuccess extends SentGoogleUserInfoState {
  final SignInWithGoogleModel signInWithGoogleModel;

  SentGoogleUserInfoSuccess(this.signInWithGoogleModel);
}

class SentGoogleUserInfoFailure extends SentGoogleUserInfoState {
  final String errMessage;

  SentGoogleUserInfoFailure(this.errMessage);
}
