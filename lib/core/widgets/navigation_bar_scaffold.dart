import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/service_locator.dart';
import 'package:tourista/features/attractions/data/repos/attraction_repo_imp.dart';
import 'package:tourista/features/attractions/presentation/manager/get_attractions_cubit/get_attractions_cubit.dart';
import 'package:tourista/features/attractions/presentation/views/attractions_view_body.dart';
import 'package:tourista/features/my_trips/presentation/views/my_trips_view_body.dart';
import 'package:tourista/features/private_trip/main/data/repos/main_repo_impl.dart';
import 'package:tourista/features/private_trip/main/presentation/manager/create_trip_cubit/create_trip_cubit.dart';
import 'package:tourista/features/private_trip/main/presentation/views/private_trip_main_view_body.dart';
import 'package:tourista/features/profile/presentation/views/profile_view_body.dart';
import 'package:tourista/features/ready_trips/data/repos/ready_trip_repo_impl.dart';
import 'package:tourista/features/ready_trips/presentation/manager/add_favorit_trip_cubit/add_favorit_trip_cubit.dart';
import 'package:tourista/features/ready_trips/presentation/manager/all_ready_trips_cubit/all_ready_trips_cubit.dart';
import 'package:tourista/features/ready_trips/presentation/views/ready_trip_main_view_body.dart';

class NavigationBArScaffold extends StatefulWidget {
  const NavigationBArScaffold({super.key, this.index});
  final int? index;
  @override
  State<NavigationBArScaffold> createState() => _NavigationBArScaffoldState();
}

class _NavigationBArScaffoldState extends State<NavigationBArScaffold> {
  List<Widget> navList = [
    const MyTripsViewBody(),
    BlocProvider(
      create: (context) =>
          GetAttractionsCubit(getIt.get<AttractionsRepoImpl>()),
      child: const AttractionsViewBody(),
    ),
    const PrivatTripMainViewBody(),
    const ProfileViewBody(),
    const ProfileViewBody(),
  ];
  late int activeIndex;
  @override
  void initState() {
    super.initState();
    if (widget.index == null) {
      activeIndex = -1;
    } else {
      activeIndex = widget.index!;
    }
  }

  @override
  Widget build(BuildContext context) {
    var iconList = [
      Icons.badge_outlined,
      Icons.attractions_outlined,
      Icons.widgets_outlined,
      Icons.account_circle_outlined
    ];

    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CreateTripCubit(getIt.get<MainRepoImpl>()),
          ),
          BlocProvider(
            create: (context) =>
                AddFavoritTripCubit(getIt.get<ReadyTripsRepoImpl>()),
          ),
        ],
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: floatingActionButton(context),
          bottomNavigationBar: animatedBottomNavigationaBar(iconList),
          body: activeIndex == -1
              ? const ReadyTripMainViewBody()
              : navList.elementAt(activeIndex),
        ),
      ),
    );
  }

  FloatingActionButton floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: () {
        BlocProvider.of<AllReadyTripsCubit>(context).getAllReadyTripsFun();
        setState(() {
          activeIndex = -1;
        });
      },
      backgroundColor: activeIndex == -1 ? kPrimaryColor : Colors.white,
      child: Center(
        child: SvgPicture.asset(
          width: 28,
          height: 28,
          Assets.imagesIconsReadyTripIcon,
          color:
              activeIndex == -1 ? Colors.white : kPrimaryColor.withOpacity(.5),
        ),
      ),
    );
  }

  AnimatedBottomNavigationBar animatedBottomNavigationaBar(
      List<IconData> iconList) {
    return AnimatedBottomNavigationBar(
      icons: iconList,
      activeIndex: activeIndex,
      onTap: (index) {
        setState(() {
          activeIndex = index;
        });
      },
      inactiveColor: kPrimaryColor.withOpacity(.4),
      activeColor: kPrimaryColor,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      iconSize: 30,
    );
  }
}
