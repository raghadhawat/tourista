part of 'get_user_info_cubit.dart';

@immutable
sealed class GetUserInfoState {}

final class GetUserInfoInitial extends GetUserInfoState {}

class GetUserInfoLoading extends GetUserInfoState {}

class GetUserInfoSuccess extends GetUserInfoState {
  final UserInfoModel userInfoModel;

  GetUserInfoSuccess(this.userInfoModel);
}

class GetUserInfoFailure extends GetUserInfoState {
  final String errMessage;

  GetUserInfoFailure(this.errMessage);
}
