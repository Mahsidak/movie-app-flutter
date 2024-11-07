part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const LOGIN = _Paths.LOGIN;
  static const MAIN = _Paths.MAIN;
  static const HOME = _Paths.HOME;
  static const FAVORITE = _Paths.FAVORITE;
  static const SETTINGS = _Paths.SETTINGS;
  static const OTHER = _Paths.OTHER;
  static const PROJECT_DETAILS = _Paths.PROJECT_DETAILS;
}

abstract class _Paths {
  static const LOGIN = '/login';
  static const MAIN = '/main';
  static const HOME = '/home';
  static const FAVORITE = '/favorite';
  static const SETTINGS = '/settings';
  static const OTHER = '/other';
  static const PROJECT_DETAILS = '/project-details';
}
