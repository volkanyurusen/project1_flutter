import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenConsistedActivityBodyActivityNameArea extends StatelessWidget {
  final AppFunctions _appFunctions = AppFunctions();
  final ChosenActivityAmongConsistedActivityDynamicAttendedByUserState
      chosenState;

  ChosenConsistedActivityBodyActivityNameArea({
    required this.chosenState,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall!;

    return Column(
      children: [
        _createActivityTitleAndDateArea(chosenState, displaySmall),
        const CustomAppSizedBox(height: 9),
        CustomAppDivider(),
        const CustomAppSizedBox(height: 9),
      ],
    );
  }

  /// CREATE ===========================================================================================================
  AppHeader _createActivityTitleAndDateArea(
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserState chosenState,
    TextStyle? displaySmall,
  ) =>
      AppHeader(
        firstWidget: _displayActivityTitle(chosenState, displaySmall),
      );

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayActivityTitle(
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserState chosenState,
    TextStyle? displaySmall,
  ) =>
      AppHeaderText(
        textLabel: _correctActivityTitle(chosenState),
        textStyle: displaySmall,
      );


  /// METHODS ==========================================================================================================
  /// Correct Methods --------------------------------------------------------------------------------------------------
  String _correctActivityTitle(
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserState chosenState,
  ) =>
      _appFunctions
          .setWithoutUnderscore(_findActivityTitle(chosenState))
          .toCapitalized();



  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findActivityTitle(
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserState chosenState,
  ) =>
      chosenState
          .chosenConsistedActivityDynamicWithDistanceList
          .last
          .createdActivityDynamic
          .activityNameDynamic
          .activityTitle;

}
