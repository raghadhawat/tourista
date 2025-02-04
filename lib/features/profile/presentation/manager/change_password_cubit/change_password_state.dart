part of 'change_password_cubit.dart';

@immutable
sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoading extends ChangePasswordState {}

class ChangePasswordSuccess extends ChangePasswordState {
  final ChangePasswordModel changePasswordModel;

  ChangePasswordSuccess(this.changePasswordModel);
}

class ChangePasswordFailure extends ChangePasswordState {
  final String errMessage;

  ChangePasswordFailure(this.errMessage);
}
