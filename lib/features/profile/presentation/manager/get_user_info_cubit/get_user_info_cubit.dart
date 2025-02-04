import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../../../constants.dart';
import '../../../data/models/user_info_model/user_info_model.dart';
import '../../../data/repos/profile_repo.dart';

part 'get_user_info_state.dart';

class GetUserInfoCubit extends Cubit<GetUserInfoState> {
  GetUserInfoCubit(this.profileRepo) : super(GetUserInfoInitial());

  final ProfileRepo profileRepo;

  Future<void> getUserInfo() async {
    emit(GetUserInfoLoading());
    var result = await profileRepo.getUserInfo(
        token: Hive.box(kTokenBox).get(kTokenRef));

    result.fold((failure) {
      emit(GetUserInfoFailure(failure.errMessage));
      if (kDebugMode) {
        print(failure.errMessage.toString());
      }
    }, (userInfoModel) {
      Hive.box(kTokenBox).put(kUserIdRef, userInfoModel.user!.id);
      emit(GetUserInfoSuccess(userInfoModel));
    });
  }
}
