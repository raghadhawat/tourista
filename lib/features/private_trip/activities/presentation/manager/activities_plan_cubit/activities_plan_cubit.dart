import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/private_trip/activities/data/models/activities_plan_model/activities_plan_model.dart';
import 'package:tourista/features/private_trip/activities/data/repos/activities_repo.dart';

part 'activities_plan_state.dart';

class ActivitiesPlanCubit extends Cubit<ActivitiesPlanState> {
  ActivitiesPlanCubit(this.activitiesRepo) : super(ActivitiesPlanInitial());

  final ActivitiesRepo activitiesRepo;

  Future<void> postActivitiesPlan({required Map<String, dynamic> body}) async {
    emit(ActivitiesPlanLoading());
    var result = await activitiesRepo.postActivitiesPlan(body: body);
    result.fold((failure) {
      emit(ActivitiesPlanFailure(failure.errMessage));
      print(failure.errMessage);
    }, (activitiesPlanModel) {
      emit(ActivitiesPlanSuccess(activitiesPlanModel: activitiesPlanModel));
    });
  }
}
