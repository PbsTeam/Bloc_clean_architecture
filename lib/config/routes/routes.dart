import 'package:flutter/material.dart';
import '../../presentation/views/home/home_screen.dart';
import '../../presentation/views/login/login_screen.dart';
import '../../presentation/views/splash/splash_screen.dart';
import 'routes_names.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
