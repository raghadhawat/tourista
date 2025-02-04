import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/private_trip/activities/data/models/search_tourism_places_model/search_tourism_places_model.dart';
import '../../../data/repos/activities_repo.dart';
part 'search_activity_state.dart';

class SearchActivityCubit extends Cubit<SearchActivityState> {
  SearchActivityCubit(this.activitiesRepo) : super(SearchActivityInitial());

  final ActivitiesRepo activitiesRepo;
  bool _isCubitClosed = false;

  Future<void> searchActivity({
    required String search,
    String? type,
    required int tripId,
  }) async {
    if (!_isCubitClosed) {
      emit(SearchActivityLoading());
      var result = await activitiesRepo.searchTourismPlaces(
          tripId: tripId, search: search, type: type);

      result.fold(
        (failure) {
          if (!_isCubitClosed) {
            emit(SearchActivityFailure(failure.errMessage));
          }
        },
        (searchTourismPlacesModel) {
          if (!_isCubitClosed) {
            emit(SearchActivitySuccess(searchTourismPlacesModel));
          }
        },
      );
    }
  }

  @override
  Future<void> close() {
    _isCubitClosed = true;
    return super.close();
  }
}
