import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/private_trip/activities/data/models/get_trip_days/get_trip_days.dart';

import '../../../data/repos/activities_repo.dart';

part 'get_trip_days_state.dart';

class GetTripDaysCubit extends Cubit<GetTripDaysState> {
  GetTripDaysCubit(this.activitiesRepo) : super(GetTripDaysInitial());
  final ActivitiesRepo activitiesRepo;

  Future<void> getTripDays({
    required int tripId,
  }) async {
    emit(GetTripDaysLoading());
    var result = await activitiesRepo.getTripDays(tripId: tripId);
    result.fold((failure) {
      emit(GetTripDaysFailure(failure.errMessage));
      print(failure.errMessage);
    }, (getTripDaysModel) {
      emit(GetTripDaysSuccess(getTripDaysModel));
    });
  }
}
