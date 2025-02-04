import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/my_trips/data/models/favorit_trips_model/favorit_trips_model.dart';
import 'package:tourista/features/my_trips/data/repos/my_trips_repo_impl.dart';

part 'favorit_trips_state.dart';

class FavoritTripsCubit extends Cubit<FavoritTripsState> {
  FavoritTripsCubit(this.myTripsRepoImpl) : super(FavoritTripsInitial());
  MyTripsRepoImpl myTripsRepoImpl;
  bool _isCubitClosed = false;

  Future<void> getFavoritTripsFun() async {
    if (!_isCubitClosed) {
      emit(FavoritTripsLoading());
      var result = await myTripsRepoImpl.getFavoritTrips();

      result.fold(
        (failure) {
          if (!_isCubitClosed) {
            emit(FavoritTripsFailure(errMessage: failure.errMessage));
          }
        },
        (favoritTripsModel) {
          if (!_isCubitClosed) {
            emit(FavoritTripsSuccess(favoritTripsModel: favoritTripsModel));
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
