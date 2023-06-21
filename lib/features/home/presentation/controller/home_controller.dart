import 'package:testing_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:testing_app/features/home/presentation/bloc/home_events.dart';

class HomeController {
  final HomeBloc homeBloc;
  HomeController({required this.homeBloc});

  void getData() {
    homeBloc.add(GetHomeDataEvent());
  }
}
