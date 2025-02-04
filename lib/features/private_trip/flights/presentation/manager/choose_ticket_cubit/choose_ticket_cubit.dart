import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/private_trip/flights/data/models/choose_ticket_model/choose_ticket_model.dart';
import 'package:tourista/features/private_trip/flights/data/repos/flights_repo_impl.dart';

part 'choose_ticket_state.dart';

class ChooseTicketCubit extends Cubit<ChooseTicketState> {
  ChooseTicketCubit(this.flightsRepoImpl) : super(ChooseTicketInitial());
  final FlightsRepoImpl flightsRepoImpl;
  Future<void> chooseTicketCubitFun({
    required String tripId,
    required String ticketId,
  }) async {
    emit(ChooseTicketLoading());
    var result = await flightsRepoImpl.chooseTicket(
      tripId: tripId,
      ticketId: ticketId,
    );

    result.fold((failure) {
      emit(ChooseTicketFailure(errMessage: failure.errMessage));
    }, (chooseTicketModel) {
      emit(ChooseTicketSuccess(chooseTicketModel: chooseTicketModel));
    });
  }
}
