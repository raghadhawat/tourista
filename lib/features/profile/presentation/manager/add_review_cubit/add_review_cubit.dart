import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/profile/data/models/add_review_model/add_review_model.dart';

import '../../../../../constants.dart';
import '../../../data/repos/profile_repo.dart';

part 'add_review_state.dart';

class AddReviewCubit extends Cubit<AddReviewState> {
  AddReviewCubit(this.profileRepo) : super(AddReviewInitial());

  final ProfileRepo profileRepo;

  Future<void> addReview({
    required String review,
    required String comment,
  }) async {
    emit(AddReviewLoading());
    var result = await profileRepo.addReview(
        token: Hive.box(kTokenBox).get(kTokenRef),
        review: review,
        comment: comment);

    result.fold((failure) {
      emit(AddReviewFailure(failure.errMessage));
      if (kDebugMode) {
        print(failure.errMessage.toString());
      }
    }, (updateNameModel) {
      emit(AddReviewSuccess(updateNameModel));
    });
  }
}
