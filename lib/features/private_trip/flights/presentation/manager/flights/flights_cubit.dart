import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'flights_state.dart';

class FlightsCubit extends Cubit<FlightsState> {
  FlightsCubit()
      : super(const FlightsState(
          cabinClass: null,
          vlaueCabin: null,
          flightWay: null,
          whereFromAirport: null,
          whereFromAirportId: null,
          whereToAirportId: null,
          whereToAirport: null,
        ));

  void setCabinClass(String? cabinClass) {
    emit(state.copyWith(cabinClass: cabinClass));
  }

  void setVlaueCabin(String? valueCabinClass) {
    emit(state.copyWith(vlaueCabin: valueCabinClass));
  }

  void setFlightsWay(String? flightsWay) {
    emit(state.copyWith(flightWay: flightsWay));
  }

  void setWhereFromAirport(String? whereFromAirport) {
    emit(state.copyWith(whereFromAirport: whereFromAirport));
  }

  void setWhereFromAirportId(int? whereFromAirportId) {
    emit(state.copyWith(whereFromAirportId: whereFromAirportId));
  }

  void setWhereToAirport(String? whereToAirport) {
    emit(state.copyWith(whereToAirport: whereToAirport));
  }

  void setWhereToAirportId(int? whereToAirportId) {
    emit(state.copyWith(whereToAirportId: whereToAirportId));
  }
}
