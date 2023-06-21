import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:testing_app/config/app_assets.dart';
import 'package:testing_app/config/app_strings.dart';
import 'package:testing_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:testing_app/features/home/presentation/bloc/home_states.dart';
import 'package:testing_app/features/home/presentation/controller/home_controller.dart';
import 'package:testing_app/features/home/presentation/widgets/photo_title_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String image = "";

  late final HomeController homeController;
  @override
  void initState() {
    super.initState();
    homeController = HomeController(homeBloc: context.read<HomeBloc>());
    homeController.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
          child: Column(
            children: [
              const Text(
                AppStrings.homeScreen,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              BlocConsumer<HomeBloc, HomeStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    log(state.toString());
                    if (state is GetDataSuccessState) {
                      return ListView.builder(
                        itemCount: state.data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => PhotoandTitleWidget(
                            title: state.data[index]["title"],
                            photoPath: state.data[index]["url"]),
                      );
                    } else if (state is GetDataLoadingState) {
                      return const Center(
                        heightFactor: 14.5,
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Container();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
