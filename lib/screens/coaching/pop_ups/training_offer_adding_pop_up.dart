import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/screens/coaching/bodies/zbodies.dart';
import 'package:my_project/widgets/widget.dart';

class TrainingOfferAddingPopUp extends StatelessWidget {
  final AppNumberConstants _appNumberConstants = AppNumberConstants();

  TrainingOfferAddingPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return PopUpBody(
      height: context.height *
          _appNumberConstants.kTrainingRequestAddingDialogRatio,
      children: [
        TrainingOfferAddingPopUpBodyActivityTypeArea(screenWidth: screenWidth),
        TrainingOfferAddingPopUpBodyActivityNameArea(screenWidth: screenWidth),
        const Expanded(child: SizedBox()),
        TrainingOfferAddingPopUpBodyCancelAndOfferArea(
            screenWidth: screenWidth),
      ],
    );
  }
}
