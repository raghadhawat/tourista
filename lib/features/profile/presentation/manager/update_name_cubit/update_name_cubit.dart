import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/profile/data/models/update_name_model.dart';

import '../../../../../constants.dart';
import '../../../data/repos/profile_repo.dart';

part 'update_name_state.dart';

class UpdateNameCubit extends Cubit<UpdateNameState> {
  UpdateNameCubit(this.profileRepo) : super(UpdateNameInitial());

  final ProfileRepo profileRepo;

  Future<void> updateName({
    required String name,
  }) async {
    emit(UpdateNameLoading());
    var result = await profileRepo.updateName(
        token: Hive.box(kTokenBox).get(kTokenRef), name: name);

    result.fold((failure) {
      emit(UpdateNameFailure(failure.errMessage));
      if (kDebugMode) {
        print(failure.errMessage.toString());
      }
    }, (updateNameModel) {
      emit(UpdateNameSuccess(updateNameModel));
    });
  }
}
