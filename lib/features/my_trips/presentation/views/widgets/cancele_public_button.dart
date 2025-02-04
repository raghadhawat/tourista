import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/core/utlis/functions/custom_success_snack_bar.dart';
import 'package:tourista/core/utlis/service_locator.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/my_trips/data/repos/my_trips_repo_impl.dart';
import 'package:tourista/features/my_trips/presentation/manager/cancele_public_trip_cubit/cancele_public_trip_cubit.dart';

class CancelePublicButton extends StatelessWidget {
  const CancelePublicButton({super.key, required this.userPointId});
  final int userPointId;
  @override
  Widget build(BuildContext context) {
    bool? isLoading;
    return BlocProvider(
      create: (context) => CancelePublicTripCubit(getIt.get<MyTripsRepoImpl>()),
      child: BlocConsumer<CancelePublicTripCubit, CancelePublicTripState>(
        listener: (context, state) {
          if (state is CancelePublicTripSuccess) {
            isLoading = false;
            Navigator.of(context).pop();
            Navigator.of(context).pop();

            customSuccessSnackBar(context,
                'This Trip Has Been Canceled and you restore ${state.cancelePublicTripModel.refundAmount} from your money');
          }
          if (state is CancelePublicTripFailure) {
            isLoading = false;
            customSnackBar(context, state.errMessage);
          }
          if (state is CancelePublicTripLoading) {
            isLoading = true;
          }
        },
        builder: (context, state) {
          return isLoading == true
              ? CircularProgressIndicator()
              : CustomButton(
                  onTap: () {
                    BlocProvider.of<CancelePublicTripCubit>(context)
                        .cancelePublicTripsFun(userTripPoint: userPointId);
                  },
                  text: 'Yes',
                  width: 73,
                  borderRadius: 25,
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
