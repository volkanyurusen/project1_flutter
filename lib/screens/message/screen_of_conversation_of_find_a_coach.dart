import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/message/bodies/zbodies.dart';
import 'package:my_project/screens/message/local_widgets/zlocal_widget.dart';

import 'zscreens.dart';

class ScreenOfConversationOfFindACoach extends StatelessWidget {
  static const String routeName = 'screen_of_conversation_of_find_a_coach';

  final AppFunctions _appFunctions = AppFunctions();
  final AppDateFormat _appDateFormat = AppDateFormat();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();

  ScreenOfConversationOfFindACoach({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc
        trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc =
        context.read<
            TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc>();
    final GroupedFindACoachConversationDynamicByTraineeCubit
        groupedFindACoachConversationDynamicByTraineeCubit =
        context.read<GroupedFindACoachConversationDynamicByTraineeCubit>();

    final double screenWidth = context.width;

    return
        //
        // WillPopScope(
        //   onWillPop: () async {
        //     _unchooseGroupedFindACoachConversation(
        //         groupedFindACoachConversationDynamicByTraineeCubit);
        //     _closeTheScreen(context);
        //     return Future(() => true);
        //   },
        //   child:
        Scaffold(
            appBar: _displayConversationAppBar(
                context,
                trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
                groupedFindACoachConversationDynamicByTraineeCubit),
            body: ConversationOfFindACoachBody(screenWidth: screenWidth));
    // );
  }

  /// DISPLAY ==========================================================================================================
  ConversationAppBar _displayConversationAppBar(
    BuildContext context,
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc
        trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
    GroupedFindACoachConversationDynamicByTraineeCubit
        groupedFindACoachConversationDynamicByTraineeCubit,
  ) =>
      ConversationAppBar(
        onTap: () => _goToChosenFindACoachDetailScreenWhileBringingNecessaryBloc(
            context,
            trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
            groupedFindACoachConversationDynamicByTraineeCubit),
        imageWidget: _displayActivityImage(
            groupedFindACoachConversationDynamicByTraineeCubit),
        infoTitle: _displayActivityTitle(
            groupedFindACoachConversationDynamicByTraineeCubit),
        infoDetail: _checkWheterThereIsAnyConversation(
                groupedFindACoachConversationDynamicByTraineeCubit)
            ? ''
            : _displayResponsePrices(
                groupedFindACoachConversationDynamicByTraineeCubit),
        date: _displayActivityDate(
            groupedFindACoachConversationDynamicByTraineeCubit),
        dateDetail: _appFunctions.showDayDifference(_findActivityDate(
            groupedFindACoachConversationDynamicByTraineeCubit)),
      );

  AssetImage _displayActivityImage(
    GroupedFindACoachConversationDynamicByTraineeCubit
        groupedFindACoachConversationDynamicByTraineeCubit,
  ) =>
      _findImageUrl(groupedFindACoachConversationDynamicByTraineeCubit);

  String _displayActivityTitle(
    GroupedFindACoachConversationDynamicByTraineeCubit
        groupedFindACoachConversationDynamicByTraineeCubit,
  ) =>
      _appFunctions.setWithoutUnderscore(_findActivityTitle(
          groupedFindACoachConversationDynamicByTraineeCubit));

  String _displayResponsePrices(
          GroupedFindACoachConversationDynamicByTraineeCubit
              groupedFindACoachConversationDynamicByTraineeCubit) =>
      _checkWhetherThereIsOnlyOneConversation(
              groupedFindACoachConversationDynamicByTraineeCubit)
          ? '${_findTheCoachPerLessonPrice(groupedFindACoachConversationDynamicByTraineeCubit)}'
          : '( ${_findTheMinPerLessonPrice(groupedFindACoachConversationDynamicByTraineeCubit)} - ${_findTheMaxPerLessonPrice(groupedFindACoachConversationDynamicByTraineeCubit)} )';

  String _displayActivityDate(
    GroupedFindACoachConversationDynamicByTraineeCubit
        groupedFindACoachConversationDynamicByTraineeCubit,
  ) =>
      _appDateFormat.monthAndDayWithDayName.format(_findActivityDate(
          groupedFindACoachConversationDynamicByTraineeCubit));

  /// METHODS ==========================================================================================================
  void _goToChosenFindACoachDetailScreenWhileBringingNecessaryBloc(
    BuildContext context,
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc
        trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
    GroupedFindACoachConversationDynamicByTraineeCubit
        groupedFindACoachConversationDynamicByTraineeCubit,
  ) {
    _bringConsistedActivityDynamicsWithDistance(
        trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
        groupedFindACoachConversationDynamicByTraineeCubit);
    _goToChosenFindACoachDetailScreen(context);
  }

  void _bringConsistedActivityDynamicsWithDistance(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc
        trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
    GroupedFindACoachConversationDynamicByTraineeCubit
        groupedFindACoachConversationDynamicByTraineeCubit,
  ) =>
      trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc.add(
          LoadTrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeEvent(
              traineeId: _appNumberConstants.appUserId,
              activityNameId: _findActivityNameId(
                  groupedFindACoachConversationDynamicByTraineeCubit)));

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWheterThereIsAnyConversation(
    GroupedFindACoachConversationDynamicByTraineeCubit
        groupedFindACoachConversationDynamicByTraineeCubit,
  ) =>
      groupedFindACoachConversationDynamicByTraineeCubit
          .state.groupedFindACoachConversationDynamicList.isEmpty;

  bool _checkWhetherThereIsOnlyOneConversation(
    GroupedFindACoachConversationDynamicByTraineeCubit
        groupedFindACoachConversationDynamicByTraineeCubit,
  ) =>
      groupedFindACoachConversationDynamicByTraineeCubit
          .state.groupedFindACoachConversationDynamicList.length ==
      1;

  Iterable<int> _checkAllCoachPerLessonPrices(
    GroupedFindACoachConversationDynamicByTraineeCubit
        groupedFindACoachConversationDynamicByTraineeCubit,
  ) =>
      groupedFindACoachConversationDynamicByTraineeCubit
          .state.groupedFindACoachConversationDynamicList
          .map((e) => e.trainingOfferResponseDynamic.trainingOfferDynamic
              .coachDynamic.perLessonPrice);

  /// Find Methods -----------------------------------------------------------------------------------------------------
  AssetImage _findImageUrl(
    GroupedFindACoachConversationDynamicByTraineeCubit
        groupedFindACoachConversationDynamicByTraineeCubit,
  ) =>
      AssetImage(
          'assets/images/activities/${groupedFindACoachConversationDynamicByTraineeCubit.state.groupedFindACoachConversationDynamicList.first.trainingOfferResponseDynamic.trainingOfferDynamic.trainingDetailDynamic.activityNameDynamic.activityTitle.toLowerCase()}.jpg');

  String _findActivityTitle(
    GroupedFindACoachConversationDynamicByTraineeCubit
        groupedFindACoachConversationDynamicByTraineeCubit,
  ) =>
      groupedFindACoachConversationDynamicByTraineeCubit
          .state
          .groupedFindACoachConversationDynamicList
          .first
          .trainingOfferResponseDynamic
          .trainingOfferDynamic
          .trainingDetailDynamic
          .activityNameDynamic
          .activityTitle;

  int _findTheCoachPerLessonPrice(
    GroupedFindACoachConversationDynamicByTraineeCubit
        groupedFindACoachConversationDynamicByTraineeCubit,
  ) =>
      groupedFindACoachConversationDynamicByTraineeCubit
          .state
          .groupedFindACoachConversationDynamicList
          .last
          .trainingOfferResponseDynamic
          .trainingOfferDynamic
          .coachDynamic
          .perLessonPrice;

  int _findTheMinPerLessonPrice(
    GroupedFindACoachConversationDynamicByTraineeCubit
        groupedFindACoachConversationDynamicByTraineeCubit,
  ) =>
      _checkAllCoachPerLessonPrices(
              groupedFindACoachConversationDynamicByTraineeCubit)
          .reduce(min);

  int _findTheMaxPerLessonPrice(
    GroupedFindACoachConversationDynamicByTraineeCubit
        groupedFindACoachConversationDynamicByTraineeCubit,
  ) =>
      _checkAllCoachPerLessonPrices(
              groupedFindACoachConversationDynamicByTraineeCubit)
          .reduce(max);

  DateTime _findActivityDate(
    GroupedFindACoachConversationDynamicByTraineeCubit
        groupedFindACoachConversationDynamicByTraineeCubit,
  ) =>
      groupedFindACoachConversationDynamicByTraineeCubit
          .state
          .groupedFindACoachConversationDynamicList
          .first
          .trainingOfferResponseDynamic
          .trainingOfferDynamic
          .createdAt;

  int _findActivityNameId(
          GroupedFindACoachConversationDynamicByTraineeCubit
              groupedFindACoachConversationDynamicByTraineeCubit) =>
      groupedFindACoachConversationDynamicByTraineeCubit
          .state
          .groupedFindACoachConversationDynamicList
          .first
          .trainingOfferResponseDynamic
          .trainingOfferDynamic
          .trainingDetailDynamic
          .activityNameDynamic
          .activityNameId!;

  // /// Unchoose Methods -------------------------------------------------------------------------------------------------
  // void _unchooseGroupedFindACoachConversation(
  //   GroupedFindACoachConversationDynamicByTraineeCubit
  //       groupedFindACoachConversationDynamicByTraineeCubit,
  // ) =>
  //     groupedFindACoachConversationDynamicByTraineeCubit
  //         .pressCancelButton();

  /// Screen Method ----------------------------------------------------------------------------------------------------
  void _goToChosenFindACoachDetailScreen(
    BuildContext context,
  ) =>
      Navigator.of(context)
          .pushNamed(ScreenOfChosenFindACoachDetail.routeName);

  // void _closeTheScreen(BuildContext context) => Navigator.of(context).pop();
}
