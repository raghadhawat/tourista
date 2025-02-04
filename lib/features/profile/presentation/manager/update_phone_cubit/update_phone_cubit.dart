import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/profile/data/models/update_phone_model.dart';
import 'package:tourista/features/profile/data/repos/profile_repo.dart';

import '../../../../../constants.dart';

part 'update_phone_state.dart';

class UpdatePhoneCubit extends Cubit<UpdatePhoneState> {
  UpdatePhoneCubit(this.profileRepo) : super(UpdatePhoneInitial());

  final ProfileRepo profileRepo;

  Future<void> updatePhone({
    required String phone,
  }) async {
    emit(UpdatePhoneLoading());
    var result = await profileRepo.updatePhone(
        token: Hive.box(kTokenBox).get(kTokenRef), phone: phone);

    result.fold((failure) {
      emit(UpdatePhoneFailure(failure.errMessage));
      if (kDebugMode) {
        print(failure.errMessage.toString());
      }
    }, (updatePhoneModel) {
      emit(UpdatePhoneSuccess(updatePhoneModel));
    });
  }
}
