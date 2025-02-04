import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/auth/forget_password/data/models/verify_code_model.dart';
import 'package:tourista/features/auth/forget_password/data/repos/forget_password_repo.dart';

part 'verify_code_state.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  VerifyCodeCubit(this.forgetPasswordRepo) : super(VerifyCodeInitial());
  final ForgetPasswordRepo forgetPasswordRepo;
  Future<void> verifyCodeCubitFun(
      {required String verifyCode, required int userId}) async {
    emit(VerifyCodeLoading());
    var result = await forgetPasswordRepo.verifyCode(
        verifyCode: verifyCode, userId: userId);
    result.fold((failure) {
      emit(VerifyCodeFailure(errMessage: failure.errMessage));
    }, (verifyCodeModel) {
      emit(VerifyCodeSuccess(verifyCodeModel: verifyCodeModel));
    });
  }
}
