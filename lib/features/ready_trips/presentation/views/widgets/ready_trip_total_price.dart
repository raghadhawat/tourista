import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/ready_trips/presentation/manager/trip_info_cubit/trip_info_cubit.dart';

class ReadyTripTotalPrice extends StatelessWidget {
  const ReadyTripTotalPrice({
    super.key,
    required this.pointDiscount,
  });
  final int pointDiscount;
  @override
  Widget build(BuildContext context) {
    print('PPPPP$pointDiscount');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.totalPrice.tr(),
          style: AppStyles.styleInterBold25(context),
        ),
        BlocBuilder<TripInfoCubit, TripInfoState>(
          builder: (context, state) {
            var totalwithvip = state.vipTicket!
                ? (state.price ?? 0) * (state.ticketNumber ?? 0)
                : (state.price ?? 0) *
                    (state.ticketNumber ?? 0) *
                    0.3; // 200 20%  totale= totale - total*20/100
            return Text(
              '${state.pointsOrNot! ? totalwithvip - totalwithvip * 20 / 100 : totalwithvip}  \$',
              style: AppStyles.styleInterSemiBold20(context)
                  .copyWith(fontSize: 20),
            );
          },
        ),
      ],
    );
  }
}
