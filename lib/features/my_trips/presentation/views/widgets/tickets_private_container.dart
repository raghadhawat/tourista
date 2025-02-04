import 'package:flutter/material.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/get_user_private_plan_cubit/get_user_private_plan_cubit.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/views/widgets/dispay_one_way_ticket.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/views/widgets/display_round_ticket.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/views/widgets/empty_text_widget.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/views/widgets/the_plan_container.dart';

class TicketsPrivateContainer extends StatelessWidget {
  const TicketsPrivateContainer({
    super.key,
    required this.screenWidth,
    required this.state,
  });

  final double screenWidth;
  final GetUserPrivatePlanSuccess state;

  @override
  Widget build(BuildContext context) {
    return ThePlanContainer(
      data: 'The Ticket',
      screenwidth: screenWidth,
      withDeleteIcon: false,
      child: (state.getUserPrivatePlanModel.ticket == null) == true
          ? EmptyTextWidget(
              data: "There is no Ticket to display",
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: state.getUserPrivatePlanModel.ticket!.ticket!
                          .roundOrOneTrip! ==
                      'OneWay'
                  ? DisplayOneWayTicket(
                      width: screenWidth,
                      state: state,
                      numOfPerson:
                          ((state.getUserPrivatePlanModel.ticket?.price ?? 1) /
                                  (state.getUserPrivatePlanModel.ticket?.ticket!
                                          .price ??
                                      1))
                              .toInt(),
                    )
                  : DisplayRoundTicket(
                      width: screenWidth,
                      state: state,
                      numOfPerson:
                          ((state.getUserPrivatePlanModel.ticket?.price ?? 1) /
                                  (state.getUserPrivatePlanModel.ticket?.ticket!
                                          .price ??
                                      1))
                              .toInt(),
                    ),
            ),
    );
  }
}
