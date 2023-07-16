import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenFindACoachDetailBodyActivityNameArea extends StatelessWidget {
  final AppFunctions _appFunctions = AppFunctions();
  final AppDateFormat _appDateFormat = AppDateFormat();

  ChosenFindACoachDetailBodyActivityNameArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GroupedFindACoachConversationDynamicByTraineeState groupedState = context
        .read<GroupedFindACoachConversationDynamicByTraineeCubit>()
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
    GroupedFindACoachConversationDynamicByTraineeState groupedState,
    TextStyle? displaySmall,
  ) =>
      AppHeader(
        firstWidget: _displayActivityTitle(groupedState, displaySmall),
        thirdWidget: _displayActivityDate(groupedState, displaySmall),
      );

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayActivityTitle(
    GroupedFindACoachConversationDynamicByTraineeState groupedState,
    TextStyle? displaySmall,
  ) =>
      AppHeaderText(
        textLabel: _correctActivityTitle(groupedState),
        textStyle: displaySmall,
      );

  AppHeaderText _displayActivityDate(
    GroupedFindACoachConversationDynamicByTraineeState groupedState,
    TextStyle? displaySmall,
  ) =>
      AppHeaderText(
        textLabel: _correctTheActivityDateFormat(groupedState),
        textStyle: displaySmall,
      );

  /// METHODS ==========================================================================================================
  /// Correct Methods --------------------------------------------------------------------------------------------------
  String _correctActivityTitle(
          GroupedFindACoachConversationDynamicByTraineeState groupedState) =>
      _appFunctions
          .setWithoutUnderscore(_findActivityTitle(groupedState))
          .toCapitalized();

  String _correctTheActivityDateFormat(
    GroupedFindACoachConversationDynamicByTraineeState groupedState,
  ) =>
      _appDateFormat.monthAndDayWithDayName
          .format(_findActivityDate(groupedState));

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findActivityTitle(
    GroupedFindACoachConversationDynamicByTraineeState groupedState,
  ) =>
      groupedState
          .groupedFindACoachConversationDynamicList
          .last
          .trainingOfferResponseDynamic
          .trainingOfferDynamic
          .trainingDetailDynamic
          .activityNameDynamic
          .activityTitle;

  DateTime _findActivityDate(
    GroupedFindACoachConversationDynamicByTraineeState groupedState,
  ) =>
      groupedState.groupedFindACoachConversationDynamicList.last
          .trainingOfferResponseDynamic.trainingOfferDynamic.createdAt;
}
