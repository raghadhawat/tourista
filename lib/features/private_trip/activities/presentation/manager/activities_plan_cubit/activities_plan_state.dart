part of 'activities_plan_cubit.dart';

@immutable
sealed class ActivitiesPlanState {}

final class ActivitiesPlanInitial extends ActivitiesPlanState {}

class ActivitiesPlanLoading extends ActivitiesPlanState {}

class ActivitiesPlanSuccess extends ActivitiesPlanState {
  final ActivitiesPlanModel activitiesPlanModel;
  ActivitiesPlanSuccess({required this.activitiesPlanModel});
}

class ActivitiesPlanFailure extends ActivitiesPlanState {
  final String errMessage;

  ActivitiesPlanFailure(this.errMessage);
}
