import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/my_trips/data/models/cancel_private_trip_model.dart';
import 'package:tourista/features/my_trips/data/repos/my_trips_repo_impl.dart';

part 'cancel_private_trip_state.dart';

class CancelPrivateTripCubit extends Cubit<CancelPrivateTripState> {
  CancelPrivateTripCubit(this.myTripsRepoImpl)
      : super(CancelPrivateTripInitial());
  final MyTripsRepoImpl myTripsRepoImpl;
  Future<void> cancelePrivateTripsFun({required int tripId}) async {
    emit(CancelPrivateTripLoading());
    var result = await myTripsRepoImpl.cancelPrivateTrip(tripId: tripId);

    result.fold((failure) {
      emit(CancelPrivateTripFailure(errMessage: failure.errMessage));
    }, (cancelPrivateTripModel) {
      emit(CancelPrivateTripSuccess(
          cancelPrivateTripModel: cancelPrivateTripModel));
    });
  }
}
