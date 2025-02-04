import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/activities/data/repos/activities_repo_impl.dart';
import 'package:tourista/features/private_trip/activities/presentation/manager/activities_cubit/activities_cubit.dart';
import 'package:tourista/features/private_trip/activities/presentation/manager/activities_plan_cubit/activities_plan_cubit.dart';
import 'package:tourista/features/private_trip/activities/presentation/manager/get_trip_days_cubit/get_trip_days_cubit.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/add_activities_view_body.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/flights_view_body.dart';
import 'package:tourista/features/private_trip/main/data/models/create_trip_model/create_trip_model.dart';
import 'package:tourista/features/private_trip/main/presentation/views/widgets/custom_tab_TabBar.dart';
import 'package:tourista/features/private_trip/stays/data/repos/stays_repo_impl.dart';
import 'package:tourista/features/private_trip/stays/presentation/manager/hotels_cubit/hotels_cubit.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/stays_view_body.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/final_booking_private_trip/final_booking_private_trip_cubit.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/get_user_private_plan_cubit/get_user_private_plan_cubit.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/views/thePlan_view_body.dart';
import '../../../../../core/utlis/service_locator.dart';
import '../../../flights/data/repos/flights_repo_impl.dart';
import '../../../flights/presentation/manager/flights/flights_cubit.dart';
import '../../../flights/presentation/manager/tickets_cubit/tickets_cubit.dart';
import '../../../the_plan/data/repos/the_plan_repo_impl.dart';

class PrivateTripTapBar extends StatelessWidget {
  const PrivateTripTapBar({super.key, required this.createTripModel});
  final CreateTripModel createTripModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => TicketsCubit(getIt.get<FlightsRepoImpl>()),
            ),
            BlocProvider(
              create: (context) => FlightsCubit(),
            ),
            BlocProvider(
              create: (context) =>
                  ActivitiesCubit(getIt.get<ActivitiesRepoImpl>()),
            ),
            BlocProvider(
              create: (context) =>
                  ActivitiesPlanCubit(getIt.get<ActivitiesRepoImpl>()),
            ),
            BlocProvider(
                create: (context) => HotelsCubit(getIt.get<StaysRepoImpl>())
                  ..fetchHotelsCubitFun(
                    tripId: createTripModel.tripId!.id,
                  )),
            BlocProvider(
              create: (context) =>
                  GetTripDaysCubit(getIt.get<ActivitiesRepoImpl>()),
            ),
            BlocProvider(
              create: (context) =>
                  GetUserPrivatePlanCubit(getIt.get<ThePlanRepoImpl>()),
            ),
            BlocProvider(
                create: (context) =>
                    FinalBookingPrivateTripCubit(getIt.get<ThePlanRepoImpl>())),
          ],
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: SvgPicture.asset(
                Assets.imagesTouristaLogoWhite,
                width: 115,
              ),
              backgroundColor: kPrimaryColor,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(70),
                child: TabBar(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  labelColor: Colors.white,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  labelStyle: AppStyles.styleSourceSemiBold20(context),
                  unselectedLabelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white.withOpacity(.20),
                  ),
                  tabs: [
                    CustomTabForTabBar(
                      assetName: Assets.imagesIconsFlights,
                      data: LocaleKeys.Flights.tr(),
                    ),
                    CustomTabForTabBar(
                      assetName: Assets.imagesIconsStays,
                      data: LocaleKeys.Stays.tr(),
                    ),
                    CustomTabForTabBar(
                      assetName: Assets.imagesIconsActivities,
                      data: LocaleKeys.Activities.tr(),
                    ),
                    CustomTabForTabBar(
                      assetName: Assets.imagesIconsThePlan,
                      data: LocaleKeys.The_plan.tr(),
                    ),
                  ],
                ),
              ),
            ),
            body: TabBarView(
              children: [
                BlocProvider.value(
                  value: BlocProvider.of<FlightsCubit>(context),
                  child: FligtsViewBody(
                    createTripModel: createTripModel,
                  ),
                ),
                StaysViewBody(
                  tripId: createTripModel.tripId!.id,
                ),
                AddActivitiesViewBody(
                  createTripModel: createTripModel,
                ),
                ThePlanViewBody(
                  createTripModel: createTripModel,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
