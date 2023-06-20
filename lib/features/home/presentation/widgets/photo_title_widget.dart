import 'package:flutter/material.dart';
import 'package:testing_app/config/app_assets.dart';

class PhotoandTitleWidget extends StatelessWidget {
  String title;
  String photoPath;
  PhotoandTitleWidget({
    super.key,
    required this.title,
    required this.photoPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.15,
            backgroundImage: AssetImage(photoPath)),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        Text(title)
      ],
    );
  }
}
