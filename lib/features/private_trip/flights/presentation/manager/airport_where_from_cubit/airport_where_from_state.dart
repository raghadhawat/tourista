part of 'airport_where_from_cubit.dart';

@immutable
sealed class AirportWhereFromState {}

final class AirportWhereFromInitial extends AirportWhereFromState {}

final class AirportWhereFromLoading extends AirportWhereFromState {}

final class AirportWhereFromSuccess extends AirportWhereFromState {
  final AirportWhereModel airportWhereModel;

  AirportWhereFromSuccess({required this.airportWhereModel});
}

final class AirportWhereFromFailure extends AirportWhereFromState {
  final String errMessage;

  AirportWhereFromFailure({required this.errMessage});
}
