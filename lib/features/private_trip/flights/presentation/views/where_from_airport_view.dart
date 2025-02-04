import 'package:flutter/material.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/where_from_airport_view_body.dart';

class WhereFromAirprotView extends StatelessWidget {
  const WhereFromAirprotView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: WhereFromAirprotViewBody(),
      ),
    );
  }
}
