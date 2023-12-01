import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prestmit/utilities/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, _) {
        return MaterialApp(
          title: 'Prestmit',
          debugShowCheckedModeBanner: false,
          routes: RouteHandler.routes,
          initialRoute: RouteHandler.initialRoute,
          onGenerateRoute: RouteHandler.generatedRoute,
        );
      },
    );
  }
}

