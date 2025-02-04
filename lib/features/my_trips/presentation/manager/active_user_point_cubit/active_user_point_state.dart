part of 'active_user_point_cubit.dart';

@immutable
sealed class ActiveUserPointState {}

final class ActiveUserPointInitial extends ActiveUserPointState {}

final class ActiveUserPointLoading extends ActiveUserPointState {}

final class ActiveUserPointSuccess extends ActiveUserPointState {
  final ActiveUserPointModel activeUserPointModel;

  ActiveUserPointSuccess({required this.activeUserPointModel});
}

final class ActiveUserPointFailure extends ActiveUserPointState {
  final String errMessage;

  ActiveUserPointFailure({required this.errMessage});
}
