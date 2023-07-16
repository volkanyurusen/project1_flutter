import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ConversationOfTrainingOfferDeletingPopUp extends StatelessWidget {
  final int index;
  const ConversationOfTrainingOfferDeletingPopUp({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChosenTrainingOfferConversationDynamicByUserCubit
        chosenTrainingOfferConversationDynamicByUserCubit =
        context.read<ChosenTrainingOfferConversationDynamicByUserCubit>();
    ChosenTrainingOfferMessageDynamicByUserCubit
        chosenTrainingOfferMessageDynamicByUserCubit =
        context.read<ChosenTrainingOfferMessageDynamicByUserCubit>();

    return ActionPopUp(
      actionVoidCallBack: () {
        if (kDebugMode) {
          print(
              '${chosenTrainingOfferConversationDynamicByUserCubit.state.chosenTrainingOfferConversationDynamicList.last.trainingOfferConversationId} is chosen');
        }
        // _unchooseChosenTrainingOfferConversation(
        //     chosenTrainingOfferConversationDynamicByUserCubit);
        if (chosenTrainingOfferMessageDynamicByUserCubit
            .state.chosenTrainingOfferMessageDynamicList.isNotEmpty) {
          if (kDebugMode) {
            print(
                '${chosenTrainingOfferMessageDynamicByUserCubit.state.chosenTrainingOfferMessageDynamicList} is chosen');
          }
          // _unchooseChosenTrainingOfferMessagesBasedOnTrainingOfferConversation(
          //     chosenTrainingOfferMessageDynamicByUserCubit);
        }
      },
      cancelVoidCallBack: () {
        if (kDebugMode) {
          print(
              '${chosenTrainingOfferConversationDynamicByUserCubit.state.chosenTrainingOfferConversationDynamicList.last.trainingOfferConversationId} is chosen');
        }
        // _unchooseChosenTrainingOfferConversation(
        //     chosenTrainingOfferConversationDynamicByUserCubit);
        if (chosenTrainingOfferMessageDynamicByUserCubit
            .state.chosenTrainingOfferMessageDynamicList.isNotEmpty) {
          if (kDebugMode) {
            print(
                '${chosenTrainingOfferMessageDynamicByUserCubit.state.chosenTrainingOfferMessageDynamicList} is chosen');
          }
          // _unchooseChosenTrainingOfferMessagesBasedOnTrainingOfferConversation(
          //     chosenTrainingOfferMessageDynamicByUserCubit);
        }
      },
    );
  }

  /// METHODS ==========================================================================================================
  /// Unchoose Mehtods -------------------------------------------------------------------------------------------------
  //
  //void _unchooseChosenTrainingOfferConversation(
  //         ChosenTrainingOfferConversationDynamicByUserCubit
  //             chosenTrainingOfferConversationDynamicByUserCubit) =>
  //     chosenTrainingOfferConversationDynamicByUserCubit
  //         .pressCancelButton();

  //
  // void _unchooseChosenTrainingOfferMessagesBasedOnTrainingOfferConversation(
  //   ChosenTrainingOfferMessageDynamicByUserCubit
  //       chosenTrainingOfferMessageDynamicByUserCubit,
  // ) =>
  //     chosenTrainingOfferMessageDynamicByUserCubit
  //         .pressCancelButton();
}
