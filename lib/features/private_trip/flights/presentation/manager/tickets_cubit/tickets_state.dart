part of 'tickets_cubit.dart';

@immutable
sealed class TicketsState {}

final class TicketsInitial extends TicketsState {}

final class TicketsLoading extends TicketsState {}

final class TicketsSuccess extends TicketsState {
  final TicketsModel ticketsModel;

  TicketsSuccess({required this.ticketsModel});
}

final class TicketsFailure extends TicketsState {
  final String errMessage;

  TicketsFailure({required this.errMessage});
}
