import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/err_animation.dart';
import 'package:tourista/features/private_trip/flights/presentation/manager/airport_where_from_cubit/airport_where_from_cubit.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/airport_card_list_view.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/cancel_text_widget.dart';

class WhereFromAirprotViewBody extends StatelessWidget {
  const WhereFromAirprotViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CancelTextWidget(),
          const Gap(13),
          Text(
            LocaleKeys.whereFrom.tr(),
            style: AppStyles.styleInterBold25(context),
          ),
          const Gap(5),
          Divider(
            color: Colors.black.withOpacity(.2),
          ),
          const Gap(10),
          BlocBuilder<AirportWhereFromCubit, AirportWhereFromState>(
            builder: (context, state) {
              if (state is AirportWhereFromSuccess) {
                return AirportCardListView(
                  airportWhereModel: state.airportWhereModel,
                );
              } else if (state is AirportWhereFromLoading) {
                return const SpinKitThreeBounce(
                  color: kGreenColor,
                  size: 30,
                );
              } else if (state is AirportWhereFromFailure) {
                return ErrAnimation(
                  errMessage: state.errMessage,
                );
              }

              return const ErrAnimation(
                errMessage: "oops there was a problem please try later!",
              );
            },
          )
        ],
      ),
    );
  }
}
