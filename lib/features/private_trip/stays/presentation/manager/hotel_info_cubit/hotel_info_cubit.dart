import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'hotel_info_state.dart';

class HotelInfoCubit extends Cubit<HotelInfoState> {
  HotelInfoCubit()
      : super(const HotelInfoState(
            checkIn: null, checkOut: null, rooms: null, price: 0));

  void setCheckIn(DateTime? date) {
    emit(state.copyWith(checkIn: date));
  }

  void setCheckOut(DateTime? date) {
    emit(state.copyWith(checkOut: date));
  }

  void getPrice() {
    double price = 0;
    state.rooms?.forEach((key, value) {
      price += value[key][1] * value[key][0];
    });

    price *=
        (state.checkOut?.difference(state.checkIn ?? DateTime.now()).inDays) ??
            1;
    emit(state.copyWith(price: price));
  }

  void setRooms(int roomId, Map<int, dynamic>? rooms) {
    final updatedRoom = Map<int, dynamic>.from(state.rooms ?? {});

    updatedRoom[roomId] =
        rooms; // Overwrite the previous value with the new value

    emit(state.copyWith(rooms: updatedRoom));
  }

  void resetCubit() {
    emit(const HotelInfoState(
      checkIn: null,
      checkOut: null,
      rooms: null,
      price: 0,
    ));
  }
}
