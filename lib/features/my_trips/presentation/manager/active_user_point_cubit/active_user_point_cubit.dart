import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/my_trips/data/models/active_user_point_model/active_user_point_model.dart';
import 'package:tourista/features/my_trips/data/repos/my_trips_repo_impl.dart';

part 'active_user_point_state.dart';

class ActiveUserPointCubit extends Cubit<ActiveUserPointState> {
  ActiveUserPointCubit(this.myTripsRepoImpl) : super(ActiveUserPointInitial());
  MyTripsRepoImpl myTripsRepoImpl;
  bool _isCubitClosed = false;

  Future<void> getActiveUserPointTripsFun({required int tripId}) async {
    if (!_isCubitClosed) {
      emit(ActiveUserPointLoading());
      var result =
          await myTripsRepoImpl.getActiveUserPointTrips(tripId: tripId);

      result.fold(
        (failure) {
          if (!_isCubitClosed) {
            emit(ActiveUserPointFailure(errMessage: failure.errMessage));
          }
        },
        (activeUserPointModel) {
          if (!_isCubitClosed) {
            emit(ActiveUserPointSuccess(
                activeUserPointModel: activeUserPointModel));
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
