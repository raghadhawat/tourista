part of 'verify_signup_cubit.dart';

sealed class VerifySignUpState {
  const VerifySignUpState();
}

final class VerifySignupInitial extends VerifySignUpState {}

class VerifySignupLoading extends VerifySignUpState {}

class VerifySignupSuccess extends VerifySignUpState {
  final VerifySignUpModel verifySignUpModel;

  const VerifySignupSuccess({required this.verifySignUpModel});
}

class VerifySignupFailure extends VerifySignUpState {
  final String errMessage;

  const VerifySignupFailure(this.errMessage);
}
