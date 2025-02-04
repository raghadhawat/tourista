import 'package:tourista/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/models/register_model.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/models/sign_in_model.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/models/sign_in_with_google_model.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/models/verify_sign_up_model.dart';

import '../models/sign_out_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, RegisterModel>> signUp({
    required String name,
    required String phone,
    required String password,
    required String confirmPassword,
  });

  Future<Either<Failure, SignInModel>> signIn({
    required String phone,
    required String password,
  });

  Future<Either<Failure, SignOutModel>> signOut({
    required String token,
  });

  Future<Either<Failure, VerifySignUpModel>> verifySignUp({
    required int userId,
    required String code,
  });

  // Future<UserCredential> signInWithGoogle();

  Future<Either<Failure, SignInWithGoogleModel>> sentSignInWithGoogleUserInfo({
    required String name,
    required String email,
    required String googleUserId,
  });
}
