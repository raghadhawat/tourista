import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/service_locator.dart';
import 'package:tourista/core/widgets/navigation_bar_scaffold.dart';
import 'package:tourista/features/auth/forget_password/data/repos/forget_password_impl.dart';
import 'package:tourista/features/auth/forget_password/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:tourista/features/auth/forget_password/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:tourista/features/auth/forget_password/presentation/manager/verify_code_cubit/verify_code_cubit.dart';
import 'package:tourista/features/auth/forget_password/presentation/views/forget_password.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/repos/auth_repo_impl.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/manager/sent_google_user_info_cubit/sent_google_user_info_cubit.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/manager/sign_in_with_google_cubit/sign_in_with_google_cubit.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/manager/verify_sign_up_cubit/verify_signup_cubit.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/views/sign_in_view.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/views/sign_up_view.dart';
import 'package:tourista/features/auth/forget_password/presentation/views/reset_password_view.dart';
import 'package:tourista/features/auth/forget_password/presentation/views/verify_view.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/views/verify_sign_up_view.dart';
import 'package:tourista/features/my_trips/presentation/views/active_private_trip_details_view.dart';
import 'package:tourista/features/my_trips/presentation/views/active_public_trip_details_view.dart';
import 'package:tourista/features/my_trips/presentation/views/canceled_private_trip_details_view.dart';
import 'package:tourista/features/my_trips/presentation/views/canceled_public_trip_details_view.dart';
import 'package:tourista/features/my_trips/presentation/views/past_private_trip_details_view.dart';
import 'package:tourista/features/my_trips/presentation/views/past_public_trip_details_view.dart';
import 'package:tourista/features/my_trips/presentation/views/points_view.dart';
import 'package:tourista/features/notification/presentation/views/from_notifications_view.dart';
import 'package:tourista/features/notification/presentation/views/notification_view.dart';
import 'package:tourista/features/onboarding/views/onboarding_view.dart';
import 'package:tourista/features/private_trip/activities/presentation/manager/activities_cubit/activities_cubit.dart';
import 'package:tourista/features/private_trip/activities/presentation/manager/search_activity_cubit/search_activity_cubit.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/search_activity_view.dart';
import 'package:tourista/features/private_trip/flights/data/repos/flights_repo_impl.dart';
import 'package:tourista/features/private_trip/flights/presentation/manager/airport_where_from_cubit/airport_where_from_cubit.dart';
import 'package:tourista/features/private_trip/flights/presentation/manager/airport_where_to_cubit/airport_where_to_cubit.dart';
import 'package:tourista/features/private_trip/flights/presentation/manager/choose_ticket_cubit/choose_ticket_cubit.dart';
import 'package:tourista/features/private_trip/flights/presentation/manager/flights/flights_cubit.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/tickets_view.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/where_from_airport_view.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/where_to_airport_view.dart';
import 'package:tourista/features/private_trip/main/data/models/create_trip_model/create_trip_model.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/activities_view.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/activity_details_view.dart';
import 'package:tourista/features/private_trip/main/presentation/views/private_trip_TabBar.dart';
import 'package:tourista/features/private_trip/main/presentation/views/enter_destination_view.dart';
import 'package:tourista/features/private_trip/main/presentation/views/select_location_view.dart';
import 'package:tourista/features/private_trip/stays/data/models/hotels_model/hotel.dart';
import 'package:tourista/features/private_trip/stays/data/repos/stays_repo_impl.dart';
import 'package:tourista/features/private_trip/stays/presentation/manager/room_hotel_cubit/room_hotel_cubit.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/all_photo_view.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/hotel_detail_view.dart';
import 'package:tourista/features/profile/presentation/manager/change_language_cubit/change_language_cubit.dart';
import 'package:tourista/features/profile/presentation/views/wallet_view.dart';
import 'package:tourista/features/ready_trips/data/models/ready_trips_details_model/cities_hotel.dart';
import 'package:tourista/features/ready_trips/data/models/ready_trips_details_model/tourism_place.dart';
import 'package:tourista/features/ready_trips/data/repos/ready_trip_repo_impl.dart';
import 'package:tourista/features/ready_trips/presentation/manager/ready_trip_point_cubit/ready_trip_point_cubit.dart';
import 'package:tourista/features/ready_trips/presentation/manager/trip_info_cubit/trip_info_cubit.dart';
import 'package:tourista/features/ready_trips/presentation/views/apply_the_trip_view.dart';
import 'package:tourista/features/ready_trips/presentation/views/every_place_detail.dart';
import 'package:tourista/features/profile/presentation/manager/all_reviews_cubit/all_reviews_cubit.dart';
import 'package:tourista/features/ready_trips/presentation/views/ready_trip_details_view.dart';
import 'package:tourista/features/profile/presentation/manager/all_questions_cubit/all_questions_cubit.dart';
import 'package:tourista/features/profile/presentation/manager/all_questions_with_tybe_cubit/all_questions_with_tybe_cubit.dart';
import 'package:tourista/features/profile/presentation/views/customer_support_view.dart';
import 'package:tourista/features/profile/presentation/views/personal_details_view.dart';
import 'package:tourista/features/profile/presentation/views/password_and_security_view.dart';
import 'package:tourista/features/profile/presentation/views/reviews_view.dart';
import 'package:tourista/features/ready_trips/presentation/views/ready_trip_hotel_details_view.dart';
import 'package:tourista/features/splash/views/splash_view.dart';

import '../../features/private_trip/activities/data/repos/activities_repo_impl.dart';
import '../../features/profile/data/repos/profile_repo_impl.dart';
import '../../features/profile/presentation/manager/change_password_cubit/change_password_cubit.dart';
import '../../features/profile/presentation/manager/update_name_cubit/update_name_cubit.dart';
import '../../features/profile/presentation/manager/update_phone_cubit/update_phone_cubit.dart';
import '../../features/profile/presentation/manager/verify_new_phone_cubit/verify_new_phone_cubit.dart';
import '../../features/profile/presentation/views/about_us_view.dart';
import '../../features/profile/presentation/views/language_view.dart';
import '../../features/profile/presentation/views/verify_new_phone_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kSignUp = '/signUpView';
  static const kSignIN = '/signINView';
  static const kForgetPassword = '/forgetPasswordView';
  static const kOnboarduingView = '/onboardingView';
  static const kVerifyView = '/verifyView';
  static const kResetPassword = '/resetPassword';
  static const kPrivateTripTapBar = '/privateTreipTopB';
  static const kVerifySignUpView = '/verifySignUpView';
  static const kSelectLocationView = '/selectLocationView';
  static const kEnterDestinationView = '/enterDestinationView';
  static const kTicketsView = '/ticketsView';
  static const kWhereFromAirportView = '/whereFromAirportView';
  static const kWhereToAirportView = '/whereToAirportView';
  static const kActivitiesView = '/ActivitiesView';
  static const kSearchActivityView = '/SearchActivityView';
  static const kActivityDetailsView = '/ActivityDetailsView';
  static const kHotelDetailsView = '/hotelDetailsView';
  static const kAllPhotoView = '/allPhotoView';
  static const kReadyTripDetailsView = '/readyTripDetailsView';
  static const kLanguageView = '/languageView';
  static const kPersonalDetailsView = '/personalDetailsView';
  static const kWalletView = '/walletView';
  static const kPasswordAndSecurityView = '/passwordAndSecurity';
  static const kAboutUsView = '/aboutUsView';
  static const kCustomerSupportView = '/customerSupportview';
  static const kReviewsView = '/reviewsView';
  static const kEveryPlaceDetail = '/EveryPlaceDetail';
  static const kApplyTheTripView = '/ApplyTheTripView';
  static const kverifyNewPhoneview = '/verifyNewPhoneview';
  static const kreadyTripHotelDetailsview = '/readyTripHotelDetailsview';
  static const kpastPublicTripDetailsview = '/pastPublicTripDetailsview';
  static const kActivePublicTripDetailsview = '/activePublicTripDetailsview';
  static const kActivePrivateTripDetailsview = '/activePrivateTripDetailsview';
  static const kPastPrivateTripDetailsview = '/pastPrivateTripDetailsview';
  static const kPointsview = '/pointsview';
  static const kNotificationsView = '/notificationsView';
  static const kFromNotificationview = '/FromNotificationview';
  static const kCanceledPrivateTripDetailsview =
      '/CanceledPrivateTripDetailsview';
  static const kCanceledPublicTripDetailsview =
      '/canceledPublicTripDetailsview';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kLanguageView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              ChangeLanguageCubit(getIt.get<ProfileRepoImpl>()),
          child: const LanguageView(),
        ),
      ),
      GoRoute(
        path: kFromNotificationview,
        builder: (context, state) => FromNotificationsView(
          tripId: state.extra as int,
        ),
      ),
      GoRoute(
        path: kNotificationsView,
        builder: (context, state) => const NotificationView(),
      ),
      GoRoute(
        path: kActivePrivateTripDetailsview,
        builder: (context, state) => ActivePrivateTripDetailsView(
          tripId: state.extra as int,
        ),
      ),
      GoRoute(
        path: kCanceledPrivateTripDetailsview,
        builder: (context, state) => CanceledPrivateTripDetailsView(
          tripId: state.extra as int,
        ),
      ),
      GoRoute(
        path: kPastPrivateTripDetailsview,
        builder: (context, state) => PastPrivateTripDetailsView(
          tripId: state.extra as int,
        ),
      ),
      GoRoute(
        path: kAboutUsView,
        builder: (context, state) => const AboutUsView(),
      ),
      GoRoute(
        path: kCustomerSupportView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  AllQuestionsCubit(getIt.get<ProfileRepoImpl>()),
            ),
            BlocProvider(
              create: (context) =>
                  AllQuestionsWithTybeCubit(getIt.get<ProfileRepoImpl>()),
            ),
          ],
          child: const CustomerSupportView(),
        ),
      ),
      GoRoute(
        path: kReviewsView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              AllReviewsCubit(getIt.get<ProfileRepoImpl>())..getAllReviews(),
          child: const ReviewsView(),
        ),
      ),
      GoRoute(
        path: kPasswordAndSecurityView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              ChangePasswordCubit(getIt.get<ProfileRepoImpl>()),
          child: const PasswordAndSecurityView(),
        ),
      ),
      GoRoute(
        path: kPersonalDetailsView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  UpdateNameCubit(getIt.get<ProfileRepoImpl>()),
            ),
            BlocProvider(
              create: (context) =>
                  UpdatePhoneCubit(getIt.get<ProfileRepoImpl>()),
            ),
          ],
          child: const PersonalDetailsView(),
        ),
      ),
      GoRoute(
        path: kWalletView,
        builder: (context, state) => const WalletView(),
      ),
      GoRoute(
        path: kverifyNewPhoneview,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              VerifyNewPhoneCubit(getIt.get<ProfileRepoImpl>()),
          child: VerifyNewPhoneView(
            updatePhoneinfo: state.extra as Map<String, dynamic>,
          ),
        ),
      ),
      GoRoute(
        path: kSignUp,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: kTransitionDuration,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SignUpCubit(getIt.get<AuthRepoImpl>()),
              ),
              BlocProvider(
                create: (context) =>
                    SignInWithGoogleCubit(getIt.get<AuthRepoImpl>()),
              ),
              BlocProvider(
                create: (context) =>
                    SentgoogleUserinfoCubit(getIt.get<AuthRepoImpl>()),
              ),
            ],
            child: const SignUPView(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: kOnboarduingView,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: kTransitionDuration,
          child: const OnboardingView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: kSignIN,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SignInCubit(getIt.get<AuthRepoImpl>()),
            ),
            BlocProvider(
              create: (context) =>
                  SignInWithGoogleCubit(getIt.get<AuthRepoImpl>()),
            ),
            BlocProvider(
              create: (context) =>
                  SentgoogleUserinfoCubit(getIt.get<AuthRepoImpl>()),
            ),
          ],
          child: const SignInView(),
        ),
      ),
      GoRoute(
        path: kForgetPassword,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              ForgetPasswordCubit(getIt.get<ForgetPasswordRepoImpl>()),
          child: const ForgetPasswordView(),
        ),
      ),
      GoRoute(
        path: kVerifyView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              VerifyCodeCubit(getIt.get<ForgetPasswordRepoImpl>()),
          child: VerifyView(
            number: state.extra as Map<String, dynamic>,
            appBarText: LocaleKeys.forgetPassword.tr(),
          ),
        ),
      ),
      GoRoute(
        path: kResetPassword,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              ResetPasswordCubit(getIt.get<ForgetPasswordRepoImpl>()),
          child: ResetPasswordView(
            userId: state.extra as int,
          ),
        ),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => NavigationBArScaffold(
          index: state.extra == null ? -1 : state.extra as int,
        ),
      ),
      GoRoute(
        path: kPrivateTripTapBar,
        builder: (context, state) => BlocProvider(
          create: (context) => FlightsCubit(),
          child: PrivateTripTapBar(
            createTripModel: state.extra as CreateTripModel,
          ),
        ),
      ),
      GoRoute(
        path: kVerifySignUpView,
        builder: (context, state) => BlocProvider(
          create: (context) => VerifySignUpCubit(getIt.get<AuthRepoImpl>()),
          child: VerifySignUpView(
            signUpInfo: state.extra as Map<String, dynamic>,
          ),
        ),
      ),
      GoRoute(
        path: kSelectLocationView,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: kTransitionDuration,
          child: const SelectLocationView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1), // Slide in from bottom
                end: const Offset(0, 0), // Slide up to top
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: kEnterDestinationView,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: kTransitionDuration,
          child: const EnterDestinationView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1), // Slide in from bottom
                end: const Offset(0, 0), // Slide up to top
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: kWhereFromAirportView,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: kTransitionDuration,
          child: BlocProvider(
            create: (context) =>
                AirportWhereFromCubit(getIt.get<FlightsRepoImpl>())
                  ..getAirportFromCubitFun(cityId: state.extra as int),
            child: const WhereFromAirprotView(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1), // Slide in from bottom
                end: const Offset(0, 0), // Slide up to top
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: kWhereToAirportView,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: kTransitionDuration,
          child: BlocProvider(
            create: (context) =>
                AirportWhereToCubit(getIt.get<FlightsRepoImpl>())
                  ..getAirportToCubitFun(cityId: state.extra as int),
            child: const WhereToAirportView(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1), // Slide in from bottom
                end: const Offset(0, 0), // Slide up to top
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: kTicketsView,
        builder: (context, state) => BlocProvider(
          create: (context) => ChooseTicketCubit(getIt.get<FlightsRepoImpl>()),
          child: TicketsView(
            ticketsinfo: state.extra as Map<String, dynamic>,
          ),
        ),
      ),
      GoRoute(
        path: kActivitiesView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  ActivitiesCubit(getIt.get<ActivitiesRepoImpl>()),
            ),
            BlocProvider(
              create: (context) =>
                  SearchActivityCubit(getIt.get<ActivitiesRepoImpl>()),
            ),
          ],
          child: ActivitiesView(
              activitiesdaysInfo: state.extra as Map<String, dynamic>),
        ),
      ),
      GoRoute(
        path: kSearchActivityView,
        builder: (context, state) => const SearchActivityView(),
      ),
      GoRoute(
        path: kActivityDetailsView,
        builder: (context, state) => ActivityDetails(
          activityInfo: state.extra as Map<String, dynamic>,
          //   state.extra as ActivityModel
        ),
      ),
      GoRoute(
        path: kHotelDetailsView,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: kTransitionDuration,
          child: BlocProvider(
            create: (context) => RoomHotelCubit(getIt.get<StaysRepoImpl>())
              ..fetchRoomHotelsCubitFun(
                  hotelId: (state.extra as Map<String, dynamic>)['hotel'].id!),
            child: HotelDetailView(
              info: state.extra as Map<String, dynamic>,
            ),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: kAllPhotoView,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: kTransitionDuration,
          child: AllPhotosView(
            hotel: state.extra as Hotel,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0), // Slide in from left
                end: Offset.zero, // Slide up to top
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: kReadyTripDetailsView,
        builder: (context, state) => const ReadyTripDetailsView(),
      ),
      GoRoute(
        path: kEveryPlaceDetail,
        builder: (context, state) => EveryPlaceDetail(
          tourismPlace: state.extra as TourismPlace,
        ),
      ),
      GoRoute(
        path: kApplyTheTripView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  ReadyTripPointCubit(getIt.get<ReadyTripsRepoImpl>())
                    ..getReadyTripPointsFun(tripId: state.extra as int),
            ),
            BlocProvider(
              create: (context) => TripInfoCubit(),
            ),
          ],
          child: ApplyTheTripView(
            tripId: state.extra as int,
          ),
        ),
      ),
      GoRoute(
        path: kreadyTripHotelDetailsview,
        builder: (context, state) => ReadyTripHotelDtailsView(
          citiesHotel: state.extra as CitiesHotel,
        ),
      ),
      GoRoute(
        path: kpastPublicTripDetailsview,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: kTransitionDuration,
          child: PastPublicTripDetailsView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0), // Slide in from left
                end: Offset.zero, // Slide up to top
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: kActivePublicTripDetailsview,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: kTransitionDuration,
          child: ActivePublicTripDetailsView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0), // Slide in from left
                end: Offset.zero, // Slide up to top
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: kCanceledPublicTripDetailsview,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: kTransitionDuration,
          child: CanceledPublicTripDetailsView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0), // Slide in from left
                end: Offset.zero, // Slide up to top
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: kPointsview,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: kTransitionDuration,
          child: PointsView(
            tripId: state.extra as int,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0), // Slide in from left
                end: Offset.zero, // Slide up to top
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
    ],
  );
}
