import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenConsistedActivityBodyCancelAttendanceArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final ChosenActivityAmongConsistedActivityDynamicAttendedByUserState
      chosenState;

  ChosenConsistedActivityBodyCancelAttendanceArea({
    required this.chosenState,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _createLeaveTheActivityArea(context, chosenState),
        const CustomAppSizedBox(height: 18),
      ],
    );
  }

  /// CREATE ===========================================================================================================
  CustomElevatedButton _createLeaveTheActivityArea(
    BuildContext context,
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserState chosenState,
  ) =>
      CustomElevatedButton(
          textlabel: 'Leave The Activity',
          buttonColor: _appColors.buttonDarkColor,
          onPressed: () => _openLeaveTheActivityPopUp(context, chosenState));

  /// DISPLAY ==========================================================================================================

  /// METHODS ==========================================================================================================
  void _openLeaveTheActivityPopUp(
    BuildContext context,
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserState chosenState,
  ) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return ActionPopUp(
              action: 'Leave',
              titleContent: 'Leave The Activity?',
              actionVoidCallBack: () {
                if (kDebugMode) {
                  print(
                      'The activity created by "${chosenState.chosenConsistedActivityDynamicWithDistanceList.last.createdActivityDynamic.host.username}" has been left');
                }
                //
                // context
                //     .read<
                //         ChosenActivityAmongConsistedActivityDynamicAttendedByUserCubit>()
                //     .pressBackButton(chosenState
                //         .chosenConsistedActivityDynamicWithDistanceList
                //         .last);
              },
              cancelVoidCallBack: () {
                //
                // context
                //     .read<
                //         ChosenActivityAmongConsistedActivityDynamicAttendedByUserCubit>()
                //     .pressBackButton(chosenState
                //         .chosenConsistedActivityDynamicWithDistanceList
                //         .last);
              },
              // You are about canceling about the activity created by
            );
          });
}
