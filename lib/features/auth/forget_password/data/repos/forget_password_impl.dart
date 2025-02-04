import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/core/utlis/api_server.dart';
import 'package:tourista/features/auth/forget_password/data/models/forget_password_model.dart';
import 'package:tourista/features/auth/forget_password/data/models/reset_password_model.dart';
import 'package:tourista/features/auth/forget_password/data/models/verify_code_model.dart';
import 'package:tourista/features/auth/forget_password/data/repos/forget_password_repo.dart';

class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  final ApiServer apiServer;

  ForgetPasswordRepoImpl(this.apiServer);
  @override
  Future<Either<Failure, ForgetPasswordModel>> forgetPassword(
      {required String phoneNumber}) async {
    try {
      var data = await apiServer
          .post(endPoint: 'forgetPassword', body: {"phone": phoneNumber});
      ForgetPasswordModel forgetPasswordModel =
          ForgetPasswordModel.fromJson(data);
      return right(forgetPasswordModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, VerifyCodeModel>> verifyCode(
      {required String verifyCode, required int userId}) async {
    try {
      var data = await apiServer.post(
          endPoint: 'verifyForgetPassword',
          body: {"user_id": userId, "code": verifyCode});
      VerifyCodeModel verifyCodeModel = VerifyCodeModel.fromJson(data);
      return right(verifyCodeModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ResetPasswordModel>> resetPassword(
      {required int userId,
      required String password,
      required String confirmPassword}) async {
    try {
      var data = await apiServer.post(endPoint: 'resatPassword', body: {
        "user_id": userId,
        "password": password,
        "password_confirmation": confirmPassword
      });
      ResetPasswordModel resetPasswordModel = ResetPasswordModel.fromJson(data);
      return right(resetPasswordModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
