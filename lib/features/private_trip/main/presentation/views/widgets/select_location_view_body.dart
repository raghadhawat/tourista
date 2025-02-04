import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/features/private_trip/main/presentation/manager/all_city_cubit/all_city_cubit.dart';
import 'package:tourista/features/private_trip/main/presentation/views/widgets/city_select_location_list_view.dart';
import 'package:tourista/features/private_trip/main/presentation/views/widgets/current_location_row.dart';
import 'package:tourista/features/private_trip/main/presentation/views/widgets/custom_enter_text_field.dart';

class SelectLocationViewBody extends StatelessWidget {
  const SelectLocationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Gap(16),
          CustomEnterTextField(
            label: LocaleKeys.selectYourLocation.tr(),
            onChanged: (p0) {
              BlocProvider.of<AllCityCubit>(context)
                  .getAllCityCubitFun(city: p0);
            },
          ),
          const Gap(18),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: CurrentLocationRow(),
          ),
          const Gap(10),
          Divider(
            color: Colors.grey.shade300,
          ),
          BlocBuilder<AllCityCubit, AllCityState>(
            builder: (context, state) {
              if (state is AllCitySuccess) {
                return CitySelectLocationListView(
                  allCityModel: state.allCityModel,
                );
              } else if (state is AllCityLoading) {
                return const SpinKitThreeBounce(
                  color: kGreenColor,
                  size: 40,
                );
              } else {
                return Text('there is no city with this search');
              }
            },
          )
        ],
      ),
    );
  }
}
