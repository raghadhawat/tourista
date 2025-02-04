import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/airports_icons_column.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/choose_airports_widget.dart';

class AirprtsTableWiddget extends StatelessWidget {
  const AirprtsTableWiddget({
    super.key,
    required this.tripId,
  });
  final int tripId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AirportsIconsColumn(),
        const Gap(10),
        ChooseAirportsWidget(
          tripId: tripId,
        ),
      ],
    );
  }
}
