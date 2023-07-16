import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/screens/coaching/bodies/zbodies.dart';
import 'package:my_project/widgets/widget.dart';

class TrainingRequestAddingPopUp extends StatelessWidget {
  final AppNumberConstants _appNumberConstants = AppNumberConstants();

  TrainingRequestAddingPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.width;

    return PopUpBody(
      height: context.height *
          _appNumberConstants.kTrainingRequestAddingDialogRatio,
      children: [
        TrainingRequestAddingPopUpBodyActivityTypeArea(
            screenWidth: screenWidth),
        TrainingRequestAddingPopUpBodyActivityNameArea(
            screenWidth: screenWidth),
        const Expanded(child: SizedBox()),
        TrainingRequestAddingPopUpBodyCancelAndRequestArea(
            screenWidth: screenWidth),
      ],
    );
  }
}
