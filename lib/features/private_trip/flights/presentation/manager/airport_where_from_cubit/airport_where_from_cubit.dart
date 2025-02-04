import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/private_trip/flights/data/models/airport_where_from_model/airport_where_model.dart';
import 'package:tourista/features/private_trip/flights/data/repos/flights_repo_impl.dart';

part 'airport_where_from_state.dart';

class AirportWhereFromCubit extends Cubit<AirportWhereFromState> {
  AirportWhereFromCubit(this.flightsRepoImpl)
      : super(AirportWhereFromInitial());
  FlightsRepoImpl flightsRepoImpl;
  Future<void> getAirportFromCubitFun({required int cityId}) async {
    emit(AirportWhereFromLoading());
    var result = await flightsRepoImpl.getAirportFrom(cityId: cityId);

    result.fold((failure) {
      emit(AirportWhereFromFailure(errMessage: failure.errMessage));
    }, (airportWhereModel) {
      emit(AirportWhereFromSuccess(airportWhereModel: airportWhereModel));
    });
  }
}
