import 'package:flutter/material.dart';
import 'package:my_project/screens/profile/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class CoachingTypeUpdating extends StatelessWidget {
  final String informationContent;

  const CoachingTypeUpdating({super.key, required this.informationContent});

  @override
  Widget build(BuildContext context) {
    return ActionPopUp(
        titleContent: informationContent,
        action: 'Update',
        actionVoidCallBack: () {
          _closeThePopUpAndGoToCoachingTypeDetailScreen(context);
        },
        cancelVoidCallBack: () {});
  }

  // METHODS ===========================================================================================================
  // Screen Method -----------------------------------------------------------------------------------------------------
  void _closeThePopUpAndGoToCoachingTypeDetailScreen(BuildContext context) {
    _closeTheScreen(context);
    _goToUserTypeDetailScreen(context);
  }

  void _closeTheScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _goToUserTypeDetailScreen(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenOfCoachingTypeDetails.routeName);
  }
}
