import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/core/utlis/api_server.dart';
import 'package:tourista/features/profile/data/models/add_review_model/add_review_model.dart';
import 'package:tourista/features/profile/data/models/all_questions_model/all_questions_model.dart';
import 'package:tourista/features/profile/data/models/all_questions_with_tybe_model/all_questions_with_tybe_model.dart';
import 'package:tourista/features/profile/data/models/all_reviews_model/all_reviews_model.dart';
import 'package:tourista/features/profile/data/models/change_language_model/change_language_model.dart';
import 'package:tourista/features/profile/data/models/change_password_model.dart';
import 'package:tourista/features/profile/data/models/delete_account_model.dart';
import 'package:tourista/features/profile/data/models/update_name_model.dart';
import 'package:tourista/features/profile/data/models/update_phone_model.dart';
import 'package:tourista/features/profile/data/models/user_info_model/user_info_model.dart';
import 'package:tourista/features/profile/data/models/verify_new_phone_model.dart';

import 'profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiServer apiService;

  ProfileRepoImpl(this.apiService);

  @override
  Future<Either<Failure, DeleteAccountModel>> deleteAccount(
      {required String token}) async {
    try {
      var deleteAccountData =
          await apiService.delete(endPoint: 'deleteAccount', token: token);

      DeleteAccountModel deleteAccountModel =
          DeleteAccountModel.fromJson(deleteAccountData);

      return right(deleteAccountModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UpdateNameModel>> updateName(
      {required String token, required String name}) async {
    try {
      var updateNameData = await apiService
          .post(endPoint: 'updateName', token: token, body: {'name': name});

      UpdateNameModel updateNameModel =
          UpdateNameModel.fromJson(updateNameData);

      return right(updateNameModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UpdatePhoneModel>> updatePhone(
      {required String token, required String phone}) async {
    try {
      var updatePhoneData = await apiService
          .post(endPoint: 'updatePhone', token: token, body: {'phone': phone});

      UpdatePhoneModel updatePhoneModel =
          UpdatePhoneModel.fromJson(updatePhoneData);

      return right(updatePhoneModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, VerifyNewPhoneModel>> verifyNewPhone(
      {required String token,
      required String phone,
      required String code}) async {
    try {
      var verifyNewPhoneData = await apiService.post(
          endPoint: 'verifyNewPhone',
          token: token,
          body: {'phone': phone, 'code': code});

      VerifyNewPhoneModel verifyNewPhoneModel =
          VerifyNewPhoneModel.fromJson(verifyNewPhoneData);

      return right(verifyNewPhoneModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserInfoModel>> getUserInfo(
      {required String token}) async {
    try {
      var userInfoData =
          await apiService.get(endPoint: 'userInfo', token: token);

      UserInfoModel userInfoModel = UserInfoModel.fromJson(userInfoData);

      return right(userInfoModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ChangePasswordModel>> changePassword(
      {required String token,
      required String password,
      required String newPassword,
      required String confirnPassword}) async {
    try {
      var changePasswordDate = await apiService
          .post(endPoint: 'resatPasswordEnternal', token: token, body: {
        'password': password,
        'NewPassword': newPassword,
        'NewPassword_confirmation': confirnPassword
      });

      ChangePasswordModel changePasswordModel =
          ChangePasswordModel.fromJson(changePasswordDate);

      return right(changePasswordModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AddReviewModel>> addReview(
      {required String token,
      required String review,
      required String comment}) async {
    try {
      var addReviewData = await apiService.post(
          endPoint: 'addReview',
          token: token,
          body: {'review': review, 'comment': comment});

      AddReviewModel addReviewModel = AddReviewModel.fromJson(addReviewData);

      return right(addReviewModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AllReviewsModel>> getAllReviews(
      {required String token}) async {
    try {
      var allReviewsData =
          await apiService.get(endPoint: 'allReview', token: token);

      AllReviewsModel allReviewsModel =
          AllReviewsModel.fromJson(allReviewsData);

      return right(allReviewsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AllQuestionsModel>> getAllQuestions() async {
    try {
      var allQuestionsData = await apiService.get(endPoint: 'allQuastions');

      AllQuestionsModel allQuestionsModel =
          AllQuestionsModel.fromJson(allQuestionsData);

      return right(allQuestionsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AllQuestionsWithTybeModel>> getAllQuestionsWithtybe({
    required String tybe,
  }) async {
    try {
      var allQuestionsWithTybeData = await apiService
          .post(endPoint: 'allQuastionsByType', body: {'type': tybe});

      AllQuestionsWithTybeModel allQuestionsWithTybeModel =
          AllQuestionsWithTybeModel.fromJson(allQuestionsWithTybeData);

      return right(allQuestionsWithTybeModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ChangeLanguageModel>> changeLanguage(
      {required String token, required String language}) async {
    try {
      var changeLangData = await apiService.post(
          endPoint: 'choseLanguage',
          token: token,
          body: {'language': language});

      ChangeLanguageModel changeLanguageModel =
          ChangeLanguageModel.fromJson(changeLangData);

      return right(changeLanguageModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
