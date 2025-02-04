part of 'delete_account_cubit.dart';

@immutable
sealed class DeleteAccountState {}

final class DeleteAccountInitial extends DeleteAccountState {}

class DeleteAccountLoading extends DeleteAccountState {}

class DeleteAccountSuccess extends DeleteAccountState {
  final DeleteAccountModel deleteAccountModel;

  DeleteAccountSuccess(this.deleteAccountModel);
}

class DeleteAccountFailure extends DeleteAccountState {
  final String errMessage;

  DeleteAccountFailure(this.errMessage);
}
