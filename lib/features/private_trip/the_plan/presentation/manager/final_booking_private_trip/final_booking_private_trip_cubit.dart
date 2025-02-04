import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/private_trip/the_plan/data/models/final_booking_private_trip_model/final_booking_private_trip_model.dart';

import '../../../data/repos/the_plan_repo.dart';

part 'final_booking_private_trip_state.dart';

class FinalBookingPrivateTripCubit extends Cubit<FinalBookingPrivateTripState> {
  FinalBookingPrivateTripCubit(this.thePlanRepo)
      : super(FinalBookingPrivateTripInitial());
  final ThePlanRepo thePlanRepo;

  Future<void> finalBookingPrivateTrip({
    required int tripId,
  }) async {
    emit(FinalBookingPrivateTripLoading());
    var result = await thePlanRepo.finalBookingPrivateTrip(tripId: tripId);

    result.fold((failure) {
      emit(FinalBookingPrivateTripFailure(failure.errMessage));
      print(failure.errMessage);
    }, (finalBookingPrivateTripModel) {
      emit(FinalBookingPrivateTripSuccess(finalBookingPrivateTripModel));
    });
  }
}
