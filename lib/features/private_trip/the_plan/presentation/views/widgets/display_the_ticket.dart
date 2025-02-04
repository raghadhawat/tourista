import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/delete_ticket/delete_ticket_cubit.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/get_user_private_plan_cubit/get_user_private_plan_cubit.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/views/widgets/the_plan_container.dart';
import 'package:tourista/core/utlis/functions/show_dialog.dart';
import '../../../../../../core/widgets/loading_widget.dart';
import 'dispay_one_way_ticket.dart';
import 'display_round_ticket.dart';
import 'empty_text_widget.dart';

class DisplayTheTicket extends StatefulWidget {
  const DisplayTheTicket({
    super.key,
    required this.screenWidth,
    required this.tripId,
    required this.screenHeight,
    required this.state,
    required this.numOfPerson,
    required this.text,
    required this.withDeleteIcon,
  });

  final double screenWidth;
  final int tripId;
  final double screenHeight;
  final GetUserPrivatePlanSuccess state;
  final int numOfPerson;
  final String text;
  final bool withDeleteIcon;
  @override
  State<DisplayTheTicket> createState() => _DisplayTheTicketState();
}

class _DisplayTheTicketState extends State<DisplayTheTicket> {
  bool isTicketEmpty = true;
  @override
  void initState() {
    super.initState();
    widget.state.getUserPrivatePlanModel.ticket == null
        ? isTicketEmpty = true
        : isTicketEmpty = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteTicketCubit, DeleteTicketState>(
      listener: (context, deleteTicketstate) {
        if (deleteTicketstate is DeleteTicketSuccess) {
          GoRouter.of(context).pop();
          GoRouter.of(context).pop();

          setState(() {
            isTicketEmpty = true;
          });
        } else if (deleteTicketstate is DeleteTicketFailure) {
          customSnackBar(context, deleteTicketstate.errMessage);
        } else {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const LoadingWidget();
            },
          );
        }
      },
      child: ThePlanContainer(
        data: 'The Ticket',
        onTap: () {
          CustomShowDialog().showConfirmationDialog(
              context: context,
              titleText: LocaleKeys.Confirmation.tr(),
              contentText: 'Are You sure you want to delete the Ticket?',
              onConfirmPressed: () {
                isTicketEmpty == true
                    ? GoRouter.of(context).pop()
                    : BlocProvider.of<DeleteTicketCubit>(context).deleteTicket(
                        bookingTicketId:
                            widget.state.getUserPrivatePlanModel.ticket!.id!,
                      );
              },
              cancel: true);
        },
        screenwidth: widget.screenWidth,
        withDeleteIcon: widget.withDeleteIcon,
        child: isTicketEmpty == true
            ? EmptyTextWidget(
                data: widget.text,
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: widget.state.getUserPrivatePlanModel.ticket!.ticket!
                            .roundOrOneTrip! ==
                        'OneWay'
                    ? DisplayOneWayTicket(
                        width: widget.screenWidth,
                        state: widget.state,
                        numOfPerson: widget.numOfPerson,
                      )
                    : DisplayRoundTicket(
                        width: widget.screenWidth,
                        state: widget.state,
                        numOfPerson: widget.numOfPerson,
                      ),
              ),
      ),
    );
  }
}
