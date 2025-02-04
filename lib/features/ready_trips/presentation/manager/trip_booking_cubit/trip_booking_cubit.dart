import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/ready_trips/data/models/trip_booking_model/trip_booking_model.dart';
import 'package:tourista/features/ready_trips/data/repos/ready_trip_repo_impl.dart';

part 'trip_booking_state.dart';

class TripBookingCubit extends Cubit<TripBookingState> {
  TripBookingCubit(this.readyTripsRepoImpl) : super(TripBookingInitial());
  ReadyTripsRepoImpl readyTripsRepoImpl;
  Future<void> bookReadyTripFun(
      {required int tripPointId,
      required int ticketsNumber,
      required bool pointsOrNot,
      required bool vipTicket}) async {
    emit(TripBookingLoading());
    var result = await readyTripsRepoImpl.bookReadyTrip(
        pointsOrNot: pointsOrNot,
        tripPointId: tripPointId,
        ticketsNumber: ticketsNumber,
        vipTicket: vipTicket);

    result.fold((failure) {
      emit(TripBookingFailure(errMessage: failure.errMessage));
    }, (tripBookingModel) {
      emit(TripBookingSuccess(tripBookingModel: tripBookingModel));
    });
  }
}
