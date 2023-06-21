import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_app/config/app_routes.dart';
import 'package:testing_app/core/dependency_injection.dart';
import 'package:testing_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:testing_app/features/home/presentation/view/home_screen.dart';

void main() {
  initApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => instance<HomeBloc>(),
        child: const HomeScreen()),
      initialRoute: AppRoutes.homeRoute,
      onGenerateRoute: RouteGenerator.getRoute, 
      debugShowCheckedModeBanner: false,
    );
  }
}
