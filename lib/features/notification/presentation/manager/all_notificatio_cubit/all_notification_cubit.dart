import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/core/utlis/api_server.dart';
import 'package:tourista/core/utlis/service_locator.dart';
import 'package:tourista/features/notification/data/models/all_notification_model/all_notification_model.dart';
import 'package:tourista/features/notification/data/services/cancele_delay_trip.dart';

part 'all_notification_state.dart';

class AllNotificationCubit extends Cubit<AllNotificationState> {
  AllNotificationCubit() : super(AllNotificationInitial());
  Future<void> fetchAllNotificationFun() async {
    emit(AllNotificationLoading());
    var result =
        await CanceleDelayTrip(getIt.get<ApiServer>()).getAllNotification();

    result.fold((failure) {
      emit(AllNotificationFailure(errMessage: failure.errMessage));
    }, (allNotificationModel) {
      emit(AllNotificationSuccess(allNotificationModel: allNotificationModel));
    });
  }
}
