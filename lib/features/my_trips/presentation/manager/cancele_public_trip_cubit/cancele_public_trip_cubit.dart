import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/my_trips/data/models/cancele_public_trip_model/cancele_public_trip_model.dart';
import 'package:tourista/features/my_trips/data/repos/my_trips_repo_impl.dart';

part 'cancele_public_trip_state.dart';

class CancelePublicTripCubit extends Cubit<CancelePublicTripState> {
  CancelePublicTripCubit(this.myTripsRepoImpl)
      : super(CancelePublicTripInitial());
  final MyTripsRepoImpl myTripsRepoImpl;
  Future<void> cancelePublicTripsFun({required int userTripPoint}) async {
    emit(CancelePublicTripLoading());
    var result =
        await myTripsRepoImpl.cancelPublicTrip(userTripPoint: userTripPoint);

    result.fold((failure) {
      emit(CancelePublicTripFailure(errMessage: failure.errMessage));
    }, (cancelePublicTripModel) {
      emit(CancelePublicTripSuccess(
          cancelePublicTripModel: cancelePublicTripModel));
    });
  }
}
