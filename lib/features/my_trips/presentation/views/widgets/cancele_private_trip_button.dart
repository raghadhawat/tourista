import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/core/utlis/functions/custom_success_snack_bar.dart';
import 'package:tourista/core/utlis/service_locator.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/my_trips/data/repos/my_trips_repo_impl.dart';
import 'package:tourista/features/my_trips/presentation/manager/cancele_private_trip_cubit/cancel_private_trip_cubit.dart';

class CancelePrivateButton extends StatelessWidget {
  const CancelePrivateButton({
    super.key,
    required this.tripId,
  });
  final int tripId;
  @override
  Widget build(BuildContext context) {
    bool? isLoading;
    return BlocProvider(
      create: (context) => CancelPrivateTripCubit(getIt.get<MyTripsRepoImpl>()),
      child: BlocConsumer<CancelPrivateTripCubit, CancelPrivateTripState>(
        listener: (context, state) {
          if (state is CancelPrivateTripSuccess) {
            isLoading = false;
            Navigator.of(context).pop();
            Navigator.of(context).pop();

            customSuccessSnackBar(context,
                'This Trip Has Been Canceled and you restore ${state.cancelPrivateTripModel.theReturnPrice} from your money');
          }
          if (state is CancelPrivateTripFailure) {
            isLoading = false;
            customSnackBar(context, state.errMessage);
          }
          if (state is CancelPrivateTripLoading) {
            isLoading = true;
          }
        },
        builder: (context, state) {
          return isLoading == true
              ? CircularProgressIndicator()
              : CustomButton(
                  onTap: () {
                    BlocProvider.of<CancelPrivateTripCubit>(context)
                        .cancelePrivateTripsFun(tripId: tripId);
                  },
                  text: 'Yes',
                  width: 73,
                  borderRadius: 5,
                  height: 31,
                  style: AppStyles.styleSourceBold20(context)
                      .copyWith(color: Colors.white),
                  color: kPrimaryColor,
                );
        },
      ),
    );
  }
}
