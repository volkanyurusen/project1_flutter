import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/screens/profile/bodies/zbodies.dart';
import 'package:my_project/widgets/widget.dart';

class ActivityPreferencesEditingPopUp extends StatelessWidget {
  final AppNumberConstants _appNumberConstants = AppNumberConstants();

  ActivityPreferencesEditingPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = context.width;

    return PopUpBody(
      height: context.height *
          _appNumberConstants.kPersonalDetailsEditingDialogRatio,
      children: [
        ActivityPreferencesEditingPopUpActivityAreas(screenWidth: screenWidth),
        ActivityPreferencesEditingPopUpActivityCancelAndUpdateButtonArea(),
        const CustomAppSizedBox(),
      ],
    );
  }
}
