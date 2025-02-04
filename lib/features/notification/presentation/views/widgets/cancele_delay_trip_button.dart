import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/core/utlis/functions/custom_success_snack_bar.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/notification/presentation/manager/cancele_delay_trip_cubit/cnacele_delay_trip_cubit.dart';

class CanceleDelayTripButton extends StatelessWidget {
  const CanceleDelayTripButton({
    super.key,
    required this.tripId,
  });
  final int tripId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CnaceleDelayTripCubit(),
      child: BlocConsumer<CnaceleDelayTripCubit, CnaceleDelayTripState>(
        listener: (context, state) {
          if (state is CnaceleDelayTripFailure) {
            customSnackBar(context, state.errMessage);
          }
          if (state is CnaceleDelayTripSuccess) {
            customSuccessSnackBar(context,
                'The Trip Canceled succeessfully and you get all your money back');
          }
        },
        builder: (context, state) {
          return state is CnaceleDelayTripLoading
              ? CircularProgressIndicator(
                  color: kPrimaryColor,
                )
              : CustomButton(
                  onTap: () {
                    BlocProvider.of<CnaceleDelayTripCubit>(context)
                        .canceleDelayTripsFun(tripId: tripId);
                  },
                  text: 'Cancele',
                  width: 73,
                  height: 31,
                  borderRadius: 12,
                  style: AppStyles.styleInterBold16(context)
                      .copyWith(color: Colors.white),
                  color: kPrimaryColor);
        },
      ),
    );
  }
}
