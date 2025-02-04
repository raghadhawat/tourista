import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/functions/theme_data.dart';
import 'package:tourista/features/notification/data/services/notification_services.dart';
import 'package:tourista/features/notification/data/services/pusher_service.dart';
import 'package:tourista/core/utlis/service_locator.dart';
import 'package:tourista/core/utlis/simple_bloc_observer.dart';
import 'package:tourista/features/attractions/data/repos/attraction_repo_imp.dart';
import 'package:tourista/features/attractions/presentation/manager/public_attraction_cubit/public_attraction_cubit.dart';
import 'package:tourista/features/private_trip/activities/presentation/manager/activity_card_cubit/activity_card_cubit.dart';
import 'package:tourista/features/private_trip/main/data/repos/main_repo_impl.dart';
import 'package:tourista/features/private_trip/main/presentation/manager/all_city_cubit/all_city_cubit.dart';
import 'package:tourista/features/private_trip/main/presentation/manager/private_trip_cubit/private_trip_cubit.dart';
import 'package:tourista/features/private_trip/stays/presentation/manager/hotel_info_cubit/hotel_info_cubit.dart';
import 'package:tourista/features/profile/presentation/manager/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:tourista/features/ready_trips/data/repos/ready_trip_repo_impl.dart';
import 'package:tourista/features/ready_trips/presentation/manager/all_ready_trips_cubit/all_ready_trips_cubit.dart';
import 'package:tourista/features/ready_trips/presentation/manager/ready_trip_details_cubit/ready_trip_details_cubit.dart';
import 'package:tourista/firebase_options.dart';
import './core/translations/codegen_loader.g.dart';
import 'features/profile/data/repos/profile_repo_impl.dart';
import 'features/profile/presentation/manager/add_review_cubit/add_review_cubit.dart';

void main() async {
  setUpServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(kOnboarding);
  await Hive.openBox(kTokenBox);
  await Hive.openBox(kUserInfoBox);
  await LocalNotificationService.init();
  WebSocketService().connect();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: const Tourista(),
    ),
  );
}

class Tourista extends StatelessWidget {
  const Tourista({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ActivityCardCubit(),
        ),
        BlocProvider(
          create: (context) => PrivateTripCubit(),
        ),
        BlocProvider(
          create: (context) => AllCityCubit(getIt.get<MainRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => HotelInfoCubit(),
        ),
        BlocProvider(
            create: (context) => AddReviewCubit(getIt.get<ProfileRepoImpl>())),
        BlocProvider(
          create: (context) => GetUserInfoCubit(getIt.get<ProfileRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              ReadyTripDetailsCubit(getIt.get<ReadyTripsRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              AllReadyTripsCubit(getIt.get<ReadyTripsRepoImpl>())
                ..getAllReadyTripsFun(),
        ),
        BlocProvider(
          create: (context) =>
              PublicAttractionCubit(getIt.get<AttractionsRepoImpl>()),
        ),
      ],
      child: MaterialApp.router(
        theme: themeData(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
