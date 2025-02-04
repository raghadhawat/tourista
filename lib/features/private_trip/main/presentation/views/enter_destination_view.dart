import 'package:flutter/material.dart';
import 'package:tourista/features/private_trip/main/presentation/views/widgets/enter_destination_view_body.dart';

class EnterDestinationView extends StatelessWidget {
  const EnterDestinationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: EnterDestinationViewBody(),
      ),
    );
  }
}
