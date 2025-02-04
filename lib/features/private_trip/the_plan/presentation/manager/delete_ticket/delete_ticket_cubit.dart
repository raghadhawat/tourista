import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/models/delete_models/delete_model.dart';
import '../../../data/repos/the_plan_repo.dart';
part 'delete_ticket_state.dart';

class DeleteTicketCubit extends Cubit<DeleteTicketState> {
  DeleteTicketCubit(this.thePlanRepo) : super(DeleteTicketInitial());
  final ThePlanRepo thePlanRepo;

  Future<void> deleteTicket({required int bookingTicketId}) async {
    emit(DeleteTicketLoading());
    var result =
        await thePlanRepo.deleteTicket(bookingTicketId: bookingTicketId);

    result.fold((failure) {
      emit(DeleteTicketFailure(failure.errMessage));
    }, (deleteFromPlanModel) {
      emit(DeleteTicketSuccess(deleteFromPlanModel));
    });
  }
}
