part of 'choose_ticket_cubit.dart';

@immutable
sealed class ChooseTicketState {}

final class ChooseTicketInitial extends ChooseTicketState {}

final class ChooseTicketLoading extends ChooseTicketState {}

final class ChooseTicketSuccess extends ChooseTicketState {
  final ChooseTicketModel chooseTicketModel;

  ChooseTicketSuccess({required this.chooseTicketModel});
}

final class ChooseTicketFailure extends ChooseTicketState {
  final String errMessage;

  ChooseTicketFailure({required this.errMessage});
}
