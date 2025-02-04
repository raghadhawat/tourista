import 'package:flutter/material.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/tickets_view_body.dart';

class TicketsView extends StatelessWidget {
  const TicketsView({super.key, required this.ticketsinfo});
  final Map<String, dynamic> ticketsinfo;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: TicketsViewBody(
        ticketsInfo: ticketsinfo,
      ),
    ));
  }
}
