part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const BOTTOM_NAV = _Paths.BOTTOM_NAV;
  static const LOGIN = _Paths.LOGIN;
  static const FAVORITE_TRIPS = _Paths.FAVORITE_TRIPS;
  static const USER_PROFILE = _Paths.USER_PROFILE;
  static const SIGNUP = _Paths.SIGNUP;
  static const LOCATION = _Paths.LOCATION;
  static const FORGET_PASSWORD = _Paths.FORGET_PASSWORD;
  static const ALL_DESTINATION = _Paths.ALL_DESTINATION;
  static const DETAIL_DESTINATION = _Paths.DETAIL_DESTINATION;
  static const SET_DESTINATION = _Paths.SET_DESTINATION;
  static const COST_DETAILS = _Paths.COST_DETAILS;
  static const ESTIMATED_COST = _Paths.ESTIMATED_COST;
  static const SPLASH = _Paths.SPLASH;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const BOTTOM_NAV = '/bottom-nav';
  static const LOGIN = '/login';
  static const FAVORITE_TRIPS = '/favorite-trips';
  static const USER_PROFILE = '/user-profile';
  static const SIGNUP = '/signup';
  static const LOCATION = '/location';
  static const FORGET_PASSWORD = '/forget-password';
  static const ALL_DESTINATION = '/all-destination';
  static const DETAIL_DESTINATION = '/detail-destination';
  static const SET_DESTINATION = '/set-destination';
  static const COST_DETAILS = '/cost-details';
  static const ESTIMATED_COST = '/estimated-cost';
  static const SPLASH = '/splash';
}
