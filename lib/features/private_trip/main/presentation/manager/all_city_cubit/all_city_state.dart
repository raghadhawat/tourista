part of 'all_city_cubit.dart';

@immutable
sealed class AllCityState {}

final class AllCityInitial extends AllCityState {}

final class AllCityLoading extends AllCityState {}

final class AllCitySuccess extends AllCityState {
  final AllCityModel allCityModel;

  AllCitySuccess({required this.allCityModel});
}

final class AllCityFailure extends AllCityState {
  final String errMessage;

  AllCityFailure({required this.errMessage});
}
