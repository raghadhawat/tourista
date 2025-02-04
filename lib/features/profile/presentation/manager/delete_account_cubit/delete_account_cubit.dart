import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/features/profile/data/repos/profile_repo.dart';

import '../../../data/models/delete_account_model.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit(this.profileRepo) : super(DeleteAccountInitial());

  final ProfileRepo profileRepo;

  Future<void> deleteAccount() async {
    emit(DeleteAccountLoading());
    var result = await profileRepo.deleteAccount(
        token: Hive.box(kTokenBox).get(kTokenRef));
    print(Hive.box(kTokenBox).get(kTokenRef));

    result.fold((failure) {
      emit(DeleteAccountFailure(failure.errMessage));
      if (kDebugMode) {
        print(failure.errMessage.toString());
      }
    }, (deleteAccountModel) {
      emit(DeleteAccountSuccess(deleteAccountModel));
    });
  }
}
