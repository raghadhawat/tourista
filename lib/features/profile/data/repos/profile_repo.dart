import 'package:tourista/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tourista/features/profile/data/models/add_review_model/add_review_model.dart';
import 'package:tourista/features/profile/data/models/all_questions_model/all_questions_model.dart';
import 'package:tourista/features/profile/data/models/all_questions_with_tybe_model/all_questions_with_tybe_model.dart';
import 'package:tourista/features/profile/data/models/all_reviews_model/all_reviews_model.dart';
import 'package:tourista/features/profile/data/models/change_password_model.dart';
import 'package:tourista/features/profile/data/models/delete_account_model.dart';
import 'package:tourista/features/profile/data/models/update_name_model.dart';
import 'package:tourista/features/profile/data/models/user_info_model/user_info_model.dart';
import 'package:tourista/features/profile/data/models/verify_new_phone_model.dart';

import '../models/change_language_model/change_language_model.dart';
import '../models/update_phone_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, DeleteAccountModel>> deleteAccount({
    required String token,
  });

  Future<Either<Failure, UserInfoModel>> getUserInfo({
    required String token,
  });

  Future<Either<Failure, UpdateNameModel>> updateName({
    required String token,
    required String name,
  });

  Future<Either<Failure, UpdatePhoneModel>> updatePhone({
    required String token,
    required String phone,
  });

  Future<Either<Failure, VerifyNewPhoneModel>> verifyNewPhone({
    required String token,
    required String phone,
    required String code,
  });

  Future<Either<Failure, ChangePasswordModel>> changePassword({
    required String token,
    required String password,
    required String newPassword,
    required String confirnPassword,
  });

  Future<Either<Failure, AddReviewModel>> addReview({
    required String token,
    required String review,
    required String comment,
  });

  Future<Either<Failure, AllReviewsModel>> getAllReviews({
    required String token,
  });

  Future<Either<Failure, AllQuestionsModel>> getAllQuestions();

  Future<Either<Failure, AllQuestionsWithTybeModel>> getAllQuestionsWithtybe({
    required String tybe,
  });

  Future<Either<Failure, ChangeLanguageModel>> changeLanguage({
    required String token,
    required String language,
  });
}
