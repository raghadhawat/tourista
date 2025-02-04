import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/private_trip/the_plan/data/repos/the_plan_repo.dart';

import '../../../data/models/get_user_private_plan_model/get_user_private_plan_model.dart';

part 'get_user_private_plan_state.dart';

class GetUserPrivatePlanCubit extends Cubit<GetUserPrivatePlanState> {
  GetUserPrivatePlanCubit(this.thePlanRepo)
      : super(GetUserPrivatePlanInitial());
  final ThePlanRepo thePlanRepo;

  Future<void> getUserPrivatePlan({
    required int tripId,
  }) async {
    emit(GetUserPrivatePlanLoading());
    var result = await thePlanRepo.getUserPrivatePlan(tripId: tripId);
    result.fold((failure) {
      emit(GetUserPrivatePlanFailure(failure.errMessage));
      print(failure.errMessage);
    }, (getUserPrivatePlanModel) {
      emit(GetUserPrivatePlanSuccess(getUserPrivatePlanModel));
    });
  }
}
