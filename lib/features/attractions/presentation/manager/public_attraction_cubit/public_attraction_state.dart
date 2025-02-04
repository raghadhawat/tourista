part of 'public_attraction_cubit.dart';

@immutable
sealed class PublicAttractionState {}

final class PublicAttractionInitial extends PublicAttractionState {}

final class PublicAttractionLoading extends PublicAttractionState {}

final class PublicAttractionSuccess extends PublicAttractionState {
  final PublicTripAttractionsModel publicTripAttractionsModel;

  PublicAttractionSuccess(this.publicTripAttractionsModel);
}

final class PublicAttractionFailure extends PublicAttractionState {
  final String errMessage;

  PublicAttractionFailure({required this.errMessage});
}
