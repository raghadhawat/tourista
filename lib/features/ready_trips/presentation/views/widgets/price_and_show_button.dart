import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/ready_trips/data/models/all_ready_trips_model/the_trip.dart';
import 'package:tourista/features/ready_trips/presentation/manager/ready_trip_details_cubit/ready_trip_details_cubit.dart';

class PriceAndShowButton extends StatelessWidget {
  const PriceAndShowButton({
    super.key,
    required this.theTrip,
  });
  final TheTrip theTrip;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${theTrip.averagePrice} \$',
          style: AppStyles.styleInterMedium18(context),
        ),
        const Spacer(),
        CustomButton(
            onTap: () {
              BlocProvider.of<ReadyTripDetailsCubit>(context)
                  .getReadyTripDetailsFun(tripId: theTrip.id!);
              GoRouter.of(context).push(AppRouter.kReadyTripDetailsView);
            },
            text: LocaleKeys.show.tr(),
            width: 56,
            borderRadius: 24,
            height: 26,
            style: AppStyles.styleSourceBold18(context)
                .copyWith(color: Colors.white),
            color: kPrimaryColor.withOpacity(.8))
      ],
    );
  }
}
