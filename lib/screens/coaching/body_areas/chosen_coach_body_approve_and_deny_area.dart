import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/coaching/pop_ups/zpop_ups.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenCoachBodyApproveAndDenyArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppTextConstants _appTextConstants = AppTextConstants();

  final ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
      chosenResponseAmongThoseWhoRespondedTrainingRequestCubit;
  final double screenWidth;

  ChosenCoachBodyApproveAndDenyArea({
    required this.chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppSizedBox(),
        _createStartConversationAndDenyRequestArea(context),
        const CustomAppSizedBox(height: 18),
      ],
    );
  }

  /// CREATE ===========================================================================================================
  CustomRow _createStartConversationAndDenyRequestArea(BuildContext context) =>
      CustomRow(
        mainAxisSize: MainAxisSize.max,
        children: [
          _displayDenyButton(context),
          _displayApproveButton(context),
        ],
      );

  /// DENY BUTTON ======================================================================================================
  /// DISPLAY ==========================================================================================================
  CustomElevatedButton _displayDenyButton(BuildContext context) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.deny,
          elevatedButtonWidth: screenWidth * 0.35,
          buttonColor: _appColors.buttonDarkColor,
          onPressed: _checkWhetherUserRequestIsDenied()
              ? null
              : () {
                  _displayDenyTheAttendeePopUp(context);
                });

  /// METHODS ==========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherUserRequestIsDenied() =>
      chosenResponseAmongThoseWhoRespondedTrainingRequestCubit
          .state
          .chosenTrainingRequestResponseDynamicWithDistanceList
          .last
          .processDetailDynamic
          .processName ==
      'Denied';

  // DENY THE ATTENDEE ===============================================================================================
  // DISPLAY ===========================================================================================================
  void _displayDenyTheAttendeePopUp(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return DenyCoachPopUp(
              chosenResponseAmongThoseWhoRespondedTrainingRequestCubit:
                  chosenResponseAmongThoseWhoRespondedTrainingRequestCubit);
          // _createDenyPopUp(context);
        });
  }

  // APPROVE BUTTON ====================================================================================================
  // DISPLAY ===========================================================================================================
  CustomElevatedButton _displayApproveButton(BuildContext context) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.approve,
          elevatedButtonWidth: screenWidth * 0.35,
          buttonColor: _appColors.secondary,
          onPressed: _checkWhetherUserRequestIsApproved()
              ? null
              : () {
                  _displayApproveTheAttendeePopUp(context);
                });

  /// METHODS ==========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherUserRequestIsApproved() =>
      chosenResponseAmongThoseWhoRespondedTrainingRequestCubit
          .state
          .chosenTrainingRequestResponseDynamicWithDistanceList
          .last
          .processDetailDynamic
          .processName ==
      'Approved';

  // APPROVE THE ATTENDEE ==============================================================================================
  // DISPLAY ===========================================================================================================
  void _displayApproveTheAttendeePopUp(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return ApproveCoachPopUp(
              chosenResponseAmongThoseWhoRespondedTrainingRequestCubit:
                  chosenResponseAmongThoseWhoRespondedTrainingRequestCubit);
          // _createApprovePopUp(context);
        });
  }

  // METHODS ===========================================================================================================
}
