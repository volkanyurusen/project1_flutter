import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenFindACoachDetailBodyLessonPriceArea extends StatelessWidget {
  const ChosenFindACoachDetailBodyLessonPriceArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GroupedFindACoachConversationDynamicByTraineeState groupedState = context
        .read<GroupedFindACoachConversationDynamicByTraineeCubit>()
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
    GroupedFindACoachConversationDynamicByTraineeState groupedState,
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
    GroupedFindACoachConversationDynamicByTraineeState groupedState,
    TextStyle? headline6,
  ) =>
      AppHeaderText(
        textLabel: _findLessonPrice(groupedState),
        textStyle: headline6,
      );

  String _displayConversationPrices(
    GroupedFindACoachConversationDynamicByTraineeState groupedState,
  ) =>
      _checkWhetherThereIsOnlyOneConversation(groupedState)
          ? '${_findTheCoachPerLessonPrice(groupedState)}'
          : '${_findTheMinPerLessonPrice(groupedState)} - ${_findTheMaxPerLessonPrice(groupedState)}';

  /// METHOD ===========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWheterThereIsAnyConversation(
    GroupedFindACoachConversationDynamicByTraineeState groupedState,
  ) =>
      groupedState.groupedFindACoachConversationDynamicList.isEmpty;

  bool _checkWhetherThereIsOnlyOneConversation(
    GroupedFindACoachConversationDynamicByTraineeState groupedState,
  ) =>
      groupedState.groupedFindACoachConversationDynamicList.length == 1;

  Iterable<int> _checkAllCoachPerLessonPrices(
    GroupedFindACoachConversationDynamicByTraineeState groupedState,
  ) =>
      groupedState.groupedFindACoachConversationDynamicList.map((e) => e
          .trainingOfferResponseDynamic
          .trainingOfferDynamic
          .coachDynamic
          .perLessonPrice);

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findLessonPrice(
    GroupedFindACoachConversationDynamicByTraineeState groupedState,
  ) =>
      _checkWheterThereIsAnyConversation(groupedState)
          ? ''
          : _displayConversationPrices(groupedState);

  int _findTheCoachPerLessonPrice(
    GroupedFindACoachConversationDynamicByTraineeState groupedState,
  ) =>
      groupedState
          .groupedFindACoachConversationDynamicList
          .last
          .trainingOfferResponseDynamic
          .trainingOfferDynamic
          .coachDynamic
          .perLessonPrice;

  int _findTheMinPerLessonPrice(
    GroupedFindACoachConversationDynamicByTraineeState groupedState,
  ) =>
      _checkAllCoachPerLessonPrices(groupedState).reduce(min);

  int _findTheMaxPerLessonPrice(
    GroupedFindACoachConversationDynamicByTraineeState groupedState,
  ) =>
      _checkAllCoachPerLessonPrices(groupedState).reduce(max);
}
