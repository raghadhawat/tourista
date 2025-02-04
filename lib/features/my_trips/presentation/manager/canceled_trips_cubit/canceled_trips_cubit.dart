import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/my_trips/data/models/all_trips_model/all_trips_model.dart';
import 'package:tourista/features/my_trips/data/repos/my_trips_repo_impl.dart';

part 'canceled_trips_state.dart';

class CanceledTripsCubit extends Cubit<CanceledTripsState> {
  CanceledTripsCubit(this.myTripsRepoImpl) : super(CanceledTripsInitial());
  MyTripsRepoImpl myTripsRepoImpl;
  bool _isCubitClosed = false;

  Future<void> getCanceledTripsFun() async {
    if (!_isCubitClosed) {
      emit(CanceledTripsLoading());
      var result = await myTripsRepoImpl.getCanceledTrips();

      result.fold(
        (failure) {
          if (!_isCubitClosed) {
            emit(CanceledTripsFailure(errMessage: failure.errMessage));
          }
        },
        (allTripsModel) {
          if (!_isCubitClosed) {
            emit(CanceledTripsSuccess(allTripsModel: allTripsModel));
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
