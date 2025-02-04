part of 'verify_code_cubit.dart';

@immutable
sealed class VerifyCodeState {}

final class VerifyCodeInitial extends VerifyCodeState {}

final class VerifyCodeLoading extends VerifyCodeState {}

final class VerifyCodeSuccess extends VerifyCodeState {
  final VerifyCodeModel verifyCodeModel;

  VerifyCodeSuccess({required this.verifyCodeModel});
}

final class VerifyCodeFailure extends VerifyCodeState {
  final String errMessage;

  VerifyCodeFailure({required this.errMessage});
}
