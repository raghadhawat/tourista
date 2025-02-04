import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/features/profile/data/models/change_password_model.dart';
import 'package:tourista/features/profile/data/repos/profile_repo.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.profileRepo) : super(ChangePasswordInitial());

  final ProfileRepo profileRepo;

  Future<void> changePassword({
    required String password,
    required String newPassword,
    required String confirnPassword,
  }) async {
    emit(ChangePasswordLoading());
    var result = await profileRepo.changePassword(
        token: Hive.box(kTokenBox).get(kTokenRef),
        password: password,
        newPassword: newPassword,
        confirnPassword: confirnPassword);

    result.fold((failure) {
      emit(ChangePasswordFailure(failure.errMessage));
      if (kDebugMode) {
        print(failure.errMessage.toString());
      }
    }, (changePasswordModel) {
      emit(ChangePasswordSuccess(changePasswordModel));
    });
  }
}
