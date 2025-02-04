import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/ready_trips/data/models/ready_trips_details_model/ready_trips_details_model.dart';
import 'package:tourista/features/ready_trips/data/repos/ready_trip_repo_impl.dart';

part 'ready_trip_details_state.dart';

class ReadyTripDetailsCubit extends Cubit<ReadyTripDetailsState> {
  ReadyTripDetailsCubit(this.readyTripsRepoImpl)
      : super(ReadyTripDetailsInitial());
  ReadyTripsRepoImpl readyTripsRepoImpl;

  Future<void> getReadyTripDetailsFun({required int tripId}) async {
    emit(ReadyTripDetailsLoading());
    var result = await readyTripsRepoImpl.getReadyTripDetails(tripId: tripId);

    result.fold((failure) {
      emit(ReadyTripDetailsFailure(errMessage: failure.errMessage));
    }, (readyTripsDetailsModel) {
      emit(ReadyTripDetailsSuccess(
          readyTripsDetailsModel: readyTripsDetailsModel));
    });
  }
}
