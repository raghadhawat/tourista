import 'package:flutter/material.dart';
import 'package:tourista/features/private_trip/main/presentation/views/widgets/select_location_view_body.dart';

class SelectLocationView extends StatelessWidget {
  const SelectLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: SelectLocationViewBody(),
    ));
  }
}
