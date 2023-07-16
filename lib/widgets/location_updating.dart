import 'package:flutter/material.dart';
import 'package:my_project/screens/profile/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class LocationUpdating extends StatelessWidget {
  const LocationUpdating({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionPopUp(
        titleContent:
            "Any location has not been chosen yet. To choose location, please follow the link",
        action: 'Choose',
        actionVoidCallBack: () {
          _closeThePopUpAndGoToLocationDetailScreen(context);
        },
        cancelVoidCallBack: () {});
  }

  // METHODS ===========================================================================================================
  // Screen Method -----------------------------------------------------------------------------------------------------
  void _closeThePopUpAndGoToLocationDetailScreen(BuildContext context) {
    _closeTheScreen(context);
    _goToUserTypeDetailScreen(context);
  }

  void _closeTheScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _goToUserTypeDetailScreen(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenOfLocationDetails.routeName);
  }
}
