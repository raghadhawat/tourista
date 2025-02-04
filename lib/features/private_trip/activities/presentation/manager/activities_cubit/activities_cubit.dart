import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/features/private_trip/activities/data/repos/activities_repo.dart';
import '../../../data/models/tourism_activities/tourism_activities_model.dart';
part 'activities_state.dart';

class ActivitiesCubit extends Cubit<ActivitiesState> {
  ActivitiesCubit(this.activitiesRepo) : super(ActivitiesInitial());

  final ActivitiesRepo activitiesRepo;
  bool _isCubitClosed = false;

  Future<void> getTourismPlaces({
    required String tourismTybe,
    required int tripId,
  }) async {
    if (!_isCubitClosed) {
      emit(ActivitiesLoading());

      var result = await activitiesRepo.getTourismPlaces(
          tourismTybe: tourismTybe, tripId: tripId);

      result.fold(
        (failure) {
          if (!_isCubitClosed) {
            emit(ActivitiesFailure(failure.errMessage));
          }
        },
        (tourismActivitiesModel) {
          if (!_isCubitClosed) {
            emit(ActivitiesSuccess(
                tourismActivitiesModel: tourismActivitiesModel));
          }
        },
      );
    }
  }

  @override
  Future<void> close() {
    _isCubitClosed = true;
    return super.close();
  }
}
