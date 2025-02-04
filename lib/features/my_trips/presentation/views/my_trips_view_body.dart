import 'package:flutter/material.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/active_body.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/canceled_body.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/favorit_body.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/my_trips_app_bar.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/my_trips_tab_bar.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/past_body.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/uncompleted_body.dart';

class MyTripsViewBody extends StatefulWidget {
  const MyTripsViewBody({super.key});

  @override
  State<MyTripsViewBody> createState() => _MyTripsViewBodyState();
}

class _MyTripsViewBodyState extends State<MyTripsViewBody>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTripsAppBar(),
        MyTripsTabBar(tabController: tabController),
        Expanded(
          child: TabBarView(controller: tabController, children: [
            ActiveBody(),
            PastBody(),
            CanceledBody(),
            FavoritBody(),
            UncompletedBody()
          ]),
        )
      ],
    );
  }
}
