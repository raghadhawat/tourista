import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/ready_trips/presentation/manager/all_ready_trips_cubit/all_ready_trips_cubit.dart';

class ReadyTripsTabBar extends StatelessWidget {
  const ReadyTripsTabBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: TabBar(
          onTap: (value) {
            if (value == 0) {
              BlocProvider.of<AllReadyTripsCubit>(context)
                  .getAllReadyTripsFun();
            } else {
              BlocProvider.of<AllReadyTripsCubit>(context)
                  .getAllReadyTripsFun(classificationId: value);
            }
          },
          overlayColor: const MaterialStatePropertyAll(Colors.white),
          labelColor: Colors.black,
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          labelStyle: AppStyles.styleSourceSemiBold22(context),
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.black,
          controller: tabController,
          tabs: [
            Tab(
              text: LocaleKeys.General.tr(),
            ),
            Tab(
              text: LocaleKeys.mountain.tr(),
            ),
            Tab(
              text: LocaleKeys.jungle.tr(),
            ),
            Tab(
              text: LocaleKeys.beach.tr(),
            ),
            Tab(
              text: LocaleKeys.water.tr(),
            )
          ]),
    );
  }
}
