import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/my_trips/data/models/all_trips_model/all_trips_model.dart';
import 'package:tourista/features/my_trips/data/repos/my_trips_repo_impl.dart';

part 'active_trips_state.dart';

class ActiveTripsCubit extends Cubit<ActiveTripsState> {
  ActiveTripsCubit(this.myTripsRepoImpl) : super(ActiveTripsInitial());
  MyTripsRepoImpl myTripsRepoImpl;
  bool _isCubitClosed = false;

  Future<void> getActiveTripsFun() async {
    if (!_isCubitClosed) {
      emit(ActiveTripsLoading());
      var result = await myTripsRepoImpl.getActiveTrips();

      result.fold(
        (failure) {
          if (!_isCubitClosed) {
            emit(ActiveTripsFailure(errMessage: failure.errMessage));
          }
        },
        (allTripsModel) {
          if (!_isCubitClosed) {
            emit(ActiveTripsSuccess(allTripsModel: allTripsModel));
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
