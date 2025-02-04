import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/luggage.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/sort_by_tickets_row.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/ticket_time_and_airline.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/ticket_time_and_airline_round.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/get_user_private_plan_cubit/get_user_private_plan_cubit.dart';

class DisplayRoundTicket extends StatelessWidget {
  const DisplayRoundTicket({
    super.key,
    required this.width,
    required this.state,
    required this.numOfPerson,
  });

  final double width;
  final GetUserPrivatePlanSuccess state;
  final int numOfPerson;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SortByTicketsRow(),
        const Gap(12),
        TicketTimeAndAirline(
          width: width,
          ticket: state.getUserPrivatePlanModel.ticket!.ticket!,
          airFrom:
              state.getUserPrivatePlanModel.ticket!.ticket!.fromAirport!.name!,
          airTo: state.getUserPrivatePlanModel.ticket!.ticket!.toAirport!.name!,
        ),
        const Gap(12),
        TicketTimeAndAirlineRound(
          width: width,
          ticket: state.getUserPrivatePlanModel.ticket!.ticket!,
          airFrom:
              state.getUserPrivatePlanModel.ticket!.ticket!.fromAirport!.name!,
          airTo: state.getUserPrivatePlanModel.ticket!.ticket!.toAirport!.name!,
        ),
        const Gap(12),
        Divider(
          color: Colors.black.withOpacity(.35),
        ),
        const Gap(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Luggage(width: width),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'US\$${state.getUserPrivatePlanModel.ticket!.ticket!.price}',
                  style: AppStyles.styleSourceSemiBold22(context),
                ),
                Text(
                  'US\$${state.getUserPrivatePlanModel.ticket!.ticket!.price! * numOfPerson} ${LocaleKeys.forAllTravellers.tr()}',
                  style: AppStyles.styleInterMedium14(context)
                      .copyWith(color: Colors.black.withOpacity(.5)),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
