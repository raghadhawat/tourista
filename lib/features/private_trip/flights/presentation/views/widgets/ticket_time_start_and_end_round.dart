import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tourista/features/private_trip/flights/data/models/tickets_model/ticket.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/ticket_duration.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/tickets_time.dart';

class TicketTimeStartAndEndRound extends StatelessWidget {
  const TicketTimeStartAndEndRound({
    Key? key,
    required this.width,
    required this.ticket,
    required this.airFrom,
    required this.airTo,
  }) : super(key: key);

  final double width;
  final Ticket ticket;
  final String airFrom, airTo;

  @override
  Widget build(BuildContext context) {
    String time = ticket.timeOfticket!; // Example time string
    String date = ticket.dateEndOfTicket!; // Example date string

    // Convert time string to DateTime
    DateTime dateTime = DateTime.parse(date + " " + time);

    // Generate random number of hours to add
    Random random = Random();
    int randomHours =
        random.nextInt(24); // Generate a random number from 0 to 23

    // Add random hours to the original time
    dateTime = dateTime.add(Duration(hours: randomHours));

    // Handle date rollover if the time exceeds 24 hours
    if (dateTime.hour >= 24) {
      dateTime = dateTime.add(Duration(days: 1));
      randomHours -= 24;
    }

    // Format the resulting DateTime back to desired string format
    String newTime =
        "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
    String newDate =
        "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";

    // Add duration to the new time
    int durationHours = int.parse(ticket.duration!.split(":")[0]);
    int durationMinutes = int.parse(ticket.duration!.split(":")[1]);
    Duration duration =
        Duration(hours: durationHours, minutes: durationMinutes);
    dateTime = dateTime.add(duration);

    // Handle date rollover if the time exceeds 24 hours
    if (dateTime.hour >= 24) {
      dateTime = dateTime.add(Duration(days: 1));
      dateTime = dateTime.add(Duration(hours: -24));
    }

    // Format the resulting DateTime back to desired string format
    String finalTime =
        "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
    String finalDate =
        "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";

    return Row(
      children: [
        TicketsTime(
          time: "${newTime.substring(0, 5)}",
          airport: airFrom,
          date: newDate.substring(5),
        ),
        Spacer(),
        TicketDuration(
          width: width,
          duratoin: ticket.duration!,
        ),
        Spacer(),
        TicketsTime(
          time: finalTime,
          airport: airTo,
          date: finalDate.substring(5),
        ),
      ],
    );
  }
}
