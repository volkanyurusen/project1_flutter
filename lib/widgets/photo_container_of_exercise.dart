import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';

class PhotoContainerOfExercise extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final double screenHeight;
  final double screenWidth;
  final String photoUrl;

  PhotoContainerOfExercise({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.photoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: _appColors.unselectedContainerColor),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            photoUrl,
          ),
        ),
      ),
    );
  }
}
