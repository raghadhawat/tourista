import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:tourista/constants.dart';

import '../../../data/models/all_reviews_model/all_reviews_model.dart';
import '../../../data/repos/profile_repo.dart';

part 'all_reviews_state.dart';

class AllReviewsCubit extends Cubit<AllReviewsState> {
  AllReviewsCubit(this.profileRepo) : super(AllReviewsInitial());

  final ProfileRepo profileRepo;

  Future<void> getAllReviews() async {
    emit(AllReviewsLoading());
    var result = await profileRepo.getAllReviews(
        token: Hive.box(kTokenBox).get(kTokenRef));

    result.fold((failure) {
      emit(AllReviewsFailure(failure.errMessage));
      if (kDebugMode) {
        print(failure.errMessage.toString());
      }
    }, (userInfoModel) {
      emit(AllReviewsSuccess(userInfoModel));
    });
  }
}
