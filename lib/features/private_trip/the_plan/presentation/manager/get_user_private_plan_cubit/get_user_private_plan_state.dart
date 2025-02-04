part of 'get_user_private_plan_cubit.dart';

@immutable
sealed class GetUserPrivatePlanState {}

final class GetUserPrivatePlanInitial extends GetUserPrivatePlanState {}

class GetUserPrivatePlanLoading extends GetUserPrivatePlanState {}

class GetUserPrivatePlanSuccess extends GetUserPrivatePlanState {
  final GetUserPrivatePlanModel getUserPrivatePlanModel;

  GetUserPrivatePlanSuccess(this.getUserPrivatePlanModel);
}

class GetUserPrivatePlanFailure extends GetUserPrivatePlanState {
  final String errMessage;

  GetUserPrivatePlanFailure(this.errMessage);
}
