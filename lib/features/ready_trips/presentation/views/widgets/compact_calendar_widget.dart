import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/features/ready_trips/data/models/ready_trips_details_model/ready_trips_details_model.dart';

class CompactCalendarWidget extends StatefulWidget {
  const CompactCalendarWidget(
      {super.key, required this.readyTripsDetailsModel});
  final ReadyTripsDetailsModel readyTripsDetailsModel;
  @override
  State<CompactCalendarWidget> createState() => _CompactCalendarWidgetState();
}

class _CompactCalendarWidgetState extends State<CompactCalendarWidget> {
  CalendarFormat calendarFormat = CalendarFormat.week;
  @override
  Widget build(BuildContext context) {
    String date1String = widget.readyTripsDetailsModel.publicTrip!.dateOfTrip!;
    DateTime dateOfTrip = DateFormat('yyyy-MM-dd').parse(date1String);
    String date2String =
        widget.readyTripsDetailsModel.publicTrip!.dateEndOfTrip!;
    DateTime dateEndOfTrip = DateFormat('yyyy-MM-dd').parse(date2String);
    DateTime rangeStart =
        DateTime(dateOfTrip.year, dateOfTrip.month, dateOfTrip.day);
    DateTime rangeEnd =
        DateTime(dateEndOfTrip.year, dateEndOfTrip.month, dateEndOfTrip.day);

    return TableCalendar(
      onFormatChanged: (format) {
        setState(() {
          calendarFormat = format;
        });
      },
      calendarFormat: calendarFormat,
      firstDay: rangeStart,
      lastDay: rangeEnd,
      focusedDay: rangeStart,
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kPrimaryColor,
            ),
            child: Center(
              child: Text(
                date.day.toString(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
