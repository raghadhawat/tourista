import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/my_trips/data/models/all_trips_model/all_trips_model.dart';
import 'package:tourista/features/my_trips/data/repos/my_trips_repo_impl.dart';

part 'past_trips_state.dart';

class PastTripsCubit extends Cubit<PastTripsState> {
  PastTripsCubit(this.myTripsRepoImpl) : super(PastTripsInitial());
  MyTripsRepoImpl myTripsRepoImpl;
  bool _isCubitClosed = false;

  Future<void> getPastTripsFun() async {
    if (!_isCubitClosed) {
      emit(PastTripsLoading());
      var result = await myTripsRepoImpl.getPastTrips();

      result.fold(
        (failure) {
          if (!_isCubitClosed) {
            emit(PastTripsFailure(errMessage: failure.errMessage));
          }
        },
        (allTripsModel) {
          if (!_isCubitClosed) {
            emit(PastTripsSuccess(allTripsModel: allTripsModel));
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
