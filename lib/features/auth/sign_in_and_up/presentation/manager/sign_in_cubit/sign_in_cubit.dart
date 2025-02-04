import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/models/sign_in_model.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/repos/auth_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());

  final AuthRepo authRepo;

  Future<void> signIn({
    required String phone,
    required String password,
  }) async {
    emit(SignInLoading());
    var result = await authRepo.signIn(phone: phone, password: password);
    result.fold((failure) {
      emit(SignInFailure(failure.errMessage));
    }, (signInModel) async {
      Hive.box(kTokenBox).put(kTokenRef, signInModel.token);
      Hive.box(kUserInfoBox).deleteAll(
          [kUserNameRef, kUserPhoneRef, kUserEmailRef, kUserPointsRef]);
      emit(SignInSuccess(signInModel: signInModel));
    });
  }
}
