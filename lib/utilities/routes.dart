import 'package:flutter/material.dart';

class RouteHandler {
  static String initialRoute = '';

  static Map<String, Widget Function(BuildContext)> routes = {

  };

  static Route<dynamic>? generatedRoute(RouteSettings route) {
    switch (route.name) {
      default:
        return null;
    }
  }
}

