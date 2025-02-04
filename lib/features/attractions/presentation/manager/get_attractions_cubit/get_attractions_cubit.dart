import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/attractions/data/models/attractions_model/attractions_model.dart';
import 'package:tourista/features/attractions/data/repos/attraction_repo.dart';

part 'get_attractions_state.dart';

class GetAttractionsCubit extends Cubit<GetAttractionsState> {
  GetAttractionsCubit(this.attractionsRepo) : super(GetAttractionsInitial());

  final AttractionRepo attractionsRepo;

  Future<void> getAttractions() async {
    emit(GetAttractionsLoading());
    var result = await attractionsRepo.getAttraction();
    result.fold((failure) {
      emit(GetAttractionsFailure(errMessage: failure.errMessage));
    }, (attractionsModel) {
      emit(GetAttractionsSuccess(attractionsModel));
    });
  }
}
