import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/custom_scroll_view_with_bloc_builder.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_main_appbar.dart';

class StaysViewBody extends StatelessWidget {
  const StaysViewBody({super.key, required this.tripId});
  final int tripId;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HotelMainAppBar(
          tripId: tripId,
        ),
        Expanded(
          child: CustomScrollViewWithBlocBuilder(
            width: width,
            height: height,
            tripId: tripId,
          ),
        )
      ],
    );
  }
}
