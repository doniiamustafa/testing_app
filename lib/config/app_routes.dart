import 'package:flutter/material.dart';
import 'package:testing_app/features/home/presentation/view/home_screen.dart';

class AppRoutes {
  static const String homeRoute = "/home";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return MaterialPageRoute(builder: (_) =>  HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) =>  HomeScreen());
    }
  }
}
