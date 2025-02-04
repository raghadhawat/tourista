part of 'private_trip_cubit.dart';

@immutable
class PrivateTripState {
  final DateTime? startDate;
  final DateTime? endDate;
  final int selectedNumber;
  final dynamic selectedcity;
  final dynamic enterCity;

  const PrivateTripState({
    required this.startDate,
    required this.endDate,
    required this.selectedNumber,
    required this.selectedcity,
    required this.enterCity,
  });

  PrivateTripState copyWith({
    DateTime? startDate,
    DateTime? endDate,
    int? selectedNumber,
    dynamic selectedcity,
    dynamic enterCity,
  }) {
    return PrivateTripState(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      selectedNumber: selectedNumber ?? this.selectedNumber,
      selectedcity: selectedcity ?? this.selectedcity,
      enterCity: enterCity ?? this.enterCity,
    );
  }
}
