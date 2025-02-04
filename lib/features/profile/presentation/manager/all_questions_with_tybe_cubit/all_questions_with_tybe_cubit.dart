import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/profile/data/models/all_questions_with_tybe_model/all_questions_with_tybe_model.dart';
import 'package:tourista/features/profile/data/repos/profile_repo.dart';

part 'all_questions_with_tybe_state.dart';

class AllQuestionsWithTybeCubit extends Cubit<AllQuestionsWithTybeState> {
  AllQuestionsWithTybeCubit(this.profileRepo)
      : super(AllQuestionsWithTybeInitial());

  final ProfileRepo profileRepo;

  Future<void> getAllQuestionsWithtybe({required String tybe}) async {
    emit(AllQuestionsWithTybeLoading());
    var result = await profileRepo.getAllQuestionsWithtybe(tybe: tybe);

    result.fold((failure) {
      emit(AllQuestionsWithTybeFailure(failure.errMessage));
      if (kDebugMode) {
        print(failure.errMessage.toString());
      }
    }, (userInfoModel) {
      emit(AllQuestionsWithTybeSuccess(userInfoModel));
    });
  }
}
