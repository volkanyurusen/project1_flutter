import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ConversationOfChosenTrainingRequestDeletingPopUp extends StatelessWidget {
  final int index;
  const ConversationOfChosenTrainingRequestDeletingPopUp({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChosenTrainingRequestConversationDynamicByUserCubit
        chosenTrainingRequestConversationDynamicByUserCubit =
        context.read<ChosenTrainingRequestConversationDynamicByUserCubit>();
    ChosenTrainingRequestMessageDynamicByUserCubit
        chosenTrainingRequestMessageDynamicByUserCubit =
        context.read<ChosenTrainingRequestMessageDynamicByUserCubit>();

    return ActionPopUp(
      actionVoidCallBack: () {
        if (kDebugMode) {
          print(
              '${chosenTrainingRequestConversationDynamicByUserCubit.state.chosenTrainingRequestConversationDynamicList.last.trainingRequestConversationId} is chosen');
        }
        // _unchooseChosenTrainingRequestConversation(
        //     chosenTrainingRequestConversationDynamicByUserCubit);
        if (chosenTrainingRequestMessageDynamicByUserCubit
            .state.chosenTrainingRequestMessageDynamicList.isNotEmpty) {
          if (kDebugMode) {
            print(
                '${chosenTrainingRequestMessageDynamicByUserCubit.state.chosenTrainingRequestMessageDynamicList} is chosen');
          }
          // _unchooseChosenTrainingRequestMessagesBasedOnTrainingRequestConversation(
          //     chosenTrainingRequestMessageDynamicByUserCubit);
        }
      },
      cancelVoidCallBack: () {
        if (kDebugMode) {
          print(
              '${chosenTrainingRequestConversationDynamicByUserCubit.state.chosenTrainingRequestConversationDynamicList.last.trainingRequestConversationId} is chosen');
        }
        // _unchooseChosenTrainingRequestConversation(
        //     chosenTrainingRequestConversationDynamicByUserCubit);
        if (chosenTrainingRequestMessageDynamicByUserCubit
            .state.chosenTrainingRequestMessageDynamicList.isNotEmpty) {
          if (kDebugMode) {
            print(
                '${chosenTrainingRequestMessageDynamicByUserCubit.state.chosenTrainingRequestMessageDynamicList} is chosen');
          }
          // _unchooseChosenTrainingRequestMessagesBasedOnTrainingRequestConversation(
          //     chosenTrainingRequestMessageDynamicByUserCubit);
        }
      },
    );
  }

  // void _unchooseChosenTrainingRequestConversation(
  //         ChosenTrainingRequestConversationDynamicByUserCubit
  //             chosenTrainingRequestConversationDynamicByUserCubit) =>
  //     chosenTrainingRequestConversationDynamicByUserCubit
  //         .pressCancelButton();

  // void _unchooseChosenTrainingRequestMessagesBasedOnTrainingRequestConversation(
  //   ChosenTrainingRequestMessageDynamicByUserCubit
  //       chosenTrainingRequestMessageDynamicByUserCubit,
  // ) =>
  //     chosenTrainingRequestMessageDynamicByUserCubit
  //         .pressCancelButton();
}
