import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../../../../constants.dart';
import '../../../data/models/sign_out_model.dart';
import '../../../data/repos/auth_repo.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit(this.authRepo) : super(SignOutInitial());

  final AuthRepo authRepo;

  Future<void> signOut() async {
    emit(SignOutLoading());
    var result =
        await authRepo.signOut(token: Hive.box(kTokenBox).get(kTokenRef));

    result.fold((failure) {
      emit(SignOutFailure(failure.errMessage));
    }, (signOutModel) {
      emit(SignOutSuccess(signOutModel));
    });
  }
}
