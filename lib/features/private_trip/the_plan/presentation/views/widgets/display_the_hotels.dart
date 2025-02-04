import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/core/widgets/loading_widget.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/delete_hotel_cubit/delete_hotel_cubit.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/views/widgets/hotels_list_view.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/views/widgets/the_plan_container.dart';
import 'package:tourista/core/utlis/functions/show_dialog.dart';

import '../../manager/get_user_private_plan_cubit/get_user_private_plan_cubit.dart';
import 'empty_text_widget.dart';

class DisplayTheHotels extends StatefulWidget {
  const DisplayTheHotels({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.state,
    required this.tripId,
    required this.text,
    required this.withDeleteIcon,
  });

  final int tripId;
  final double screenWidth;
  final double screenHeight;
  final GetUserPrivatePlanSuccess state;
  final String text;
  final bool withDeleteIcon;

  @override
  State<DisplayTheHotels> createState() => _DisplayTheHotelsState();
}

class _DisplayTheHotelsState extends State<DisplayTheHotels> {
  bool isHotelEmpty = true;
  @override
  void initState() {
    super.initState();
    isHotelEmpty = widget.state.getUserPrivatePlanModel.hotels!.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteHotelCubit, DeleteHotelState>(
      listener: (context, deleteHotelstate) {
        if (deleteHotelstate is DeleteHotelSuccess) {
          GoRouter.of(context).pop();
          GoRouter.of(context).pop();

          setState(() {
            isHotelEmpty = true;
          });
        } else if (deleteHotelstate is DeleteHotelFailure) {
          customSnackBar(context, deleteHotelstate.errMessage);
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
        data: 'The Hotels',
        onTap: () {
          CustomShowDialog().showConfirmationDialog(
              context: context,
              titleText: LocaleKeys.Confirmation.tr(),
              contentText: 'Are You sure you want to delete the hotels?',
              onConfirmPressed: () {
                isHotelEmpty == true
                    ? GoRouter.of(context).pop()
                    : BlocProvider.of<DeleteHotelCubit>(context).deleteHotel(
                        tripId: widget.tripId,
                        citiesHotelId: widget
                            .state.getUserPrivatePlanModel.hotels![0].id!);
              },
              cancel: true);
        },
        screenwidth: widget.screenWidth,
        withDeleteIcon: widget.withDeleteIcon,
        child: isHotelEmpty == false
            ? HotelsListView(
                state: widget.state,
                tripId: widget.tripId,
                height: widget.screenHeight,
                width: widget.screenWidth,
              )
            : EmptyTextWidget(
                data: widget.text,
              ),
      ),
    );
  }
}
