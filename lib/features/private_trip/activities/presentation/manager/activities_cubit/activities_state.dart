part of 'activities_cubit.dart';

sealed class ActivitiesState {}

final class ActivitiesInitial extends ActivitiesState {}

class ActivitiesLoading extends ActivitiesState {}

class ActivitiesSuccess extends ActivitiesState {
  final TourismActivitiesModel tourismActivitiesModel;

  ActivitiesSuccess({required this.tourismActivitiesModel});
}

class ActivitiesFailure extends ActivitiesState {
  final String errMessage;

  ActivitiesFailure(this.errMessage);
}
