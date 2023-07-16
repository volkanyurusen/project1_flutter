import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/message/body_areas/zareas.dart';

import 'local_widgets/zlocal_widget.dart';

class ScreenOfChosenTrainingRequestMessage extends StatelessWidget {
  static const String routeName = 'screen_of_training_request_message';
  final AppDateFormat _appDateFormat = AppDateFormat();
  final AppFunctions _appFunctions = AppFunctions();

  ScreenOfChosenTrainingRequestMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChosenTrainingRequestConversationDynamicByUserCubit
        chosenTrainingRequestConversationDynamicByUserCubit =
        context.read<ChosenTrainingRequestConversationDynamicByUserCubit>();
    //
    // final ChosenTrainingRequestMessageDynamicByUserCubit
    //     chosenTrainingRequestMessageDynamicByUserCubit = context
    //         .read<ChosenTrainingRequestMessageDynamicByUserCubit>();

    Set<int?> uniqueSetOfCoachUserId = <int?>{};
    _createSetOfCoachUserId(chosenTrainingRequestConversationDynamicByUserCubit,
        uniqueSetOfCoachUserId);
    //
    // Set<DateTime> uniqueSetOfMessageDate = <DateTime>{};
    // _createSetOfSentMessageDate(
    //     chosenTrainingRequestMessageDynamicByUserCubit,
    //     uniqueSetOfMessageDate);
    final TextStyle bodyLarge = context.textTheme.bodyLarge!;

    return WillPopScope(
      onWillPop: () async {
        context
            .read<
                TrainingRequestMessageDynamicByTrainingRequestConversationBloc>()
            .add(
                CleanTrainingRequestMessageDynamicByTrainingRequestConversation());
        //
        // _unchooseChosenTrainingRequestConversation(
        //     chosenTrainingRequestConversationDynamicByUserCubit);
        // _unchooseMessagesOfChosenTrainingRequestConversationIfExist(
        //     chosenTrainingRequestMessageDynamicByUserCubit);
        // _closeTheScreen(context);
        return Future(() => true);
      },
      child: Scaffold(
        appBar: _displayCoachAppBar(
            chosenTrainingRequestConversationDynamicByUserCubit,
            uniqueSetOfCoachUserId,
            bodyLarge),
        body: const Column(children: [
          ChosenConversationOfTrainingRequestBodyMessageContentArea(
              // uniqueSetOfMessageDate: uniqueSetOfMessageDate
              ),
        ]),
      ),
    );
  }

  /// DISPLAY ==========================================================================================================
  ConversationAppBar _displayCoachAppBar(
    ChosenTrainingRequestConversationDynamicByUserCubit
        chosenTrainingRequestConversationDynamicByUserCubit,
    Set<int?> uniqueSetOfCoachUserId,
    TextStyle bodyLarge,
  ) =>
      ConversationAppBar(
        onTap: () {},
        imageWidget: _displayCoachPhoto(
            chosenTrainingRequestConversationDynamicByUserCubit),
        infoTitle: _displayCoachUsername(
            chosenTrainingRequestConversationDynamicByUserCubit),
        infoDetail: _displayPerPriceLessonOfCoach(
            chosenTrainingRequestConversationDynamicByUserCubit),
        date: _displayStartDateOfConversation(
            chosenTrainingRequestConversationDynamicByUserCubit),
        dateDetail: _displayDateDifferences(
            chosenTrainingRequestConversationDynamicByUserCubit),
      );

  NetworkImage _displayCoachPhoto(
    ChosenTrainingRequestConversationDynamicByUserCubit
        chosenTrainingRequestConversationDynamicByUserCubit,
  ) =>
      NetworkImage(chosenTrainingRequestConversationDynamicByUserCubit
          .state
          .chosenTrainingRequestConversationDynamicList
          .last
          .trainingRequestResponseDynamic
          .coachDynamic
          .userDynamic
          .picUrl);

  String _displayCoachUsername(
    ChosenTrainingRequestConversationDynamicByUserCubit
        chosenTrainingRequestConversationDynamicByUserCubit,
  ) =>
      chosenTrainingRequestConversationDynamicByUserCubit
          .state
          .chosenTrainingRequestConversationDynamicList
          .last
          .trainingRequestResponseDynamic
          .coachDynamic
          .userDynamic
          .username;

  String _displayPerPriceLessonOfCoach(
    ChosenTrainingRequestConversationDynamicByUserCubit
        chosenTrainingRequestConversationDynamicByUserCubit,
  ) =>
      chosenTrainingRequestConversationDynamicByUserCubit
          .state
          .chosenTrainingRequestConversationDynamicList
          .last
          .trainingRequestResponseDynamic
          .coachDynamic
          .perLessonPrice
          .toString();

  String _displayStartDateOfConversation(
    ChosenTrainingRequestConversationDynamicByUserCubit
        chosenTrainingRequestConversationDynamicByUserCubit,
  ) =>
      _appDateFormat.monthAndDayWithDayName.format(_findStartDateOfConversation(
          chosenTrainingRequestConversationDynamicByUserCubit));

  String _displayDateDifferences(
    ChosenTrainingRequestConversationDynamicByUserCubit
        chosenTrainingRequestConversationDynamicByUserCubit,
  ) =>
      _appFunctions.showDayDifference(_findStartDateOfConversation(
          chosenTrainingRequestConversationDynamicByUserCubit));

  /// METHODS ==========================================================================================================
  void _createSetOfCoachUserId(
    ChosenTrainingRequestConversationDynamicByUserCubit
        chosenTrainingRequestConversationDynamicByUserCubit,
    Set<int?> uniqueSetOfCoachUserId,
  ) {
    for (var element in chosenTrainingRequestConversationDynamicByUserCubit
        .state.chosenTrainingRequestConversationDynamicList) {
      uniqueSetOfCoachUserId.add(
          element.trainingRequestResponseDynamic.coachDynamic.userDynamic.uId);
    }
  }

  //
  // void _createSetOfSentMessageDate(
  //   ChosenTrainingRequestMessageDynamicByUserCubit
  //       chosenTrainingRequestMessageDynamicByUserCubit,
  //   Set<DateTime> uniqueSetOfMessageDate,
  // ) {
  //   for (var element in chosenTrainingRequestMessageDynamicByUserCubit
  //       .state.chosenTrainingRequestMessageDynamicList) {
  //     uniqueSetOfMessageDate.add(DateUtils.dateOnly(element.sentAt));
  //   }
  // }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  DateTime _findStartDateOfConversation(
    ChosenTrainingRequestConversationDynamicByUserCubit
        chosenTrainingRequestConversationDynamicByUserCubit,
  ) =>
      chosenTrainingRequestConversationDynamicByUserCubit
          .state
          .chosenTrainingRequestConversationDynamicList
          .last
          .trainingRequestResponseDynamic
          .approvedDate!;

  /// Unchoose Methods -------------------------------------------------------------------------------------------------
  //
  //void _unchooseChosenTrainingRequestConversation(
  //   ChosenTrainingRequestConversationDynamicByUserCubit
  //       chosenTrainingRequestConversationDynamicByUserCubit,
  // ) {
  //   if (chosenTrainingRequestConversationDynamicByUserCubit
  //       .state.chosenTrainingRequestConversationDynamicList.isNotEmpty) {
  //     chosenTrainingRequestConversationDynamicByUserCubit
  //         .pressCancelButton();
  //   }
  // }
  //
  // void _unchooseMessagesOfChosenTrainingRequestConversationIfExist(
  //     ChosenTrainingRequestMessageDynamicByUserCubit
  //         chosenTrainingRequestMessageDynamicByUserCubit) {
  //   if (chosenTrainingRequestMessageDynamicByUserCubit
  //       .state.chosenTrainingRequestMessageDynamicList.isNotEmpty) {
  //     chosenTrainingRequestMessageDynamicByUserCubit
  //         .pressCancelButton();
  //   }
  // }

  /// Screen Methods ---------------------------------------------------------------------------------------------------
  //
  // void _closeTheScreen(BuildContext context) => Navigator.of(context).pop();
}
