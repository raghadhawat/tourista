import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/ready_trips/presentation/manager/ready_trip_point_cubit/ready_trip_point_cubit.dart';
import 'package:tourista/features/ready_trips/presentation/manager/trip_info_cubit/trip_info_cubit.dart';

class FlightsPointBox extends StatelessWidget {
  const FlightsPointBox({
    super.key,
    required this.tripId,
  });
  final int tripId;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TripInfoCubit>();

    return Row(
      children: [
        BlocBuilder<TripInfoCubit, TripInfoState>(
          builder: (context, state) {
            return Text(
              state.pointName == null
                  ? 'Choose a place to go'
                  : state.pointName!,
              style: AppStyles.styleInterSemiBold18(context),
            );
          },
        ),
        Spacer(),
        BlocBuilder<ReadyTripPointCubit, ReadyTripPointState>(
          builder: (context, state) {
            if (state is ReadyTripPointLoading) {
              return const Center(
                  child: SpinKitThreeBounce(
                color: kGreenColor,
                size: 30,
              ));
            } else if (state is ReadyTripPointSuccess) {
              return PopupMenuButton(
                  offset: Offset(21, 45),
                  constraints: BoxConstraints.expand(
                      height: 150,
                      width: MediaQuery.sizeOf(context).width * .9),
                  icon: Icon(Icons.keyboard_arrow_down),
                  itemBuilder: (context) => List.generate(
                      state.readyTripsPointModel.publicTripPoints!.length,
                      (index) => PopupMenuItem(
                          onTap: () {
                            cubit.setPointId(
                              state.readyTripsPointModel
                                  .publicTripPoints![index].id!,
                            );
                            cubit.setPrice(state.readyTripsPointModel
                                .publicTripPoints![index].price!);
                            cubit.setPointName(
                                '${state.readyTripsPointModel.publicTripPoints![index].city!.name!} , ${state.readyTripsPointModel.publicTripPoints![index].city!.country!}');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(state.readyTripsPointModel
                                    .publicTripPoints![index].city!.name!),
                                Gap(3),
                                Text(
                                  state.readyTripsPointModel
                                      .publicTripPoints![index].city!.country!,
                                  style: AppStyles.styleInterMedium12(context)
                                      .copyWith(fontSize: 12),
                                ),
                              ],
                            ),
                          ))));
            } else {
              return Column(
                children: [
                  Text('error please try later'),
                  TextButton(
                      onPressed: () {
                        BlocProvider.of<ReadyTripPointCubit>(context)
                            .getReadyTripPointsFun(tripId: tripId);
                      },
                      child: Text('retry'))
                ],
              );
            }
          },
        ),
      ],
    );
  }
}
