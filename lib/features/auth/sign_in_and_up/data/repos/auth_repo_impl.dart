import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/core/utlis/api_server.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/models/register_model.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/models/sign_in_model.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/models/sign_in_with_google_model.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/models/verify_sign_up_model.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/repos/auth_repo.dart';

import '../models/sign_out_model.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiServer apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, RegisterModel>> signUp({
    required String name,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      var registerData = await apiService.post(endPoint: 'register', body: {
        "name": name,
        "phone": phone,
        "password": password,
        "password_confirmation": confirmPassword,
      });

      RegisterModel registerModel = RegisterModel.fromJson(registerData);

      return right(registerModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SignInModel>> signIn(
      {required String phone, required String password}) async {
    try {
      var signInData = await apiService.post(endPoint: 'login', body: {
        "phone": phone,
        "password": password,
      });

      SignInModel signInModel = SignInModel.fromJson(signInData);

      return right(signInModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, VerifySignUpModel>> verifySignUp(
      {required int userId, required String code}) async {
    try {
      var verifySignUpData =
          await apiService.post(endPoint: 'verifyCode', body: {
        "user_id": userId,
        "code": code,
      });

      VerifySignUpModel verifySignUpModel =
          VerifySignUpModel.fromJson(verifySignUpData);

      return right(verifySignUpModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

/*
  @override
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
    } else {
      String? name = googleUser.displayName;
      String? email = googleUser.email;
      String? googleUserId = googleUser.id;
      if (kDebugMode) {
        print(name);
        print(email);
      }
    }
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    String? accessToken = googleAuth?.accessToken;
    if (kDebugMode) {
      print(accessToken);
    }
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
*/
  @override
  Future<Either<Failure, SignInWithGoogleModel>> sentSignInWithGoogleUserInfo({
    required String name,
    required String email,
    required String googleUserId,
  }) async {
    try {
      var signInWithGoogleUserInfo = await apiService.post(
          endPoint: 'googleRegister',
          body: {"name": name, "email": email, "google_id": googleUserId});

      SignInWithGoogleModel signInWithGoogleModel =
          SignInWithGoogleModel.fromJson(signInWithGoogleUserInfo);

      return right(signInWithGoogleModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SignOutModel>> signOut({required String token}) async {
    try {
      var signOutData =
          await apiService.post(endPoint: 'logout', token: token, body: null);

      SignOutModel signOutModel = SignOutModel.fromJson(signOutData);

      return right(signOutModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
