part of 'delete_hotel_cubit.dart';

@immutable
sealed class DeleteHotelState {}

final class DeleteHotelInitial extends DeleteHotelState {}

class DeleteHotelLoading extends DeleteHotelState {}

class DeleteHotelSuccess extends DeleteHotelState {
  final DeleteFromPlanModel deleteFromPlanModel;

  DeleteHotelSuccess(this.deleteFromPlanModel);
}

class DeleteHotelFailure extends DeleteHotelState {
  final String errMessage;

  DeleteHotelFailure(this.errMessage);
}
