import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenTrainingRequestDetailBodyLessonPriceArea extends StatelessWidget {
  const ChosenTrainingRequestDetailBodyLessonPriceArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GroupedTrainingRequestConversationDynamicByUserState groupedState = context
        .read<GroupedTrainingRequestConversationDynamicByUserCubit>()
        .state;
    TextStyle? headline6 = Theme.of(context)
        .textTheme
        .headlineSmall!
        .copyWith(color: AppColors().secondary.withOpacity(0.75));

    return Column(
      children: [
        _createLessonPriceArea(groupedState, headline6),
        const CustomAppSizedBox(),
      ],
    );
  }

  /// CREATE ===========================================================================================================
  AppHeader _createLessonPriceArea(
    GroupedTrainingRequestConversationDynamicByUserState groupedState,
    TextStyle? headline6,
  ) =>
      AppHeader(
          firstWidget: _displayLessonPriceTitle(headline6),
          thirdWidget: _displayLessonPriceDetail(groupedState, headline6));

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayLessonPriceTitle(
    TextStyle? headline6,
  ) =>
      AppHeaderText(
        textLabel: 'Lesson Price Range',
        textStyle: headline6,
      );

  AppHeaderText _displayLessonPriceDetail(
    GroupedTrainingRequestConversationDynamicByUserState groupedState,
    TextStyle? headline6,
  ) =>
      AppHeaderText(
        textLabel: _findLessonPrice(groupedState),
        textStyle: headline6,
      );

  String _displayConversationPrices(
    GroupedTrainingRequestConversationDynamicByUserState groupedState,
  ) =>
      _checkWhetherThereIsOnlyOneConversation(groupedState)
          ? '${_findTheCoachPerLessonPrice(groupedState)}'
          : '${_findTheMinPerLessonPrice(groupedState)} - ${_findTheMaxPerLessonPrice(groupedState)}';

  /// METHOD ===========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWheterThereIsAnyConversation(
    GroupedTrainingRequestConversationDynamicByUserState groupedState,
  ) =>
      groupedState.groupedTrainingRequestConversationDynamicList.isEmpty;

  bool _checkWhetherThereIsOnlyOneConversation(
    GroupedTrainingRequestConversationDynamicByUserState groupedState,
  ) =>
      groupedState.groupedTrainingRequestConversationDynamicList.length == 1;

  Iterable<int> _checkAllCoachPerLessonPrices(
    GroupedTrainingRequestConversationDynamicByUserState groupedState,
  ) =>
      groupedState.groupedTrainingRequestConversationDynamicList.map(
          (e) => e.trainingRequestResponseDynamic.coachDynamic.perLessonPrice);

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findLessonPrice(
    GroupedTrainingRequestConversationDynamicByUserState groupedState,
  ) =>
      _checkWheterThereIsAnyConversation(groupedState)
          ? ''
          : _displayConversationPrices(groupedState);

  int _findTheCoachPerLessonPrice(
    GroupedTrainingRequestConversationDynamicByUserState groupedState,
  ) =>
      groupedState.groupedTrainingRequestConversationDynamicList.last
          .trainingRequestResponseDynamic.coachDynamic.perLessonPrice;

  int _findTheMinPerLessonPrice(
    GroupedTrainingRequestConversationDynamicByUserState groupedState,
  ) =>
      _checkAllCoachPerLessonPrices(groupedState).reduce(min);

  int _findTheMaxPerLessonPrice(
    GroupedTrainingRequestConversationDynamicByUserState groupedState,
  ) =>
      _checkAllCoachPerLessonPrices(groupedState).reduce(max);
}
