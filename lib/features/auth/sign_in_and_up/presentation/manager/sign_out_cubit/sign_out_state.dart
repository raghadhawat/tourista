part of 'sign_out_cubit.dart';

@immutable
sealed class SignOutState {}

final class SignOutInitial extends SignOutState {}

class SignOutLoading extends SignOutState {}

class SignOutSuccess extends SignOutState {
  final SignOutModel signOutModel;

  SignOutSuccess(this.signOutModel);
}

class SignOutFailure extends SignOutState {
  final String errMessage;

  SignOutFailure(this.errMessage);
}
