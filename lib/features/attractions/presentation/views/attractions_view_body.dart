import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/loading_widget.dart';
import 'package:tourista/features/attractions/presentation/manager/get_attractions_cubit/get_attractions_cubit.dart';
import 'attractions_grid_view.dart';

class AttractionsViewBody extends StatelessWidget {
  const AttractionsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetAttractionsCubit>(context).getAttractions();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          color: kPrimaryColor,
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'Attractions',
                      style: AppStyles.styleInterSemiBold23(context)
                          .copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kNotificationsView);
                  },
                  child: const Icon(
                    Icons.notifications_outlined,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        BlocBuilder<GetAttractionsCubit, GetAttractionsState>(
          builder: (context, state) {
            if (state is GetAttractionsLoading) {
              return const LoadingWidget();
            } else if (state is GetAttractionsSuccess) {
              return Expanded(
                  child: AttractionsGridView(
                attractionsModel: state.attractionsModel,
              ));
            } else if (state is GetAttractionsFailure) {
              return Text(state.errMessage);
            } else {
              return const SizedBox();
            }
          },
        )
      ],
    );
  }
}
