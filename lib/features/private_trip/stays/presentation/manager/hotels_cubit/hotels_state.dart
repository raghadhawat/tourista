part of 'hotels_cubit.dart';

@immutable
sealed class HotelsState {}

final class HotelsInitial extends HotelsState {}

final class HotelsLoading extends HotelsState {}

final class HotelsSuccess extends HotelsState {
  final HotelsModel hotelsModel;

  HotelsSuccess({required this.hotelsModel});
}

final class HotelsFailure extends HotelsState {
  final String errMessage;

  HotelsFailure({required this.errMessage});
}
