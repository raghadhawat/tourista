import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/profile/data/models/verify_new_phone_model.dart';

import '../../../../../constants.dart';
import '../../../data/repos/profile_repo.dart';

part 'verify_new_phone_state.dart';

class VerifyNewPhoneCubit extends Cubit<VerifyNewPhoneState> {
  VerifyNewPhoneCubit(this.profileRepo) : super(VerifyNewPhoneInitial());

  final ProfileRepo profileRepo;

  Future<void> verifyNewPhone({
    required String phone,
    required String code,
  }) async {
    emit(VerifyNewPhoneLoading());
    var result = await profileRepo.verifyNewPhone(
        token: Hive.box(kTokenBox).get(kTokenRef), phone: phone, code: code);

    result.fold((failure) {
      emit(VerifyNewPhoneFailure(failure.errMessage));
      if (kDebugMode) {
        print(failure.errMessage.toString());
      }
    }, (verifyNewPhoneModel) {
      emit(VerifyNewPhoneSuccess(verifyNewPhoneModel));
    });
  }
}
