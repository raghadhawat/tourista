import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/private_trip/the_plan/data/models/delete_models/delete_model.dart';

import '../../../data/repos/the_plan_repo.dart';

part 'delete_hotel_state.dart';

class DeleteHotelCubit extends Cubit<DeleteHotelState> {
  DeleteHotelCubit(this.thePlanRepo) : super(DeleteHotelInitial());
  final ThePlanRepo thePlanRepo;

  Future<void> deleteHotel(
      {required int tripId, required int citiesHotelId}) async {
    emit(DeleteHotelLoading());
    var result = await thePlanRepo.deleteBookingHotel(
        tripId: tripId, citiesHotelId: citiesHotelId);

    result.fold((failure) {
      emit(DeleteHotelFailure(failure.errMessage));
      print(failure.errMessage);
    }, (deleteFromPlanModel) {
      emit(DeleteHotelSuccess(deleteFromPlanModel));
    });
  }
}
