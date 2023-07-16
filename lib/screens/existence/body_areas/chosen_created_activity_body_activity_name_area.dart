import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenCreatedActivityBodyActivityNameArea extends StatelessWidget {
  final AppFunctions _appFunctions = AppFunctions();
  final ChosenActivityAmongCreatedActivityDynamicCreatedByUserState chosenState;

  ChosenCreatedActivityBodyActivityNameArea({
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
    ChosenActivityAmongCreatedActivityDynamicCreatedByUserState chosenState,
    TextStyle? displaySmall,
  ) =>
      AppHeader(
        firstWidget: _displayActivityTitle(chosenState, displaySmall),
      );

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayActivityTitle(
    ChosenActivityAmongCreatedActivityDynamicCreatedByUserState chosenState,
    TextStyle? displaySmall,
  ) =>
      AppHeaderText(
        textLabel: _correctActivityTitle(chosenState),
        textStyle: displaySmall,
      );

  /// METHODS ==========================================================================================================
  /// Correct Methods --------------------------------------------------------------------------------------------------
  String _correctActivityTitle(
    ChosenActivityAmongCreatedActivityDynamicCreatedByUserState chosenState,
  ) =>
      _appFunctions
          .setWithoutUnderscore(_findActivityTitle(chosenState))
          .toCapitalized();


  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findActivityTitle(
    ChosenActivityAmongCreatedActivityDynamicCreatedByUserState chosenState,
  ) =>
      chosenState.chosenCreatedActivityDynamicWithDistanceList.last
          .activityNameDynamic.activityTitle;

}
