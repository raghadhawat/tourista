import 'package:flutter/material.dart';
import 'package:tourista/features/private_trip/flights/data/models/tickets_model/ticket.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/one_way_ticket.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/round_trip_ticket.dart';
import 'package:tourista/features/private_trip/main/data/models/create_trip_model/create_trip_model.dart';

class TicketsListView extends StatelessWidget {
  const TicketsListView({
    super.key,
    required this.width,
    required this.height,
    required this.tickets,
    required this.airFrom,
    required this.airTo,
    required this.createTripModel,
  });

  final double width;
  final double height;
  final List<Ticket> tickets;
  final String airFrom, airTo;
  final CreateTripModel createTripModel;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: tickets.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: tickets[index].roundOrOneTrip == 'RoundTrip'
                ? RoundTripTicket(
                    createTripModel: createTripModel,
                    width: width,
                    height: height,
                    ticket: tickets[index],
                    airFrom: airFrom,
                    airTo: airTo,
                  )
                : OneWayTicket(
                    createTripModel: createTripModel,
                    width: width,
                    height: height,
                    ticket: tickets[index],
                    airFrom: airFrom,
                    airTo: airTo,
                  ),
          );
        });
  }
}
