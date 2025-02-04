part of 'sign_in_with_google_cubit.dart';

sealed class SignInWithGoogleState {
  const SignInWithGoogleState();
}

final class SignInWithGoogleInitial extends SignInWithGoogleState {}

class SignInWithGoogleLoading extends SignInWithGoogleState {}

class SignInWithGoogleSuccess extends SignInWithGoogleState {
  final GoogleSignInAccount googleUser;

  SignInWithGoogleSuccess({required this.googleUser});
}

class SignInWithGoogleFailure extends SignInWithGoogleState {
  final String errMessage;

  SignInWithGoogleFailure(this.errMessage);
}
