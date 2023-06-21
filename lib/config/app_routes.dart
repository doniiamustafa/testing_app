import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_app/core/dependency_injection.dart';
import 'package:testing_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:testing_app/features/home/presentation/view/home_screen.dart';

class AppRoutes {
  static const String homeRoute = "/home";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        initHome();
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => instance<HomeBloc>(),
                child: const HomeScreen()));
      default:
        initHome();
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => instance<HomeBloc>(),
                child: const HomeScreen()));
    }
  }
}
