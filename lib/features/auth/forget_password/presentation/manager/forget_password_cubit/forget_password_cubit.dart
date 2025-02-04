import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/auth/forget_password/data/models/forget_password_model.dart';
import 'package:tourista/features/auth/forget_password/data/repos/forget_password_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.forgetPasswordRepo) : super(ForgetPasswordInitial());
  final ForgetPasswordRepo forgetPasswordRepo;
  Future<void> forgetPasswordCubitFun({required String phoneNumber}) async {
    emit(ForgetPasswordLoading());
    var result =
        await forgetPasswordRepo.forgetPassword(phoneNumber: phoneNumber);
    result.fold((failure) {
      emit(ForgetPasswordFailure(errMessage: failure.errMessage));
    }, (forgetPasswordModel) {
      emit(ForgetPasswordSuccess(forgetPasswordModel: forgetPasswordModel));
    });
  }
}
