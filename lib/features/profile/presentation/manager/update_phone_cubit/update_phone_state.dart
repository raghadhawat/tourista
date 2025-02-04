part of 'update_phone_cubit.dart';

@immutable
sealed class UpdatePhoneState {}

final class UpdatePhoneInitial extends UpdatePhoneState {}

class UpdatePhoneLoading extends UpdatePhoneState {}

class UpdatePhoneSuccess extends UpdatePhoneState {
  final UpdatePhoneModel updatePhoneModel;

  UpdatePhoneSuccess(this.updatePhoneModel);
}

class UpdatePhoneFailure extends UpdatePhoneState {
  final String errMessage;

  UpdatePhoneFailure(this.errMessage);
}
