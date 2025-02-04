import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/flights/presentation/manager/flights/flights_cubit.dart';

class FlightsWay extends StatelessWidget {
  const FlightsWay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightsCubit, FlightsState>(
      builder: (context, state) {
        final cubit = context.read<FlightsCubit>();
        return Row(
          children: [
            Expanded(
              child: RadioListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  LocaleKeys.roundTrip.tr(),
                  style: AppStyles.styleInterSemiBold18(context),
                ),
                value: 'RoundTrip',
                groupValue: state.flightWay,
                onChanged: (value) {
                  cubit.setFlightsWay(value);
                },
              ),
            ),
            Expanded(
              child: RadioListTile(
                title: Text(
                  LocaleKeys.oneWay.tr(),
                  style: AppStyles.styleInterSemiBold18(context),
                ),
                value: 'OneWay',
                groupValue: state.flightWay,
                onChanged: (value) {
                  cubit.setFlightsWay(value);
                },
              ),
            )
          ],
        );
      },
    );
  }
}
