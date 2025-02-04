import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/service_locator.dart';
import 'package:tourista/features/my_trips/data/repos/my_trips_repo_impl.dart';
import 'package:tourista/features/my_trips/presentation/manager/active_user_point_cubit/active_user_point_cubit.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/points_list_view.dart';

class PointsViewBody extends StatelessWidget {
  const PointsViewBody(
      {super.key, required this.tripId, required this.isDelay});
  final int tripId;
  final bool isDelay;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActiveUserPointCubit(getIt.get<MyTripsRepoImpl>())
        ..getActiveUserPointTripsFun(tripId: tripId),
      child: BlocBuilder<ActiveUserPointCubit, ActiveUserPointState>(
        builder: (context, state) {
          if (state is ActiveUserPointLoading) {
            return Center(
                child: CircularProgressIndicator(
              color: kPrimaryColor,
            ));
          }
          if (state is ActiveUserPointSuccess) {
            return PointListView(
              isDelay: isDelay,
              activeUserPointModel: state.activeUserPointModel,
            );
          } else if (state is ActiveUserPointFailure) {
            return Center(
              child: Column(
                children: [
                  Column(
                    children: [
                      Text(state.errMessage),
                      TextButton(
                          onPressed: () {
                            BlocProvider.of<ActiveUserPointCubit>(context)
                                .getActiveUserPointTripsFun(tripId: tripId);
                          },
                          child: Text(
                            'Retry',
                            style: TextStyle(color: kPrimaryColor),
                          ))
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Column(
                children: [
                  Text('There is a problem retry later'),
                  TextButton(
                      onPressed: () {
                        BlocProvider.of<ActiveUserPointCubit>(context)
                            .getActiveUserPointTripsFun(tripId: tripId);
                      },
                      child: Text(
                        'Retry',
                        style: TextStyle(color: kPrimaryColor),
                      ))
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
