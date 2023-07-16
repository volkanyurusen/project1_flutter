import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/message/body_areas/zareas.dart';

class ChosenConversationOfActivityBody extends StatelessWidget {
  const ChosenConversationOfActivityBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit =
        context.read<ChosenActivityConversationDynamicByUserCubit>();
    final ChosenActivityMessageDynamicByUserCubit
        chosenActivityMessageDynamicByUserCubit =
        context.read<ChosenActivityMessageDynamicByUserCubit>();

    Set<int?> uniqueSetOfAttendeeId = <int?>{};
    Set<DateTime> uniqueSetOfMessageDate = <DateTime>{};
    _createSetOfAttendeeUserId(
        chosenActivityConversationDynamicByUserCubit, uniqueSetOfAttendeeId);
    _createSetOfSentMessageDate(
        chosenActivityMessageDynamicByUserCubit, uniqueSetOfMessageDate);

    return const Column(children: [
      //
      // ChosenConversationOfActivityBodyMessageTopBoxArea(
      //     uniqueSetOfAttendeeId: uniqueSetOfAttendeeId),
      ChosenConversationOfActivityBodyMessageContentArea(),
    ]);
  }

  /// METHODS ==========================================================================================================
  void _createSetOfAttendeeUserId(
    ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit,
    Set<int?> uniqueSetOfAttendeeId,
  ) {
    for (var element in chosenActivityConversationDynamicByUserCubit
        .state.chosenActivityConversationDynamicList) {
      uniqueSetOfAttendeeId.add(element.consistedActivityDynamic.attendee.uId);
    }
  }

  void _createSetOfSentMessageDate(
    ChosenActivityMessageDynamicByUserCubit
        chosenActivityMessageDynamicByUserCubit,
    Set<DateTime> uniqueSetOfMessageDate,
  ) {
    for (var element in chosenActivityMessageDynamicByUserCubit
        .state.chosenActivityMessageDynamicList) {
      uniqueSetOfMessageDate.add(DateUtils.dateOnly(element.sentAt));
    }
  }
}
