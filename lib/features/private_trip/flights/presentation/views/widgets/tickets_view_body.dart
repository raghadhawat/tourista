import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/err_animation.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/tickets_list_view.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/tickets_view_app_bar.dart';

class TicketsViewBody extends StatelessWidget {
  const TicketsViewBody({super.key, required this.ticketsInfo});
  final Map<String, dynamic> ticketsInfo;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        TickesViewAppBar(
          ticketsNumber: ticketsInfo['tickets'].numberOfFlights,
          width: width,
          height: height,
          airFrom: ticketsInfo['airFrom'],
          airTo: ticketsInfo['airTo'],
          dateFrom: ticketsInfo['tickets'].tickets[0].dateOfTicket,
          dateTo: ticketsInfo['tickets'].tickets[0].dateEndOfTicket,
        ),
        ticketsInfo['tickets'].tickets.isEmpty
            ? const ErrAnimation(errMessage: 'No Flights Found!!')
            : Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          LocaleKeys.priceMyChange.tr(),
                          style: AppStyles.styleInterMedium18(context)
                              .copyWith(color: Colors.black.withOpacity(.5)),
                        ),
                      ),
                    ),
                    TicketsListView(
                      createTripModel: ticketsInfo['tripId'],
                      width: width,
                      height: height,
                      tickets: ticketsInfo['tickets'].tickets,
                      airFrom: ticketsInfo['airFrom'],
                      airTo: ticketsInfo['airTo'],
                    )
                  ],
                ),
              )
      ],
    );
  }
}
