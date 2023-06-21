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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.15,
              backgroundImage: NetworkImage(photoPath)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Text(title)
        ],
      ),
    );
  }
}
