import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/profile/data/models/all_questions_model/all_questions_model.dart';
import 'package:tourista/features/profile/data/repos/profile_repo.dart';

part 'all_questions_state.dart';

class AllQuestionsCubit extends Cubit<AllQuestionsState> {
  AllQuestionsCubit(this.profileRepo) : super(AllQuestionsInitial());

  final ProfileRepo profileRepo;

  Future<void> getAllQuestions() async {
    emit(AllQuestionsLoading());
    var result = await profileRepo.getAllQuestions();

    result.fold((failure) {
      emit(AllQuestionsFailure(failure.errMessage));
      if (kDebugMode) {
        print(failure.errMessage.toString());
      }
    }, (userInfoModel) {
      emit(AllQuestionsSuccess(userInfoModel));
    });
  }
}
