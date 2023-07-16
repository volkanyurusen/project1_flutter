import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/message/body_areas/zareas.dart';

import 'local_widgets/zlocal_widget.dart';

class ScreenOfChosenTrainingOfferMessage extends StatelessWidget {
  static const String routeName = 'screen_of_training_offer_message';

  final AppDateFormat _appDateFormat = AppDateFormat();

  ScreenOfChosenTrainingOfferMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChosenTrainingOfferConversationDynamicByUserCubit
        chosenTrainingOfferConversationDynamicByUserCubit =
        context.read<ChosenTrainingOfferConversationDynamicByUserCubit>();
    //
    // final ChosenTrainingOfferMessageDynamicByUserCubit
    //     chosenTrainingOfferMessageDynamicByUserCubit =
    //     context.read<ChosenTrainingOfferMessageDynamicByUserCubit>();

    Set<int?> uniqueSetOfTraineeId = <int?>{};
    _createSetOfTraineeUserId(chosenTrainingOfferConversationDynamicByUserCubit,
        uniqueSetOfTraineeId);
    //
    // Set<DateTime> uniqueSetOfMessageDate = <DateTime>{};
    // _createSetOfSentMessageDate(
    //     chosenTrainingOfferMessageDynamicByUserCubit, uniqueSetOfMessageDate);
    final TextStyle bodyLarge = context.textTheme.bodyLarge!;

    return WillPopScope(
      onWillPop: () async {
        context
            .read<TrainingOfferMessageDynamicByTrainingOfferConversationBloc>()
            .add(CleanTrainingOfferMessageDynamicByTrainingOfferConversation());

        //
        // _unchooseChosenTrainingOfferConversation(
        //     chosenTrainingOfferConversationDynamicByUserCubit);
        // _unchooseMessagesOfChosenTrainingOfferConversationIfExist(
        //     chosenTrainingOfferMessageDynamicByUserCubit);
        // _closeTheScreen(context);
        return Future(() => true);
      },
      child: Scaffold(
        appBar: _displayTraineeAppBar(
            chosenTrainingOfferConversationDynamicByUserCubit,
            uniqueSetOfTraineeId,
            bodyLarge),
        body: const Column(children: [
          ChosenConversationOfTrainingOfferBodyMessageContentArea(
              // uniqueSetOfMessageDate: uniqueSetOfMessageDate
              ),
        ]),
      ),
    );
  }

  /// DISPLAY ==========================================================================================================
  ConversationAppBar _displayTraineeAppBar(
    ChosenTrainingOfferConversationDynamicByUserCubit
        chosenTrainingOfferConversationDynamicByUserCubit,
    Set<int?> uniqueSetOfTraineeId,
    TextStyle bodyLarge,
  ) =>
      ConversationAppBar(
        onTap: () {},
        imageWidget: _displayTraineePhoto(
            chosenTrainingOfferConversationDynamicByUserCubit),
        infoTitle: _displayTraineeUsername(
            chosenTrainingOfferConversationDynamicByUserCubit),
        date: _displayStartDateOfConversation(
            chosenTrainingOfferConversationDynamicByUserCubit),
      );

  NetworkImage _displayTraineePhoto(
    ChosenTrainingOfferConversationDynamicByUserCubit
        chosenTrainingOfferConversationDynamicByUserCubit,
  ) =>
      NetworkImage(chosenTrainingOfferConversationDynamicByUserCubit
          .state
          .chosenTrainingOfferConversationDynamicList
          .last
          .trainingOfferResponseDynamic
          .trainee
          .picUrl);

  String _displayTraineeUsername(
    ChosenTrainingOfferConversationDynamicByUserCubit
        chosenTrainingOfferConversationDynamicByUserCubit,
  ) =>
      chosenTrainingOfferConversationDynamicByUserCubit
          .state
          .chosenTrainingOfferConversationDynamicList
          .last
          .trainingOfferResponseDynamic
          .trainee
          .username;

  String _displayStartDateOfConversation(
    ChosenTrainingOfferConversationDynamicByUserCubit
        chosenTrainingOfferConversationDynamicByUserCubit,
  ) =>
      _appDateFormat.monthAndDayWithDayName.format(_findStartDateOfConversation(
          chosenTrainingOfferConversationDynamicByUserCubit));

  /// METHODS ==========================================================================================================
  void _createSetOfTraineeUserId(
    ChosenTrainingOfferConversationDynamicByUserCubit
        chosenTrainingOfferConversationDynamicByUserCubit,
    Set<int?> uniqueSetOfTraineeId,
  ) {
    for (var element in chosenTrainingOfferConversationDynamicByUserCubit
        .state.chosenTrainingOfferConversationDynamicList) {
      uniqueSetOfTraineeId
          .add(element.trainingOfferResponseDynamic.trainee.uId);
    }
  }

  //
  // void _createSetOfSentMessageDate(
  //   ChosenTrainingOfferMessageDynamicByUserCubit
  //       chosenTrainingOfferMessageDynamicByUserCubit,
  //   Set<DateTime> uniqueSetOfMessageDate,
  // ) {
  //   for (var element in chosenTrainingOfferMessageDynamicByUserCubit
  //       .state.chosenTrainingOfferMessageDynamicList) {
  //     uniqueSetOfMessageDate.add(DateUtils.dateOnly(element.sentAt));
  //   }
  // }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  DateTime _findStartDateOfConversation(
    ChosenTrainingOfferConversationDynamicByUserCubit
        chosenTrainingOfferConversationDynamicByUserCubit,
  ) =>
      chosenTrainingOfferConversationDynamicByUserCubit
          .state
          .chosenTrainingOfferConversationDynamicList
          .last
          .trainingOfferResponseDynamic
          .approvedDate!;

  /// Unchoose Methods -------------------------------------------------------------------------------------------------
  //
  //oid _unchooseChosenTrainingOfferConversation(
  //   ChosenTrainingOfferConversationDynamicByUserCubit
  //       chosenTrainingOfferConversationDynamicByUserCubit,
  // ) {
  //   if (chosenTrainingOfferConversationDynamicByUserCubit
  //       .state.chosenTrainingOfferConversationDynamicList.isNotEmpty) {
  //     chosenTrainingOfferConversationDynamicByUserCubit
  //         .pressCancelButton();
  //   }
  // }
  //
  // void _unchooseMessagesOfChosenTrainingOfferConversationIfExist(
  //     ChosenTrainingOfferMessageDynamicByUserCubit
  //         chosenTrainingOfferMessageDynamicByUserCubit) {
  //   if (chosenTrainingOfferMessageDynamicByUserCubit
  //       .state.chosenTrainingOfferMessageDynamicList.isNotEmpty) {
  //     chosenTrainingOfferMessageDynamicByUserCubit
  //         .pressCancelButton();
  //   }
  // }

  /// Screen Methods ---------------------------------------------------------------------------------------------------
  //
  // void _closeTheScreen(BuildContext context) => Navigator.of(context).pop();
}
