import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ConversationOfChosenFindACoachDeletingPopUp extends StatelessWidget {
  final int index;
  const ConversationOfChosenFindACoachDeletingPopUp({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChosenFindACoachConversationDynamicByTraineeCubit
        chosenFindACoachConversationDynamicByTraineeCubit =
        context.read<ChosenFindACoachConversationDynamicByTraineeCubit>();
    ChosenFindACoachMessageDynamicByTraineeCubit
        chosenFindACoachMessageDynamicByTraineeCubit =
        context.read<ChosenFindACoachMessageDynamicByTraineeCubit>();

    return ActionPopUp(
      actionVoidCallBack: () {
        if (kDebugMode) {
          print(
              '${chosenFindACoachConversationDynamicByTraineeCubit.state.chosenFindACoachConversationDynamicList.last.trainingOfferConversationId} is chosen');
        }
        // _unchooseChosenFindACoachConversation(
        //     chosenFindACoachConversationDynamicByTraineeCubit);
        if (chosenFindACoachMessageDynamicByTraineeCubit
            .state.chosenFindACoachMessageDynamicList.isNotEmpty) {
          if (kDebugMode) {
            print(
                '${chosenFindACoachMessageDynamicByTraineeCubit.state.chosenFindACoachMessageDynamicList} is chosen');
          }
          // _unchooseChosenFindACoachMessagesBasedOnFindACoachConversation(
          //     chosenFindACoachMessageDynamicByTraineeCubit);
        }
      },
      cancelVoidCallBack: () {
        if (kDebugMode) {
          print(
              '${chosenFindACoachConversationDynamicByTraineeCubit.state.chosenFindACoachConversationDynamicList.last.trainingOfferConversationId} is chosen');
        }
        // _unchooseChosenFindACoachConversation(
        //     chosenFindACoachConversationDynamicByTraineeCubit);
        if (chosenFindACoachMessageDynamicByTraineeCubit
            .state.chosenFindACoachMessageDynamicList.isNotEmpty) {
          if (kDebugMode) {
            print(
                '${chosenFindACoachMessageDynamicByTraineeCubit.state.chosenFindACoachMessageDynamicList} is chosen');
          }
          // _unchooseChosenFindACoachMessagesBasedOnFindACoachConversation(
          //     chosenFindACoachMessageDynamicByTraineeCubit);
        }
      },
    );
  }

  /// METHODS ==========================================================================================================
  /// Unchoose Methods -------------------------------------------------------------------------------------------------
  //
  //  void _unchooseChosenFindACoachConversation(
  //         ChosenFindACoachConversationDynamicByTraineeCubit
  //             chosenFindACoachConversationDynamicByTraineeCubit) =>
  //     chosenFindACoachConversationDynamicByTraineeCubit
  //         .pressCancelButton();

  //
  // void _unchooseChosenFindACoachMessagesBasedOnFindACoachConversation(
  //   ChosenFindACoachMessageDynamicByTraineeCubit
  //       chosenFindACoachMessageDynamicByTraineeCubit,
  // ) =>
  //     chosenFindACoachMessageDynamicByTraineeCubit
  //         .pressCancelButton();
}
