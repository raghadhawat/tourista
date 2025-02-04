part of 'delete_activities_for_day_cubit.dart';

@immutable
sealed class DeleteActivitiesForDayState {}

final class DeleteActivitiesForDayInitial extends DeleteActivitiesForDayState {}

class DeleteActivitiesForDayLoading extends DeleteActivitiesForDayState {}

class DeleteActivitiesForDaySuccess extends DeleteActivitiesForDayState {
  final DeleteFromPlanModel deleteFromPlanModel;

  DeleteActivitiesForDaySuccess(this.deleteFromPlanModel);
}

class DeleteActivitiesForDayFailure extends DeleteActivitiesForDayState {
  final String errMessage;

  DeleteActivitiesForDayFailure(this.errMessage);
}
