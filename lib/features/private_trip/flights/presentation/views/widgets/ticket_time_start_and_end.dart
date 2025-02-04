import 'package:flutter/material.dart';
import 'package:tourista/features/private_trip/flights/data/models/tickets_model/ticket.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/ticket_duration.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/tickets_time.dart';

class TicketTimeStartAndEnd extends StatelessWidget {
  const TicketTimeStartAndEnd({
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
    String time = ticket.timeOfticket!; // Example time string
    String date = ticket.dateOfTicket!; // Example date string
    String duration = ticket.duration!; // Example duration string

    // Convert time string to DateTime
    DateTime dateTime = DateTime.parse(date + " " + time);

    // Convert duration string to Duration
    List<String> durationParts = duration.split(":");
    int hours = int.parse(durationParts[0]);
    int minutes = int.parse(durationParts[1]);
    Duration durationObj = Duration(hours: hours, minutes: minutes);

    // Add duration to the DateTime
    dateTime = dateTime.add(durationObj);

    // Handle date rollover if the time exceeds 24 hours
    if (dateTime.hour >= 24) {
      dateTime = dateTime.add(Duration(days: 1));
      dateTime = dateTime.add(Duration(hours: -24));
    }

    // Format the resulting DateTime back to desired string format
    String newTime =
        "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
    String newDate =
        "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
    return Row(
      children: [
        TicketsTime(
          time: ticket.timeOfticket!.substring(0, 5),
          airport: airFrom,
          date: ticket.dateOfTicket!.substring(5),
        ),
        Spacer(),
        TicketDuration(
          width: width,
          duratoin: ticket.duration!,
        ),
        Spacer(),
        TicketsTime(
          time: newTime,
          airport: airTo,
          date: newDate.substring(5),
        ),
      ],
    );
  }
}
