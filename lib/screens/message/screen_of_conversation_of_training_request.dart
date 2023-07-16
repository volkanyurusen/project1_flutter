import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/message/bodies/zbodies.dart';
import 'package:my_project/screens/message/local_widgets/zlocal_widget.dart';

import 'zscreens.dart';

class ScreenOfConversationOfTrainingRequest extends StatelessWidget {
  static const String routeName =
      'screen_of_conversation_of_training_request';

  final AppFunctions _appFunctions = AppFunctions();
  final AppDateFormat _appDateFormat = AppDateFormat();

  ScreenOfConversationOfTrainingRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc
        trainingRequestResponseDynamicWithDistanceByTrainingRequestBloc =
        context.read<
            TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc>();
    final GroupedTrainingRequestConversationDynamicByUserCubit
        groupedTrainingRequestConversationDynamicByUserCubit =
        context.read<GroupedTrainingRequestConversationDynamicByUserCubit>();

    final double screenWidth = context.width;

    return
        //
        // WillPopScope(
        //   onWillPop: () async {
        //     _unchooseGroupedTrainingRequestConversation(
        //         groupedTrainingRequestConversationDynamicByUserCubit);
        //     _closeTheScreen(context);
        //     return Future(() => true);
        //   },
        //   child:
        Scaffold(
            appBar: _displayConversationAppBar(
                context,
                trainingRequestResponseDynamicWithDistanceByTrainingRequestBloc,
                groupedTrainingRequestConversationDynamicByUserCubit),
            body: ConversationOfTrainingRequestBody(screenWidth: screenWidth));
    // );
  }

  /// DISPLAY ==========================================================================================================
  ConversationAppBar _displayConversationAppBar(
    BuildContext context,
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc
        trainingRequestResponseDynamicWithDistanceByTrainingRequestBloc,
    GroupedTrainingRequestConversationDynamicByUserCubit
        groupedTrainingRequestConversationDynamicByUserCubit,
  ) =>
      ConversationAppBar(
        onTap: () =>
            _goToChosenTrainingRequestDetailScreenWhileBringingNecessaryBloc(
                context,
                trainingRequestResponseDynamicWithDistanceByTrainingRequestBloc,
                groupedTrainingRequestConversationDynamicByUserCubit),
        imageWidget: _displayActivityImage(
            groupedTrainingRequestConversationDynamicByUserCubit),
        infoTitle: _displayActivityTitle(
            groupedTrainingRequestConversationDynamicByUserCubit),
        infoDetail: _checkWheterThereIsAnyConversation(
                groupedTrainingRequestConversationDynamicByUserCubit)
            ? ''
            : _displayResponsePrices(
                groupedTrainingRequestConversationDynamicByUserCubit),
        date: _displayActivityDate(
            groupedTrainingRequestConversationDynamicByUserCubit),
        dateDetail: _appFunctions.showDayDifference(_findActivityDate(
            groupedTrainingRequestConversationDynamicByUserCubit)),
      );

  AssetImage _displayActivityImage(
    GroupedTrainingRequestConversationDynamicByUserCubit
        groupedTrainingRequestConversationDynamicByUserCubit,
  ) =>
      _findImageUrl(groupedTrainingRequestConversationDynamicByUserCubit);

  String _displayActivityTitle(
    GroupedTrainingRequestConversationDynamicByUserCubit
        groupedTrainingRequestConversationDynamicByUserCubit,
  ) =>
      _appFunctions.setWithoutUnderscore(_findActivityTitle(
          groupedTrainingRequestConversationDynamicByUserCubit));

  String _displayResponsePrices(
          GroupedTrainingRequestConversationDynamicByUserCubit
              groupedTrainingRequestConversationDynamicByUserCubit) =>
      _checkWhetherThereIsOnlyOneConversation(
              groupedTrainingRequestConversationDynamicByUserCubit)
          ? '${_findTheCoachPerLessonPrice(groupedTrainingRequestConversationDynamicByUserCubit)}'
          : '( ${_findTheMinPerLessonPrice(groupedTrainingRequestConversationDynamicByUserCubit)} - ${_findTheMaxPerLessonPrice(groupedTrainingRequestConversationDynamicByUserCubit)} )';

  String _displayActivityDate(
    GroupedTrainingRequestConversationDynamicByUserCubit
        groupedTrainingRequestConversationDynamicByUserCubit,
  ) =>
      _appDateFormat.monthAndDayWithDayName.format(_findActivityDate(
          groupedTrainingRequestConversationDynamicByUserCubit));

  /// METHODS ==========================================================================================================
  void _goToChosenTrainingRequestDetailScreenWhileBringingNecessaryBloc(
    BuildContext context,
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc
        trainingRequestResponseDynamicWithDistanceByTrainingRequestBloc,
    GroupedTrainingRequestConversationDynamicByUserCubit
        groupedTrainingRequestConversationDynamicByUserCubit,
  ) {
    _bringConsistedActivityDynamicsWithDistance(
        trainingRequestResponseDynamicWithDistanceByTrainingRequestBloc,
        groupedTrainingRequestConversationDynamicByUserCubit);
    _goToChosenTrainingRequestDetailScreen(context);
  }

  void _bringConsistedActivityDynamicsWithDistance(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc
        trainingRequestResponseDynamicWithDistanceByTrainingRequestBloc,
    GroupedTrainingRequestConversationDynamicByUserCubit
        groupedTrainingRequestConversationDynamicByUserCubit,
  ) =>
      trainingRequestResponseDynamicWithDistanceByTrainingRequestBloc.add(
          LoadTrainingRequestResponseDynamicWithDistanceByTrainingRequestEvent(
              trainingRequestId: _findTrainingRequestId(
                  groupedTrainingRequestConversationDynamicByUserCubit)));

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWheterThereIsAnyConversation(
    GroupedTrainingRequestConversationDynamicByUserCubit
        groupedTrainingRequestConversationDynamicByUserCubit,
  ) =>
      groupedTrainingRequestConversationDynamicByUserCubit
          .state.groupedTrainingRequestConversationDynamicList.isEmpty;

  bool _checkWhetherThereIsOnlyOneConversation(
    GroupedTrainingRequestConversationDynamicByUserCubit
        groupedTrainingRequestConversationDynamicByUserCubit,
  ) =>
      groupedTrainingRequestConversationDynamicByUserCubit
          .state.groupedTrainingRequestConversationDynamicList.length ==
      1;

  Iterable<int> _checkAllCoachPerLessonPrices(
    GroupedTrainingRequestConversationDynamicByUserCubit
        groupedTrainingRequestConversationDynamicByUserCubit,
  ) =>
      groupedTrainingRequestConversationDynamicByUserCubit
          .state.groupedTrainingRequestConversationDynamicList
          .map((e) =>
              e.trainingRequestResponseDynamic.coachDynamic.perLessonPrice);

  /// Find Methods -----------------------------------------------------------------------------------------------------
  AssetImage _findImageUrl(
    GroupedTrainingRequestConversationDynamicByUserCubit
        groupedTrainingRequestConversationDynamicByUserCubit,
  ) =>
      AssetImage(
          'assets/images/activities/${groupedTrainingRequestConversationDynamicByUserCubit.state.groupedTrainingRequestConversationDynamicList.first.trainingRequestResponseDynamic.trainingRequestDynamic.trainingDetailDynamic.activityNameDynamic.activityTitle.toLowerCase()}.jpg');

  String _findActivityTitle(
    GroupedTrainingRequestConversationDynamicByUserCubit
        groupedTrainingRequestConversationDynamicByUserCubit,
  ) =>
      groupedTrainingRequestConversationDynamicByUserCubit
          .state
          .groupedTrainingRequestConversationDynamicList
          .first
          .trainingRequestResponseDynamic
          .trainingRequestDynamic
          .trainingDetailDynamic
          .activityNameDynamic
          .activityTitle;

  int _findTheCoachPerLessonPrice(
    GroupedTrainingRequestConversationDynamicByUserCubit
        groupedTrainingRequestConversationDynamicByUserCubit,
  ) =>
      groupedTrainingRequestConversationDynamicByUserCubit
          .state
          .groupedTrainingRequestConversationDynamicList
          .last
          .trainingRequestResponseDynamic
          .coachDynamic
          .perLessonPrice;

  int _findTheMinPerLessonPrice(
    GroupedTrainingRequestConversationDynamicByUserCubit
        groupedTrainingRequestConversationDynamicByUserCubit,
  ) =>
      _checkAllCoachPerLessonPrices(
              groupedTrainingRequestConversationDynamicByUserCubit)
          .reduce(min);

  int _findTheMaxPerLessonPrice(
    GroupedTrainingRequestConversationDynamicByUserCubit
        groupedTrainingRequestConversationDynamicByUserCubit,
  ) =>
      _checkAllCoachPerLessonPrices(
              groupedTrainingRequestConversationDynamicByUserCubit)
          .reduce(max);

  DateTime _findActivityDate(
    GroupedTrainingRequestConversationDynamicByUserCubit
        groupedTrainingRequestConversationDynamicByUserCubit,
  ) =>
      groupedTrainingRequestConversationDynamicByUserCubit
          .state
          .groupedTrainingRequestConversationDynamicList
          .first
          .trainingRequestResponseDynamic
          .trainingRequestDynamic
          .createdAt;

  int _findTrainingRequestId(
          GroupedTrainingRequestConversationDynamicByUserCubit
              groupedTrainingRequestConversationDynamicByUserCubit) =>
      groupedTrainingRequestConversationDynamicByUserCubit
          .state
          .groupedTrainingRequestConversationDynamicList
          .first
          .trainingRequestResponseDynamic
          .trainingRequestDynamic
          .trainingRequestId!;

  // /// Unchoose Methods -------------------------------------------------------------------------------------------------
  // void _unchooseGroupedTrainingRequestConversation(
  //   GroupedTrainingRequestConversationDynamicByUserCubit
  //       groupedTrainingRequestConversationDynamicByUserCubit,
  // ) =>
  //     groupedTrainingRequestConversationDynamicByUserCubit
  //         .pressCancelButton();

  /// Screen Method ----------------------------------------------------------------------------------------------------
  void _goToChosenTrainingRequestDetailScreen(
    BuildContext context,
  ) =>
      Navigator.of(context)
          .pushNamed(ScreenOfChosenTrainingRequestDetail.routeName);

  // void _closeTheScreen(BuildContext context) => Navigator.of(context).pop();
}
