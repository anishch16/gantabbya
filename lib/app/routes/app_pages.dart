import 'package:get/get.dart';

import '../modules/all_destination/bindings/all_destination_binding.dart';
import '../modules/all_destination/views/all_destination_view.dart';
import '../modules/bottomNav/bindings/bottom_nav_binding.dart';
import '../modules/bottomNav/views/bottom_nav_view.dart';
import '../modules/cost_details/bindings/cost_details_binding.dart';
import '../modules/cost_details/views/cost_details_view.dart';
import '../modules/detail_destination/bindings/detail_destination_binding.dart';
import '../modules/detail_destination/views/detail_destination_view.dart';
import '../modules/estimated_cost/bindings/estimated_cost_binding.dart';
import '../modules/estimated_cost/views/estimated_cost_view.dart';
import '../modules/favorite_trips/bindings/favorite_trips_binding.dart';
import '../modules/favorite_trips/views/favorite_trips_view.dart';
import '../modules/forget_password/bindings/forget_password_binding.dart';
import '../modules/forget_password/views/forget_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/location/bindings/location_binding.dart';
import '../modules/location/views/location_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/set_destination/bindings/set_destination_binding.dart';
import '../modules/set_destination/views/set_destination_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/user_profile/bindings/user_profile_binding.dart';
import '../modules/user_profile/views/user_profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static String initial = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.BOTTOM_NAV,
      page: () => const BottomNavView(),
      binding: BottomNavBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.FAVORITE_TRIPS,
      page: () => const FavoriteTripsView(),
      binding: FavoriteTripsBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.USER_PROFILE,
      page: () => UserProfileView(),
      binding: UserProfileBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.LOCATION,
      page: () => LocationView(),
      binding: LocationBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => const ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.ALL_DESTINATION,
      page: () => const AllDestinationView(),
      binding: AllDestinationBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_DESTINATION,
      page: () => const DetailDestinationView(),
      binding: DetailDestinationBinding(),
    ),
    GetPage(
      name: _Paths.SET_DESTINATION,
      page: () => const SetDestinationView(),
      binding: SetDestinationBinding(),
    ),
    GetPage(
      name: _Paths.COST_DETAILS,
      page: () => const CostDetailsView(),
      binding: CostDetailsBinding(),
    ),
    GetPage(
      name: _Paths.ESTIMATED_COST,
      page: () => const EstimatedCostView(),
      binding: EstimatedCostBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
