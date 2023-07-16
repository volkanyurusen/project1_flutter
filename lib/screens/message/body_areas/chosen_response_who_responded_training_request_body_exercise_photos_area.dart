import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenResponseWhoRespondedTrainingRequestBodyExercisePhotosArea
    extends StatelessWidget {
  const ChosenResponseWhoRespondedTrainingRequestBodyExercisePhotosArea(
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Wrap(
        children: List.generate(
      18,
      (index) => PhotoContainerOfExercise(
        screenHeight: screenHeight / 7,
        screenWidth: (screenWidth - 36) / 3,
        photoUrl: '${'assets/images/coach_exercises/exercise$index'}.jpg',
      ),
    ));
  }
}
