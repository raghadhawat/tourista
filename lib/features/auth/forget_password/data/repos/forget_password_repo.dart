import 'package:dartz/dartz.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/features/auth/forget_password/data/models/forget_password_model.dart';
import 'package:tourista/features/auth/forget_password/data/models/reset_password_model.dart';
import 'package:tourista/features/auth/forget_password/data/models/verify_code_model.dart';

abstract class ForgetPasswordRepo {
  Future<Either<Failure, ForgetPasswordModel>> forgetPassword(
      {required String phoneNumber});
  Future<Either<Failure, VerifyCodeModel>> verifyCode(
      {required String verifyCode, required int userId});
  Future<Either<Failure, ResetPasswordModel>> resetPassword(
      {required int userId,
      required String password,
      required String confirmPassword});
}
