import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/message/body_areas/zareas.dart';

import 'local_widgets/zlocal_widget.dart';

class ScreenOfChosenFindACoachMessage extends StatelessWidget {
  static const String routeName = 'screen_of_find_a_coach_message';
  final AppDateFormat _appDateFormat = AppDateFormat();
  final AppFunctions _appFunctions = AppFunctions();

  ScreenOfChosenFindACoachMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChosenFindACoachConversationDynamicByTraineeCubit
        chosenFindACoachConversationDynamicByTraineeCubit =
        context.read<ChosenFindACoachConversationDynamicByTraineeCubit>();
    //
    // final ChosenFindACoachMessageDynamicByTraineeCubit
    //     chosenFindACoachMessageDynamicByTraineeCubit = context
    //         .read<ChosenFindACoachMessageDynamicByTraineeCubit>();

    Set<int?> uniqueSetOfCoachUserId = <int?>{};
    _createSetOfCoachUserId(chosenFindACoachConversationDynamicByTraineeCubit,
        uniqueSetOfCoachUserId);
    //
    // Set<DateTime> uniqueSetOfMessageDate = <DateTime>{};
    // _createSetOfSentMessageDate(
    //     chosenFindACoachMessageDynamicByTraineeCubit,
    //     uniqueSetOfMessageDate);
    final TextStyle bodyLarge = context.textTheme.bodyLarge!;

    return WillPopScope(
      onWillPop: () async {
        context
            .read<FindACoachMessageDynamicByFindACoachConversationBloc>()
            .add(CleanFindACoachMessageDynamicByFindACoachConversation());
        //
        // _unchooseChosenTrainingRequestConversation(
        //     chosenFindACoachConversationDynamicByTraineeCubit);
        // _unchooseMessagesOfChosenTrainingRequestConversationIfExist(
        //     chosenFindACoachMessageDynamicByTraineeCubit);
        // _closeTheScreen(context);
        return Future(() => true);
      },
      child: Scaffold(
        appBar: _displayCoachAppBar(
            chosenFindACoachConversationDynamicByTraineeCubit,
            uniqueSetOfCoachUserId,
            bodyLarge),
        body: const Column(children: [
          ChosenConversationOfFindACoachBodyMessageContentArea(
              // uniqueSetOfMessageDate: uniqueSetOfMessageDate
              ),
        ]),
      ),
    );
  }

  /// DISPLAY ==========================================================================================================
  ConversationAppBar _displayCoachAppBar(
    ChosenFindACoachConversationDynamicByTraineeCubit
        chosenFindACoachConversationDynamicByTraineeCubit,
    Set<int?> uniqueSetOfCoachUserId,
    TextStyle bodyLarge,
  ) =>
      ConversationAppBar(
        onTap: () {},
        imageWidget: _displayCoachPhoto(
            chosenFindACoachConversationDynamicByTraineeCubit),
        infoTitle: _displayCoachUsername(
            chosenFindACoachConversationDynamicByTraineeCubit),
        infoDetail: _displayPerPriceLessonOfCoach(
            chosenFindACoachConversationDynamicByTraineeCubit),
        date: _displayStartDateOfConversation(
            chosenFindACoachConversationDynamicByTraineeCubit),
        dateDetail: _displayDateDifferences(
            chosenFindACoachConversationDynamicByTraineeCubit),
      );

  NetworkImage _displayCoachPhoto(
    ChosenFindACoachConversationDynamicByTraineeCubit
        chosenFindACoachConversationDynamicByTraineeCubit,
  ) =>
      NetworkImage(chosenFindACoachConversationDynamicByTraineeCubit
          .state
          .chosenFindACoachConversationDynamicList
          .last
          .trainingOfferResponseDynamic
          .trainingOfferDynamic
          .coachDynamic
          .userDynamic
          .picUrl);

  String _displayCoachUsername(
    ChosenFindACoachConversationDynamicByTraineeCubit
        chosenFindACoachConversationDynamicByTraineeCubit,
  ) =>
      chosenFindACoachConversationDynamicByTraineeCubit
          .state
          .chosenFindACoachConversationDynamicList
          .last
          .trainingOfferResponseDynamic
          .trainingOfferDynamic
          .coachDynamic
          .userDynamic
          .username;

  String _displayPerPriceLessonOfCoach(
    ChosenFindACoachConversationDynamicByTraineeCubit
        chosenFindACoachConversationDynamicByTraineeCubit,
  ) =>
      chosenFindACoachConversationDynamicByTraineeCubit
          .state
          .chosenFindACoachConversationDynamicList
          .last
          .trainingOfferResponseDynamic
          .trainingOfferDynamic
          .coachDynamic
          .perLessonPrice
          .toString();

  String _displayStartDateOfConversation(
    ChosenFindACoachConversationDynamicByTraineeCubit
        chosenFindACoachConversationDynamicByTraineeCubit,
  ) =>
      _appDateFormat.monthAndDayWithDayName.format(_findStartDateOfConversation(
          chosenFindACoachConversationDynamicByTraineeCubit));

  String _displayDateDifferences(
    ChosenFindACoachConversationDynamicByTraineeCubit
        chosenFindACoachConversationDynamicByTraineeCubit,
  ) =>
      _appFunctions.showDayDifference(_findStartDateOfConversation(
          chosenFindACoachConversationDynamicByTraineeCubit));

  /// METHODS ==========================================================================================================
  void _createSetOfCoachUserId(
    ChosenFindACoachConversationDynamicByTraineeCubit
        chosenFindACoachConversationDynamicByTraineeCubit,
    Set<int?> uniqueSetOfCoachUserId,
  ) {
    for (var element in chosenFindACoachConversationDynamicByTraineeCubit
        .state.chosenFindACoachConversationDynamicList) {
      uniqueSetOfCoachUserId.add(element.trainingOfferResponseDynamic
          .trainingOfferDynamic.coachDynamic.userDynamic.uId);
    }
  }

  //
  // void _createSetOfSentMessageDate(
  //   ChosenFindACoachMessageDynamicByTraineeCubit
  //       chosenFindACoachMessageDynamicByTraineeCubit,
  //   Set<DateTime> uniqueSetOfMessageDate,
  // ) {
  //   for (var element in chosenFindACoachMessageDynamicByTraineeCubit
  //       .state.chosenTrainingRequestMessageDynamicList) {
  //     uniqueSetOfMessageDate.add(DateUtils.dateOnly(element.sentAt));
  //   }
  // }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  DateTime _findStartDateOfConversation(
    ChosenFindACoachConversationDynamicByTraineeCubit
        chosenFindACoachConversationDynamicByTraineeCubit,
  ) =>
      chosenFindACoachConversationDynamicByTraineeCubit
          .state
          .chosenFindACoachConversationDynamicList
          .last
          .trainingOfferResponseDynamic
          .approvedDate!;

  /// Unchoose Methods -------------------------------------------------------------------------------------------------
  //
  //void _unchooseChosenTrainingRequestConversation(
  //   ChosenFindACoachConversationDynamicByTraineeCubit
  //       chosenFindACoachConversationDynamicByTraineeCubit,
  // ) {
  //   if (chosenFindACoachConversationDynamicByTraineeCubit
  //       .state.chosenFindACoachConversationDynamicList.isNotEmpty) {
  //     chosenFindACoachConversationDynamicByTraineeCubit
  //         .pressCancelButton();
  //   }
  // }
  //
  // void _unchooseMessagesOfChosenTrainingRequestConversationIfExist(
  //     ChosenFindACoachMessageDynamicByTraineeCubit
  //         chosenFindACoachMessageDynamicByTraineeCubit) {
  //   if (chosenFindACoachMessageDynamicByTraineeCubit
  //       .state.chosenTrainingRequestMessageDynamicList.isNotEmpty) {
  //     chosenFindACoachMessageDynamicByTraineeCubit
  //         .pressCancelButton();
  //   }
  // }

  /// Screen Methods ---------------------------------------------------------------------------------------------------
  //
  // void _closeTheScreen(BuildContext context) => Navigator.of(context).pop();
}
