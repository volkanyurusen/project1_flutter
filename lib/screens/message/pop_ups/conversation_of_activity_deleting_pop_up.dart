import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ConversationOfActivityDeletingPopUp extends StatelessWidget {
  final int index;
  const ConversationOfActivityDeletingPopUp({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit =
        context.read<ChosenActivityConversationDynamicByUserCubit>();
    // ChosenActivityMessageDynamicByIndividualUserCubit
    //     chosenActivityMessageDynamicByIndividualUserCubit =
    //     context.read<ChosenActivityMessageDynamicByIndividualUserCubit>();

    return ActionPopUp(
      actionVoidCallBack: () {
        if (kDebugMode) {
          print(
              '${chosenActivityConversationDynamicByUserCubit.state.chosenActivityConversationDynamicList.last.activityConversationId} is chosen');
        }
        // _unchooseChosenActivityConversation(
        //     chosenActivityConversationDynamicByUserCubit);
        // if (chosenActivityMessageDynamicByIndividualUserCubit
        //     .state.chosenActivityMessageDynamicList.isNotEmpty) {
        //   print(
        //       '${chosenActivityMessageDynamicByIndividualUserCubit.state.chosenActivityMessageDynamicList} is chosen');
        //   _unchooseChosenActivityMessagesBasedOnActivityConversation(
        //       chosenActivityMessageDynamicByIndividualUserCubit);
        // }
      },
      cancelVoidCallBack: () {
        if (kDebugMode) {
          print(
              '${chosenActivityConversationDynamicByUserCubit.state.chosenActivityConversationDynamicList.last.activityConversationId} is chosen');
        }
        // _unchooseChosenActivityConversation(
        //     chosenActivityConversationDynamicByUserCubit);
        // if (chosenActivityMessageDynamicByIndividualUserCubit
        //     .state.chosenActivityMessageDynamicList.isNotEmpty) {
        //   print(
        //       '${chosenActivityMessageDynamicByIndividualUserCubit.state.chosenActivityMessageDynamicList} is chosen');
        //   _unchooseChosenActivityMessagesBasedOnActivityConversation(
        //       chosenActivityMessageDynamicByIndividualUserCubit);
        // }
      },
    );
  }

  /// METHODS ==========================================================================================================
  /// Unchoose Method ------------------------------------------------------------------------------------------------
  // void _unchooseChosenActivityConversation(
  //         ChosenActivityConversationDynamicByUserCubit
  //             chosenActivityConversationDynamicByUserCubit) =>
  //     chosenActivityConversationDynamicByUserCubit.pressCancelButton(
  //         chosenActivityConversationDynamicByUserCubit
  //             .state.chosenActivityConversationDynamicList.last);

  // void _unchooseChosenActivityMessagesBasedOnActivityConversation(
  //   ChosenActivityMessageDynamicByIndividualUserCubit
  //       chosenActivityMessageDynamicByIndividualUserCubit,
  // ) =>
  //     chosenActivityMessageDynamicByIndividualUserCubit.pressCancelButton();
}
