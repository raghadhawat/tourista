part of 'activity_card_cubit.dart';

@immutable
class ActivityCardState {
  final Map<dynamic, dynamic>? activitiesCardData;
  final int? activityId;

  final String? activityName;
  final String? activityImage;
  final String? activityDesc;

  const ActivityCardState({
    required this.activitiesCardData,
    required this.activityId,
    required this.activityName,
    required this.activityImage,
    required this.activityDesc,
  });

  ActivityCardState copyWith({
    int? activityId,
    String? activityName,
    String? activityImage,
    String? activityDesc,
    Map<dynamic, dynamic>? activitiesCardData,
  }) {
    return ActivityCardState(
      activitiesCardData: activitiesCardData ?? this.activitiesCardData,
      activityId: activityId ?? this.activityId,
      activityName: activityName ?? this.activityName,
      activityImage: activityImage ?? this.activityImage,
      activityDesc: activityDesc ?? this.activityDesc,
    );
  }
}
