import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'private_trip_state.dart';

class PrivateTripCubit extends Cubit<PrivateTripState> {
  PrivateTripCubit()
      : super(const PrivateTripState(
          startDate: null,
          endDate: null,
          selectedNumber: 0,
          selectedcity: {'id': '', 'city': null},
          enterCity: {'id': '', 'city': null},
        ));

  void setStartDate(DateTime? date) {
    emit(state.copyWith(startDate: date));
  }

  void setEndDate(DateTime? date) {
    emit(state.copyWith(endDate: date));
  }

  void setSelectedNumber(int number) {
    emit(state.copyWith(selectedNumber: number));
  }

  void setSelectedCity(dynamic city) {
    emit(state.copyWith(selectedcity: city));
  }

  void setEnterCity(dynamic city) {
    emit(state.copyWith(enterCity: city));
  }
}
