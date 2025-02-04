import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/utlis/service_locator.dart';
import 'package:tourista/core/widgets/loading_widget.dart';
import 'package:tourista/core/widgets/snak_bar_widget.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/activities_private_container.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/hotel_private_container.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/tickets_private_container.dart';
import 'package:tourista/features/private_trip/the_plan/data/repos/the_plan_repo_impl.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/get_user_private_plan_cubit/get_user_private_plan_cubit.dart';
import 'package:tourista/core/utlis/functions/show_dialog.dart';

class PrivateTripDetailsViewBody extends StatelessWidget {
  const PrivateTripDetailsViewBody({super.key, required this.tripId});
  final int tripId;
  @override
  Widget build(BuildContext context) {
    CustomShowDialog showConfirmationDialog = CustomShowDialog();

    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return BlocProvider(
      create: (context) => GetUserPrivatePlanCubit(getIt.get<ThePlanRepoImpl>())
        ..getUserPrivatePlan(tripId: tripId),
      child: BlocBuilder<GetUserPrivatePlanCubit, GetUserPrivatePlanState>(
        builder: (context, state) {
          if (state is GetUserPrivatePlanSuccess) {
            return Container(
              color: Colors.grey.shade100,
              child: Stack(alignment: Alignment.bottomCenter, children: [
                CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          TicketsPrivateContainer(
                            screenWidth: screenWidth,
                            state: state,
                          ),
                          HotelPrivateContainer(
                            screenWidth: screenWidth,
                            tripId: tripId,
                            screenHeight: screenHeight,
                            state: state,
                          ),
                          ActivitiesPrivateContainer(
                            screenWidth: screenWidth,
                            showConfirmationDialog: showConfirmationDialog,
                            state: state,
                          ),
                          Gap(screenHeight * .15),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            );
          } else if (state is GetUserPrivatePlanFailure) {
            return SnakBarWidget(
              message: state.errMessage,
            );
          } else {
            return const LoadingWidget();
          }
        },
      ),
    );
  }
}
