import 'package:flutter/material.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/where_to_airport_view_body.dart';

class WhereToAirportView extends StatelessWidget {
  const WhereToAirportView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: WhereToAirportViewBody(),
      ),
    );
  }
}
