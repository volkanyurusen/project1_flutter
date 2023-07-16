import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenActivityDetailBodyActivityNameArea extends StatelessWidget {
  final AppFunctions _appFunctions = AppFunctions();
  final AppDateFormat _appDateFormat = AppDateFormat();

  ChosenActivityDetailBodyActivityNameArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChosenActivityConversationDynamicByUserState chosenState =
        context.read<ChosenActivityConversationDynamicByUserCubit>().state;
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
    ChosenActivityConversationDynamicByUserState chosenState,
    TextStyle? displaySmall,
  ) =>
      AppHeader(
        firstWidget: _displayActivityTitle(chosenState, displaySmall),
        thirdWidget: _displayActivityDate(chosenState, displaySmall),
      );

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayActivityTitle(
    ChosenActivityConversationDynamicByUserState chosenState,
    TextStyle? displaySmall,
  ) =>
      AppHeaderText(
        textLabel: _correctActivityTitle(chosenState),
        textStyle: displaySmall,
      );

  AppHeaderText _displayActivityDate(
    ChosenActivityConversationDynamicByUserState chosenState,
    TextStyle? displaySmall,
  ) =>
      AppHeaderText(
        textLabel: _correctTheActivityDateFormat(chosenState),
        textStyle: displaySmall,
      );

  /// METHODS ==========================================================================================================
  /// Correct Methods --------------------------------------------------------------------------------------------------
  String _correctActivityTitle(
          ChosenActivityConversationDynamicByUserState chosenState) =>
      _appFunctions
          .setWithoutUnderscore(_findActivityTitle(chosenState))
          .toCapitalized();

  String _correctTheActivityDateFormat(
    ChosenActivityConversationDynamicByUserState chosenState,
  ) =>
      _appDateFormat.monthAndDayWithDayName
          .format(_findActivityDate(chosenState));

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findActivityTitle(
    ChosenActivityConversationDynamicByUserState chosenState,
  ) =>
      chosenState
          .chosenActivityConversationDynamicList
          .last
          .consistedActivityDynamic
          .createdActivityDynamic
          .activityNameDynamic
          .activityTitle;

  DateTime _findActivityDate(
    ChosenActivityConversationDynamicByUserState chosenState,
  ) =>
      chosenState.chosenActivityConversationDynamicList.last
          .consistedActivityDynamic.createdActivityDynamic.createdAt;
}
