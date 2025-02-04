import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/features/private_trip/flights/data/models/tickets_model/ticket.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/luggage.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/price_and_add_to_plan.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/sort_by_tickets_row.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/ticket_time_and_airline.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/ticket_time_and_airline_round.dart';
import 'package:tourista/features/private_trip/main/data/models/create_trip_model/create_trip_model.dart';

class RoundTripTicket extends StatelessWidget {
  const RoundTripTicket({
    super.key,
    required this.width,
    required this.height,
    required this.ticket,
    required this.createTripModel,
    required this.airFrom,
    required this.airTo,
  });
  final Ticket ticket;
  final double width;
  final double height;
  final CreateTripModel createTripModel;
  final String airFrom, airTo;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: width,
      decoration: BoxDecoration(
          color: Colors.white, boxShadow: [boxShadow(4, 4), boxShadow(-4, 4)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SortByTicketsRow(),
          const Gap(12),
          TicketTimeAndAirline(
            width: width,
            ticket: ticket,
            airFrom: airFrom,
            airTo: airTo,
          ),
          Gap(12),
          TicketTimeAndAirlineRound(
            width: width,
            ticket: ticket,
            airFrom: airTo,
            airTo: airFrom,
          ),
          Gap(12),
          Divider(
            color: Colors.black.withOpacity(.35),
          ),
          Gap(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Luggage(width: width),
              PriceAndAddToPlan(
                width: width,
                height: height,
                ticket: ticket,
                createTripModel: createTripModel,
              )
            ],
          )
        ],
      ),
    );
  }

  BoxShadow boxShadow(double y, double blur) {
    return BoxShadow(
      color: Colors.grey.withOpacity(.1),
      blurRadius: blur,
      offset: Offset(0, y),
    );
  }
}
