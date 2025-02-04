import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/delete_models/delete_model.dart';
import '../../../data/repos/the_plan_repo.dart';

part 'delete_activities_for_day_state.dart';

class DeleteActivitiesForDayCubit extends Cubit<DeleteActivitiesForDayState> {
  DeleteActivitiesForDayCubit(this.thePlanRepo)
      : super(DeleteActivitiesForDayInitial());
  final ThePlanRepo thePlanRepo;

  Future<void> deleteActivities({required int tripDayId}) async {
    emit(DeleteActivitiesForDayLoading());
    var result = await thePlanRepo.deleteActivity(tripDayId: tripDayId);

    result.fold((failure) {
      emit(DeleteActivitiesForDayFailure(failure.errMessage));
    }, (deleteFromPlanModel) {
      emit(DeleteActivitiesForDaySuccess(deleteFromPlanModel));
    });
  }
}
