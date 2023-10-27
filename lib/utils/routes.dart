// ignore_for_file: constant_identifier_names

abstract class AppRoute {
  static const DESKTOP_PRESENTATION = '/';
  static const HOME_DESKTOP = '/desktop';
  static const MOBILE_PRESENTATION = '/';
  static const MOBILE_HOME = '/mobile';
  static const MOBILE_LOGIN = '/mobile/login';
  static const MOBILE_REGISTER = '/mobile/register';
  static const MOBILE_SEARCH = '/mobile/seach';

  static List<String> get navigatorRoutes =>
      [MOBILE_HOME, '1', MOBILE_SEARCH, '2'];
}
