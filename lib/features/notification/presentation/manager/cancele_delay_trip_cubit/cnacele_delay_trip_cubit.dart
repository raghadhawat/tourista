import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tourista/core/utlis/api_server.dart';
import 'package:tourista/core/utlis/service_locator.dart';
import 'package:tourista/features/notification/data/models/cancel_delay_trips.dart';
import 'package:tourista/features/notification/data/services/cancele_delay_trip.dart';

part 'cnacele_delay_trip_state.dart';

class CnaceleDelayTripCubit extends Cubit<CnaceleDelayTripState> {
  CnaceleDelayTripCubit() : super(CnaceleDelayTripInitial());
  Future<void> canceleDelayTripsFun({required int tripId}) async {
    emit(CnaceleDelayTripLoading());
    var result = await CanceleDelayTrip(getIt.get<ApiServer>())
        .cancelDelayTrip(tripId: tripId);

    result.fold((failure) {
      emit(CnaceleDelayTripFailure(errMessage: failure.errMessage));
    }, (cancelDelayTrips) {
      emit(CnaceleDelayTripSuccess(cancelDelayTrips: cancelDelayTrips));
    });
  }
}
