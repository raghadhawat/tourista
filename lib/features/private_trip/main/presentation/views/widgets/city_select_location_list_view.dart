import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/features/private_trip/main/data/models/all_city_model/all_city.dart';
import 'package:tourista/features/private_trip/main/presentation/manager/private_trip_cubit/private_trip_cubit.dart';
import 'package:tourista/features/private_trip/main/presentation/views/widgets/city_select_location_card.dart';

class CitySelectLocationListView extends StatelessWidget {
  const CitySelectLocationListView({
    super.key,
    required this.allCityModel,
  });
  final AllCityModel allCityModel;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PrivateTripCubit>();
    return Expanded(
      child: ListView.builder(
          itemCount: allCityModel.theCities!.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  GoRouter.of(context).pop();
                  cubit.setSelectedCity({
                    "id": allCityModel.theCities![index].id,
                    "city": allCityModel.theCities![index].name
                  });
                },
                child: CitySelectLocationCard(
                  theCity: allCityModel.theCities![index],
                ));
          }),
    );
  }
}
