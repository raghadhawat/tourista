part of 'update_name_cubit.dart';

@immutable
sealed class UpdateNameState {}

final class UpdateNameInitial extends UpdateNameState {}

class UpdateNameLoading extends UpdateNameState {}

class UpdateNameSuccess extends UpdateNameState {
  final UpdateNameModel updateNameModel;

  UpdateNameSuccess(this.updateNameModel);
}

class UpdateNameFailure extends UpdateNameState {
  final String errMessage;

  UpdateNameFailure(this.errMessage);
}
