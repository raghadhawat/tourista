part of 'all_notification_cubit.dart';

@immutable
sealed class AllNotificationState {}

final class AllNotificationInitial extends AllNotificationState {}

final class AllNotificationLoading extends AllNotificationState {}

final class AllNotificationSuccess extends AllNotificationState {
  final AllNotificationModel allNotificationModel;

  AllNotificationSuccess({required this.allNotificationModel});
}

final class AllNotificationFailure extends AllNotificationState {
  final String errMessage;

  AllNotificationFailure({required this.errMessage});
}
