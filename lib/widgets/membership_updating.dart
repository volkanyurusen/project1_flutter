import 'package:flutter/material.dart';
import 'package:my_project/screens/profile/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class MembershipUpdating extends StatelessWidget {
  final String informationContent;

  const MembershipUpdating({super.key, required this.informationContent});

  @override
  Widget build(BuildContext context) {
    return ActionPopUp(
        titleContent: informationContent,
        action: 'Update',
        actionVoidCallBack: () {
          _closeThePopUpAndGoToUserTypeDetailScreen(context);
        },
        cancelVoidCallBack: () {});
  }

  // METHODS ===========================================================================================================
  // Screen Method -----------------------------------------------------------------------------------------------------
  void _closeThePopUpAndGoToUserTypeDetailScreen(BuildContext context) {
    _closeTheScreen(context);
    _goToUserTypeDetailScreen(context);
  }

  void _closeTheScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _goToUserTypeDetailScreen(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenOfUserTypeDetails.routeName);
  }
}
