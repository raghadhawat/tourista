import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/ready_trips/data/models/all_ready_trips_model/all_ready_trips_model.dart';
import 'package:tourista/features/ready_trips/data/repos/ready_trip_repo_impl.dart';

part 'all_ready_trips_state.dart';

class AllReadyTripsCubit extends Cubit<AllReadyTripsState> {
  AllReadyTripsCubit(this.readyTripsRepoImpl) : super(AllReadyTripsInitial());
  ReadyTripsRepoImpl readyTripsRepoImpl;
  Future<void> getAllReadyTripsFun(
      {int? classificationId, String? sortBy, String? search}) async {
    emit(AllReadyTripsLoading());
    var result = await readyTripsRepoImpl.getAllReadyTrips(
        classificationId: classificationId, sortBy: sortBy, search: search);

    result.fold((failure) {
      emit(AllReadyTripsFailure(errMessage: failure.errMessage));
    }, (allReadyTripsModel) {
      emit(AllReadyTripsSuccess(allReadyTripsModel: allReadyTripsModel));
    });
  }
}
