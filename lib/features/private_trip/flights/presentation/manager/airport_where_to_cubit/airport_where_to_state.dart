part of 'airport_where_to_cubit.dart';

@immutable
sealed class AirportWhereToState {}

final class AirportWhereToInitial extends AirportWhereToState {}

final class AirportWhereToLoading extends AirportWhereToState {}

final class AirportWhereToSuccess extends AirportWhereToState {
  final AirportWhereModel airportWhereModel;

  AirportWhereToSuccess({required this.airportWhereModel});
}

final class AirportWhereToFailure extends AirportWhereToState {
  final String errMessage;

  AirportWhereToFailure({required this.errMessage});
}
