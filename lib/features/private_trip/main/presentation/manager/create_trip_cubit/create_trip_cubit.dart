import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/private_trip/main/data/models/create_trip_model/create_trip_model.dart';
import 'package:tourista/features/private_trip/main/data/repos/main_repo_impl.dart';

part 'create_trip_state.dart';

class CreateTripCubit extends Cubit<CreateTripState> {
  CreateTripCubit(this.mainRepoImpl) : super(CreateTripInitial());
  MainRepoImpl mainRepoImpl;
  Future<void> createTripCubitFun(
      {required String idFrom,
      required String idTo,
      required String dateOfTrip,
      required String dateEndOfTrip,
      required String personNumber}) async {
    emit(CreateTripLoading());
    var result = await mainRepoImpl.createTrip(
        idFrom: idFrom,
        idTo: idTo,
        dateOfTrip: dateOfTrip,
        dateEndOfTrip: dateEndOfTrip,
        personNumber: personNumber);

    result.fold((failure) {
      emit(CreateTripFailure(errMessage: failure.errMessage));
    }, (createTripModel) {
      emit(CreateTripSuccess(createTripModel: createTripModel));
    });
  }
}
