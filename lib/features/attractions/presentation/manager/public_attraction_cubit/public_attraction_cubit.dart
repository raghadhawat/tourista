import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/models/public_trip_attractions/public_trip_attractions_model.dart';
import '../../../data/repos/attraction_repo.dart';
part 'public_attraction_state.dart';

class PublicAttractionCubit extends Cubit<PublicAttractionState> {
  PublicAttractionCubit(this.attractionsRepo)
      : super(PublicAttractionInitial());

  final AttractionRepo attractionsRepo;

  Future<void> getPublicTripAttractions({required int publicTripId}) async {
    emit(PublicAttractionLoading());
    var result = await attractionsRepo.getPublicTripAttraction(
        publicTripId: publicTripId);
    result.fold((failure) {
      emit(PublicAttractionFailure(errMessage: failure.errMessage));
    }, (publicTripAttractionsModel) {
      emit(PublicAttractionSuccess(publicTripAttractionsModel));
    });
  }
}
