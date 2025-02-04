part of 'verify_new_phone_cubit.dart';

@immutable
sealed class VerifyNewPhoneState {}

final class VerifyNewPhoneInitial extends VerifyNewPhoneState {}

class VerifyNewPhoneLoading extends VerifyNewPhoneState {}

class VerifyNewPhoneSuccess extends VerifyNewPhoneState {
  final VerifyNewPhoneModel verifyNewPhoneModel;

  VerifyNewPhoneSuccess(this.verifyNewPhoneModel);
}

class VerifyNewPhoneFailure extends VerifyNewPhoneState {
  final String errMessage;

  VerifyNewPhoneFailure(this.errMessage);
}
