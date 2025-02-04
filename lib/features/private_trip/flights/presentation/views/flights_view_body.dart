import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/private_trip/flights/presentation/manager/flights/flights_cubit.dart';
import 'package:tourista/features/private_trip/flights/presentation/manager/tickets_cubit/tickets_cubit.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/airports_table_widget.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/cabin_class_bottom_sheet.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/flight_way.dart';
import 'package:tourista/features/private_trip/main/data/models/create_trip_model/create_trip_model.dart';
import 'package:tourista/features/private_trip/main/presentation/views/widgets/plan-and_plane_table.dart';
import 'package:tourista/features/private_trip/main/presentation/views/widgets/table_row_widget.dart';

class FligtsViewBody extends StatelessWidget {
  const FligtsViewBody({super.key, required this.createTripModel});
  final CreateTripModel createTripModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightsCubit, FlightsState>(
      listener: (BuildContext context, FlightsState state) {},
      builder: (context, flightsstate) {
        final cubit = context.read<FlightsCubit>();
        List<Widget> tableList = [
          const FlightsWay(),
          AirprtsTableWiddget(
            tripId: createTripModel.tripId!.id,
          ),
          TableRowWidget(
            padding: 14,
            text: flightsstate.cabinClass == null
                ? LocaleKeys.cabinClass.tr()
                : "${flightsstate.cabinClass}",
            onTap: () {
              showCabinClass(context, (String value) {
                cubit.setCabinClass(value);
              }, (String value) {
                cubit.setVlaueCabin(value);
              });
            },
            image: Assets.imagesIconsCabinClass,
          ),
          CustomButton(
            onTap: () {
              BlocProvider.of<TicketsCubit>(context).searchForTicketCubitFun(
                airFromId: flightsstate.whereFromAirportId ?? 0,
                airToId: flightsstate.whereToAirportId ?? 0,
                tripId: createTripModel.tripId!.id,
                cabinClass: flightsstate.vlaueCabin ?? '',
                flightsWay: flightsstate.flightWay ?? '',
              );
            },
            text: LocaleKeys.search.tr(),
            width: MediaQuery.of(context).size.width,
            borderRadius: 10,
            height: MediaQuery.of(context).size.height * .075,
            style: AppStyles.styleInterBold20(context)
                .copyWith(color: Colors.white, fontSize: 20),
            color: kPrimaryColor,
          ),
        ];
        return BlocConsumer<TicketsCubit, TicketsState>(
          listener: (context, state) {
            if (state is TicketsFailure) {
              customSnackBar(context, state.errMessage);
            } else if (state is TicketsSuccess) {
              GoRouter.of(context).push(AppRouter.kTicketsView, extra: {
                'tickets': state.ticketsModel,
                'tripId': createTripModel,
                'airFrom': flightsstate.whereFromAirport,
                'airTo': flightsstate.whereToAirport,
              });
            }
          },
          builder: (context, state) {
            return state is TicketsLoading
                ? Center(
                    child: Lottie.asset(Assets.imagesLottieTicketsLoading),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: MediaQuery.sizeOf(context).height * .165),
                    child: PlanAndPlaneTable(
                      tableList: tableList,
                      rowNumber: 4,
                    ),
                  );
          },
        );
      },
    );
  }

  Future<dynamic> showCabinClass(
      BuildContext context,
      ValueChanged<String> onCabinChanged,
      ValueChanged<String> onValueChanged) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        context: context,
        builder: (context) {
          return CabinClassBottomSheet(
            onCabinChanged: onCabinChanged,
            onValueChanged: onValueChanged,
          );
        });
  }
}
