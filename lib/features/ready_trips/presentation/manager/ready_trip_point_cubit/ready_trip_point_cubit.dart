import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/ready_trips/data/models/ready_trips_point_model/ready_trips_point_model.dart';
import 'package:tourista/features/ready_trips/data/repos/ready_trip_repo_impl.dart';

part 'ready_trip_point_state.dart';

class ReadyTripPointCubit extends Cubit<ReadyTripPointState> {
  ReadyTripPointCubit(this.readyTripsRepoImpl) : super(ReadyTripPointInitial());
  ReadyTripsRepoImpl readyTripsRepoImpl;

  Future<void> getReadyTripPointsFun({required int tripId}) async {
    emit(ReadyTripPointLoading());
    var result = await readyTripsRepoImpl.getReadyTripPoints(tripId: tripId);

    result.fold((failure) {
      emit(ReadyTripPointFailure(errMessage: failure.errMessage));
    }, (readyTripsPointModel) {
      emit(ReadyTripPointSuccess(readyTripsPointModel: readyTripsPointModel));
    });
  }
}
