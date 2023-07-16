import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenTrainingRequestDetailBodyActivityNameArea extends StatelessWidget {
  final AppFunctions _appFunctions = AppFunctions();
  final AppDateFormat _appDateFormat = AppDateFormat();

  ChosenTrainingRequestDetailBodyActivityNameArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GroupedTrainingRequestConversationDynamicByUserState groupedState = context
        .read<GroupedTrainingRequestConversationDynamicByUserCubit>()
        .state;
    TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall!;

    return Column(
      children: [
        _createActivityTitleAndDateArea(groupedState, displaySmall),
        const CustomAppSizedBox(height: 9),
        CustomAppDivider(),
        const CustomAppSizedBox(height: 9),
      ],
    );
  }

  /// CREATE ===========================================================================================================
  AppHeader _createActivityTitleAndDateArea(
    GroupedTrainingRequestConversationDynamicByUserState groupedState,
    TextStyle? displaySmall,
  ) =>
      AppHeader(
        firstWidget: _displayActivityTitle(groupedState, displaySmall),
        thirdWidget: _displayActivityDate(groupedState, displaySmall),
      );

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayActivityTitle(
    GroupedTrainingRequestConversationDynamicByUserState groupedState,
    TextStyle? displaySmall,
  ) =>
      AppHeaderText(
        textLabel: _correctActivityTitle(groupedState),
        textStyle: displaySmall,
      );

  AppHeaderText _displayActivityDate(
    GroupedTrainingRequestConversationDynamicByUserState groupedState,
    TextStyle? displaySmall,
  ) =>
      AppHeaderText(
        textLabel: _correctTheActivityDateFormat(groupedState),
        textStyle: displaySmall,
      );

  /// METHODS ==========================================================================================================
  /// Correct Methods --------------------------------------------------------------------------------------------------
  String _correctActivityTitle(
          GroupedTrainingRequestConversationDynamicByUserState groupedState) =>
      _appFunctions
          .setWithoutUnderscore(_findActivityTitle(groupedState))
          .toCapitalized();

  String _correctTheActivityDateFormat(
    GroupedTrainingRequestConversationDynamicByUserState groupedState,
  ) =>
      _appDateFormat.monthAndDayWithDayName
          .format(_findActivityDate(groupedState));

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findActivityTitle(
    GroupedTrainingRequestConversationDynamicByUserState groupedState,
  ) =>
      groupedState
          .groupedTrainingRequestConversationDynamicList
          .last
          .trainingRequestResponseDynamic
          .trainingRequestDynamic
          .trainingDetailDynamic
          .activityNameDynamic
          .activityTitle;

  DateTime _findActivityDate(
    GroupedTrainingRequestConversationDynamicByUserState groupedState,
  ) =>
      groupedState.groupedTrainingRequestConversationDynamicList.last
          .trainingRequestResponseDynamic.trainingRequestDynamic.createdAt;
}
