import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/attractions/presentation/manager/public_attraction_cubit/public_attraction_cubit.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/apply_to_trip_app_bar.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/confirm_button.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/flights_point_box.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/ready_trip_total_price.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/select_ticket_number_box.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/vip_check_box.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/vip_features.dart';
import 'public_trip_attractions_section.dart';

class ApplyTheTripViewBody extends StatelessWidget {
  const ApplyTheTripViewBody({super.key, required this.tripId});
  final int tripId;
  @override
  Widget build(BuildContext context) {
    int pointDiscount = 0;
    List<String> features = [
      LocaleKeys.businessClassFlightTicket.tr(),
      LocaleKeys.sweetAndBeautifulView.tr(),
      LocaleKeys.privateTransportation.tr()
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ApplyToTripAppBar(),
            const Gap(20),
            Text(
              LocaleKeys.choose_the_closet_point.tr(),
              style:
                  AppStyles.styleInterMedium18(context).copyWith(fontSize: 18),
            ),
            const Gap(16),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 4, color: kYellowColor),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FlightsPointBox(
                    tripId: tripId,
                  ),
                )),
            const Gap(40),
            Text(
              LocaleKeys.selectTicketNumber.tr(),
              style:
                  AppStyles.styleInterMedium18(context).copyWith(fontSize: 18),
            ),
            const Gap(20),
            const SelectTicketNumberBox(),
            const Gap(30),
            Text(
              '${LocaleKeys.vipTicket.tr()}:',
              style: AppStyles.styleSourceBold20(context)
                  .copyWith(color: kPrimaryColor, fontSize: 20),
            ),
            Column(
              children: List.generate(
                  features.length,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 6),
                        child: VIPFeatures(
                          text: features[index],
                        ),
                      )),
            ),
            const Gap(8),
            const VIPCheckBox(),
            const Gap(20),
            BlocBuilder<PublicAttractionCubit, PublicAttractionState>(
              builder: (context, state) {
                if (state is PublicAttractionSuccess) {
                  pointDiscount =
                      state.publicTripAttractionsModel.attractions!.isEmpty
                          ? 0
                          : state.publicTripAttractionsModel.attractions![0]
                              .discount;
                  return state.publicTripAttractionsModel.attractions!.isEmpty
                      ? const SizedBox()
                      : PublicTripAttractionsSection(
                          publicTripAttractionsModel:
                              state.publicTripAttractionsModel,
                        );
                }
                return const SizedBox();
              },
            ),
            //  Spacer(),
            Row(
              children: [
                ReadyTripTotalPrice(
                  pointDiscount: pointDiscount,
                ),
                const Spacer(),
                const ConfirmButton(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
