import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/private_trip/flights/data/models/airport_where_from_model/airport_where_model.dart';
import 'package:tourista/features/private_trip/flights/data/repos/flights_repo_impl.dart';

part 'airport_where_to_state.dart';

class AirportWhereToCubit extends Cubit<AirportWhereToState> {
  AirportWhereToCubit(this.flightsRepoImpl) : super(AirportWhereToInitial());
  FlightsRepoImpl flightsRepoImpl;
  Future<void> getAirportToCubitFun({required int cityId}) async {
    emit(AirportWhereToLoading());
    var result = await flightsRepoImpl.getAirportTo(cityId: cityId);

    result.fold((failure) {
      emit(AirportWhereToFailure(errMessage: failure.errMessage));
    }, (airportWhereModel) {
      emit(AirportWhereToSuccess(airportWhereModel: airportWhereModel));
    });
  }
}
