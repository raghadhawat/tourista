import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/private_trip/main/data/models/all_city_model/all_city.dart';
import 'package:tourista/features/private_trip/main/data/repos/main_repo_impl.dart';

part 'all_city_state.dart';

class AllCityCubit extends Cubit<AllCityState> {
  AllCityCubit(this.mainRepoImpl) : super(AllCityInitial());
  MainRepoImpl mainRepoImpl;
  Future<void> getAllCityCubitFun({required String city}) async {
    emit(AllCityLoading());
    var result = await mainRepoImpl.getAllCity(city: city);

    result.fold((failure) {
      emit(AllCityFailure(errMessage: failure.errMessage));
      if (kDebugMode) {
        print(failure.errMessage.toString());
      }
    }, (allCityModel) {
      emit(AllCitySuccess(allCityModel: allCityModel));
    });
  }
}
