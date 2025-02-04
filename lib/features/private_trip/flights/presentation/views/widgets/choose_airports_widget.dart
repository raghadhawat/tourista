import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/flights/presentation/manager/flights/flights_cubit.dart';

class ChooseAirportsWidget extends StatelessWidget {
  const ChooseAirportsWidget({
    super.key,
    required this.tripId,
  });
  final int tripId;

  @override
  Widget build(BuildContext context) {
    dynamic whereFromAirport;

    dynamic whereToAirport;
    return BlocBuilder<FlightsCubit, FlightsState>(
      builder: (context, state) {
        final cubit = context.read<FlightsCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () async {
                var result = await GoRouter.of(context)
                    .push(AppRouter.kWhereFromAirportView, extra: tripId);
                whereFromAirport = result;
                if (whereFromAirport != null) {
                  cubit.setWhereFromAirport(whereFromAirport['airport']);
                  cubit.setWhereFromAirportId(whereFromAirport['id']);
                }
              },
              child: Text(
                state.whereFromAirport == null ||
                        state.whereFromAirport!.isEmpty
                    ? LocaleKeys.whereFrom.tr()
                    : state.whereFromAirport!,
                style: state.whereFromAirport == null ||
                        state.whereFromAirport!.isEmpty
                    ? AppStyles.styleInterRegular16(context)
                        .copyWith(color: Colors.black45)
                    : AppStyles.styleInterRegular16(context)
                        .copyWith(color: Colors.black),
              ),
            ),
            const Gap(10),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .65,
              child: const Divider(
                color: Colors.grey,
              ),
            ),
            const Gap(10),
            GestureDetector(
              onTap: () async {
                var result = await GoRouter.of(context)
                    .push(AppRouter.kWhereToAirportView, extra: tripId);
                whereToAirport = result;
                if (whereToAirport != null) {
                  cubit.setWhereToAirport(whereToAirport['airport']);
                  cubit.setWhereToAirportId(whereToAirport['id']);
                }
              },
              child: GestureDetector(
                child: Text(
                  state.whereToAirport == null || state.whereToAirport!.isEmpty
                      ? LocaleKeys.whereTo.tr()
                      : state.whereToAirport!,
                  style: state.whereToAirport == null ||
                          state.whereToAirport!.isEmpty
                      ? AppStyles.styleInterRegular16(context)
                          .copyWith(color: Colors.black45)
                      : AppStyles.styleInterRegular16(context),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
