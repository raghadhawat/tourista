import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/core/utlis/functions/custom_success_snack_bar.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/private_trip/flights/data/models/tickets_model/ticket.dart';
import 'package:tourista/features/private_trip/flights/presentation/manager/choose_ticket_cubit/choose_ticket_cubit.dart';
import 'package:tourista/features/private_trip/main/data/models/create_trip_model/create_trip_model.dart';

class PriceAndAddToPlan extends StatelessWidget {
  const PriceAndAddToPlan({
    super.key,
    required this.width,
    required this.height,
    required this.ticket,
    required this.createTripModel,
  });

  final double width;
  final double height;
  final Ticket ticket;
  final CreateTripModel createTripModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'US\$${ticket.price}',
          style: AppStyles.styleSourceSemiBold22(context),
        ),
        Text(
          'US\$${ticket.price! * createTripModel.tripId!.numOfPersons!} ${LocaleKeys.forAllTravellers.tr()}',
          style: AppStyles.styleInterMedium14(context)
              .copyWith(color: Colors.black.withOpacity(.5)),
        ),
        Gap(8),
        BlocConsumer<ChooseTicketCubit, ChooseTicketState>(
          listener: (context, state) {
            if (state is ChooseTicketSuccess) {
              customSuccessSnackBar(
                  context, "this ticket added to your plan successfuly");
            } else if (state is ChooseTicketFailure) {
              customSnackBar(context, state.errMessage);
            }
          },
          builder: (context, state) {
            return state is ChooseTicketLoading
                ? const SpinKitThreeBounce(
                    color: kGreenColor,
                    size: 30,
                  )
                : CustomButton(
                    onTap: () {
                      BlocProvider.of<ChooseTicketCubit>(context)
                          .chooseTicketCubitFun(
                              tripId: '${createTripModel.tripId!.id}',
                              ticketId: "${ticket.id}");
                    },
                    text: LocaleKeys.Add_To_The_plan.tr(),
                    width: width * .25,
                    borderRadius: 5,
                    height: height * .035,
                    style: AppStyles.styleSourceBold14(context)
                        .copyWith(color: Colors.white),
                    color: kPrimaryColor.withOpacity(.7));
          },
        )
      ],
    );
  }
}
