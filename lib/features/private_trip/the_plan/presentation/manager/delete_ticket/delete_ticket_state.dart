part of 'delete_ticket_cubit.dart';

@immutable
sealed class DeleteTicketState {}

final class DeleteTicketInitial extends DeleteTicketState {}

class DeleteTicketLoading extends DeleteTicketState {}

class DeleteTicketSuccess extends DeleteTicketState {
  final DeleteFromPlanModel deleteFromPlanModel;

  DeleteTicketSuccess(this.deleteFromPlanModel);
}

class DeleteTicketFailure extends DeleteTicketState {
  final String errMessage;

  DeleteTicketFailure(this.errMessage);
}
