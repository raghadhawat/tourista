import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'trip_info_state.dart';

class TripInfoCubit extends Cubit<TripInfoState> {
  TripInfoCubit()
      : super(const TripInfoState(
            vipTicket: false,
            ticketNumber: null,
            pointId: null,
            price: null,
            pointName: null,
            pointsOrNot: false));
  void setTicketNumber(int? ticketNumber) {
    emit(state.copyWith(ticketNumber: ticketNumber));
  }

  void setPointId(int? pointId) {
    emit(state.copyWith(pointId: pointId));
  }

  void setPointName(String? pointName) {
    emit(state.copyWith(pointName: pointName));
  }

  void setPrice(int? price) {
    emit(state.copyWith(price: price));
  }

  void setVipTicket(bool? vipTicket) {
    emit(state.copyWith(vipTicket: vipTicket));
  }

  void setPointsOrNot(bool? pointsOrNot) {
    emit(state.copyWith(pointsOrNot: pointsOrNot));
  }

  void resetCubit() {
    emit(const TripInfoState(
      vipTicket: false,
      price: null,
      pointId: null,
      ticketNumber: null,
      pointName: null,
      pointsOrNot: false,
    ));
  }
}
