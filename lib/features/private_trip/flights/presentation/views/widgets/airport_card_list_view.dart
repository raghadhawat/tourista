import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/features/private_trip/flights/data/models/airport_where_from_model/airport_where_model.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/airport_card.dart';

class AirportCardListView extends StatelessWidget {
  const AirportCardListView({
    super.key,
    required this.airportWhereModel,
  });
  final AirportWhereModel airportWhereModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: airportWhereModel.airPorts!.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            GoRouter.of(context).pop({
              "id": airportWhereModel.airPorts![index].id,
              "airport": airportWhereModel.airPorts![index].name
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: AirportCard(
              airPort: airportWhereModel.airPorts![index],
            ),
          ),
        );
      },
    ));
  }
}
