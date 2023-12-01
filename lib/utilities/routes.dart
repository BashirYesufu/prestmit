import 'package:flutter/material.dart';
import 'package:prestmit/UI/features/dashboard/landing.dart';
import 'package:prestmit/UI/features/splash/splash.dart';
import 'package:prestmit/UI/features/tracking/tracking_details.dart';
import '../UI/features/auth/auth.dart';
import '../UI/features/dashboard/tabs/home.dart';

class RouteHandler {
  static String initialRoute = Splash.routeName;

  static Map<String, Widget Function(BuildContext)> routes = {
    Splash.routeName: (context) => Splash(),
    Auth.routeName: (context) => Auth(),
    Home.routeName: (context) => Home(),
    LandingTab.routeName: (context) => LandingTab(),
    TrackingDetails.routeName: (context) => TrackingDetails(),
  };

  static Route<dynamic>? generatedRoute(RouteSettings route) {
    switch (route.name) {
      default:
        return null;
    }
  }
}

