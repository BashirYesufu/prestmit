import 'package:flutter/material.dart';
import 'package:prestmit/UI/features/dashboard/landing.dart';
import 'package:prestmit/UI/features/splash/splash.dart';
import '../UI/features/dashboard/tabs/home.dart';

class RouteHandler {
  static String initialRoute = Splash.routeName;

  static Map<String, Widget Function(BuildContext)> routes = {
    Splash.routeName: (context) => Splash(),
    Home.routeName: (context) => Home(),
    LandingTab.routeName: (context) => LandingTab(),
  };

  static Route<dynamic>? generatedRoute(RouteSettings route) {
    switch (route.name) {
      default:
        return null;
    }
  }
}

