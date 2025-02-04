import 'package:flutter/material.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/get_user_private_plan_cubit/get_user_private_plan_cubit.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/views/widgets/empty_text_widget.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/views/widgets/hotels_list_view.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/views/widgets/the_plan_container.dart';

class HotelPrivateContainer extends StatelessWidget {
  const HotelPrivateContainer({
    super.key,
    required this.screenWidth,
    required this.tripId,
    required this.screenHeight,
    required this.state,
  });

  final double screenWidth;
  final int tripId;
  final double screenHeight;
  final GetUserPrivatePlanSuccess state;

  @override
  Widget build(BuildContext context) {
    return ThePlanContainer(
      data: 'The Hotels',
      screenwidth: screenWidth,
      withDeleteIcon: false,
      child: state.getUserPrivatePlanModel.hotels!.isEmpty == false
          ? HotelsListView(
              state: state,
              tripId: tripId,
              height: screenHeight,
              width: screenWidth,
            )
          : EmptyTextWidget(
              data: "There is no Hotel to display",
            ),
    );
  }
}
