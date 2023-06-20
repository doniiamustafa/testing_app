import 'package:flutter/material.dart';
import 'package:testing_app/config/app_assets.dart';
import 'package:testing_app/config/app_strings.dart';
import 'package:testing_app/features/home/presentation/widgets/photo_title_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  String image = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 18),
          child: Column(
            children: [
              const Text(
                AppStrings.homeScreen,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PhotoandTitleWidget(
                      title: "data", photoPath: AppAssets.profilePic),
                  PhotoandTitleWidget(
                      title: "data", photoPath: AppAssets.profilePic),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
