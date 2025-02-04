import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/ready_trips/data/models/add_favourite_model.dart';
import 'package:tourista/features/ready_trips/data/repos/ready_trip_repo_impl.dart';

part 'add_favorit_trip_state.dart';

class AddFavoritTripCubit extends Cubit<AddFavoritTripState> {
  AddFavoritTripCubit(this.readyTripsRepoImpl) : super(AddFavoritTripInitial());
  ReadyTripsRepoImpl readyTripsRepoImpl;
  Future<void> addFavouriteTripFun({required int tripId}) async {
    var result = await readyTripsRepoImpl.addFavouriteTrip(tripId: tripId);

    result.fold((failure) {
      emit(AddFavoritTripFailure(errMessage: failure.errMessage));
    }, (addFavouriteModel) {
      emit(AddFavoritTripSuccess(addFavouriteModel: addFavouriteModel));
    });
  }
}
