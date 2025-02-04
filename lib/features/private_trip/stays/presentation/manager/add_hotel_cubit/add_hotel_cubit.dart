import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/private_trip/stays/data/models/add_hotel_model/add_hotel_model.dart';
import 'package:tourista/features/private_trip/stays/data/repos/stays_repo_impl.dart';

part 'add_hotel_state.dart';

class AddHotelCubit extends Cubit<AddHotelState> {
  AddHotelCubit(this.staysRepoImpl) : super(AddHotelInitial());
  StaysRepoImpl staysRepoImpl;
  Future<void> addHotelCubitFun(
      {required int tripId,
      required String checkIn,
      required String checkOut,
      required List<dynamic> rooms}) async {
    emit(AddHotelLoading());
    var result = await staysRepoImpl.addHotels(
        tripId: tripId, checkIn: checkIn, checkOut: checkOut, rooms: rooms);

    result.fold((failure) {
      emit(AddHotelFailure(errMessage: failure.errMessage));
    }, (addHotelModel) {
      emit(AddHotelSuccess(addHotelModel: addHotelModel));
    });
  }
}
