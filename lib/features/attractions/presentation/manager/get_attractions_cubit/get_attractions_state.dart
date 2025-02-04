part of 'get_attractions_cubit.dart';

@immutable
sealed class GetAttractionsState {}

final class GetAttractionsInitial extends GetAttractionsState {}

final class GetAttractionsLoading extends GetAttractionsState {}

final class GetAttractionsSuccess extends GetAttractionsState {
  final AttractionsModel attractionsModel;

  GetAttractionsSuccess(this.attractionsModel);
}

final class GetAttractionsFailure extends GetAttractionsState {
  final String errMessage;

  GetAttractionsFailure({required this.errMessage});
}
