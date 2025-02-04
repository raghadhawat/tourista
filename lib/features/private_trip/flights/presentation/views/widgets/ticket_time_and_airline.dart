import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/features/private_trip/flights/data/models/tickets_model/ticket.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/airline_widget.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/ticket_time_start_and_end.dart';

class TicketTimeAndAirline extends StatelessWidget {
  const TicketTimeAndAirline({
    super.key,
    required this.width,
    required this.ticket,
    required this.airFrom,
    required this.airTo,
  });

  final double width;
  final Ticket ticket;
  final String airFrom, airTo;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TicketTimeStartAndEnd(
          width: width,
          ticket: ticket,
          airFrom: airFrom,
          airTo: airTo,
        ),
        Gap(5),
        AirlineWidget(
          ticket: ticket,
        ),
      ],
    );
  }
}
