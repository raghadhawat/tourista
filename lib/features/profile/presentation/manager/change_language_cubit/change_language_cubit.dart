import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/profile/data/models/change_language_model/change_language_model.dart';
import 'package:tourista/features/profile/data/repos/profile_repo.dart';

import '../../../../../constants.dart';

part 'change_language_state.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  ChangeLanguageCubit(this.profileRepo) : super(ChangeLanguageInitial());
  final ProfileRepo profileRepo;

  Future<void> changeLanguage({
    required String language,
  }) async {
    emit(ChangeLanguageLoading());
    var result = await profileRepo.changeLanguage(
        token: Hive.box(kTokenBox).get(kTokenRef), language: language);

    result.fold((failure) {
      emit(ChangeLanguageFailure(failure.errMessage));
    }, (changeLanguageModel) {
      emit(ChangeLanguageSuccess(changeLanguageModel));
    });
  }
}
