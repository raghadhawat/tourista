import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/models/register_model.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/repos/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());

  final AuthRepo authRepo;

  Future<void> signUp({
    required String name,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    emit(SignUpLoading());
    var result = await authRepo.signUp(
        name: name,
        phone: phone,
        password: password,
        confirmPassword: confirmPassword);
    result.fold((failure) {
      emit(SignUpFailure(failure.errMessage));
    }, (registerModel) {
      emit(SignUpSuccess(registerModel: registerModel));
    });
  }
}
