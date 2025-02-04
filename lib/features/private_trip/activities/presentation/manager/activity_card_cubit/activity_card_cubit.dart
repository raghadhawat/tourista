import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'activity_card_state.dart';

class ActivityCardCubit extends Cubit<ActivityCardState> {
  ActivityCardCubit()
      : super(const ActivityCardState(
          activityName: null,
          activityImage: null,
          activityDesc: null,
          activityId: null,
          activitiesCardData: null,
        ));

  void setactivityName(String? activityName) {
    emit(state.copyWith(activityName: activityName));
  }

  void setactivityImage(String? activityImage) {
    emit(state.copyWith(activityImage: activityImage));
  }

  void setactivityDesc(String? activityDesc) {
    emit(state.copyWith(activityDesc: activityDesc));
  }

  void setactivityId(int? activityId) {
    emit(state.copyWith(activityId: activityId));
  }

  void setactivitiesCardData(int dayIndex, Map<String, dynamic> activityData) {
    final updatedData = Map<int, List<Map<String, dynamic>>>.from(
        state.activitiesCardData ?? {});

    if (updatedData.containsKey(dayIndex)) {
      updatedData[dayIndex]!.add(activityData);
    } else {
      updatedData[dayIndex] = [activityData];
    }

    emit(state.copyWith(activitiesCardData: updatedData));

    // print(state.activitiesCardData?[dayIndex].toString());
  }

  void removeActivityCardData(int dayIndex, int activityId) {
    final updatedData = Map<int, List<Map<String, dynamic>>>.from(
        state.activitiesCardData ?? {});

    if (updatedData.containsKey(dayIndex)) {
      updatedData[dayIndex]!
          .removeWhere((activity) => activity['id'] == activityId);
      if (updatedData[dayIndex]!.isEmpty) {
        updatedData.remove(dayIndex);
      }
    }

    emit(state.copyWith(activitiesCardData: updatedData));
  }

  // New method to remove all activity card data for a specific day index
  void removeAllActivitiesForDay(int dayIndex) {
    final updatedData = Map<int, List<Map<String, dynamic>>>.from(
        state.activitiesCardData ?? {});

    // Remove the entire entry for the specified dayIndex
    updatedData.remove(dayIndex);

    emit(state.copyWith(activitiesCardData: updatedData));
  }

  List<Map<String, dynamic>> getActivityCardData(int dayIndex, int activityId) {
    final data = state.activitiesCardData?[dayIndex] ?? [];
    return data
        .whereType<Map<String, dynamic>>()
        .where((activity) => activity['id'] == activityId)
        .toList();
  }
}
