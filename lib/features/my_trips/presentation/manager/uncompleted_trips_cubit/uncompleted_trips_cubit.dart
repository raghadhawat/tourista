import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/my_trips/data/models/uncompleted_trips_model/uncompleted_trips_model.dart';
import 'package:tourista/features/my_trips/data/repos/my_trips_repo_impl.dart';

part 'uncompleted_trips_state.dart';

class UncompletedTripsCubit extends Cubit<UncompletedTripsState> {
  UncompletedTripsCubit(this.myTripsRepoImpl)
      : super(UncompletedTripsInitial());
  MyTripsRepoImpl myTripsRepoImpl;
  bool _isCubitClosed = false;

  Future<void> getUncompletedTripsFun() async {
    if (!_isCubitClosed) {
      emit(UncompletedTripsLoading());
      var result = await myTripsRepoImpl.getUncompletedTrips();

      result.fold(
        (failure) {
          if (!_isCubitClosed) {
            emit(UncompletedTripsFailure(errMessage: failure.errMessage));
          }
        },
        (uncompletedTripsModel) {
          if (!_isCubitClosed) {
            print(uncompletedTripsModel.underConstructionTrip);
            emit(UncompletedTripsSuccess(
                uncompletedTripsModel: uncompletedTripsModel));
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
