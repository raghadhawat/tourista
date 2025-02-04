part of 'sign_up_cubit.dart';

sealed class SignUpState {
  const SignUpState();
}

final class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final RegisterModel registerModel;

  const SignUpSuccess({required this.registerModel});
}

class SignUpFailure extends SignUpState {
  final String errMessage;

  const SignUpFailure(this.errMessage);
}
