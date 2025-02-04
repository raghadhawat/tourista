import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/private_trip/flights/data/models/tickets_model/tickets_model.dart';
import 'package:tourista/features/private_trip/flights/data/repos/flights_repo_impl.dart';

part 'tickets_state.dart';

class TicketsCubit extends Cubit<TicketsState> {
  TicketsCubit(this.flightsRepoImpl) : super(TicketsInitial());
  final FlightsRepoImpl flightsRepoImpl;
  Future<void> searchForTicketCubitFun({
    required int tripId,
    required int airFromId,
    required int airToId,
    required String cabinClass,
    required String flightsWay,
  }) async {
    emit(TicketsLoading());
    var result = await flightsRepoImpl.searchForTickets(
        tripId: tripId,
        airFromId: airFromId,
        airToId: airToId,
        cabinClass: cabinClass,
        flightsWay: flightsWay);

    result.fold((failure) {
      print(failure.errMessage);
      emit(TicketsFailure(errMessage: failure.errMessage));
    }, (ticketsModel) {
      emit(TicketsSuccess(ticketsModel: ticketsModel));
    });
  }
}
