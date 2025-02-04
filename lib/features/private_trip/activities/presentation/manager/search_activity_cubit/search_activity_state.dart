part of 'search_activity_cubit.dart';

@immutable
sealed class SearchActivityState {}

final class SearchActivityInitial extends SearchActivityState {}

class SearchActivityLoading extends SearchActivityState {}

class SearchActivitySuccess extends SearchActivityState {
  final SearchTourismPlacesModel searchTourismPlacesModel;

  SearchActivitySuccess(this.searchTourismPlacesModel);
}

class SearchActivityFailure extends SearchActivityState {
  final String errMessage;

  SearchActivityFailure(this.errMessage);
}
