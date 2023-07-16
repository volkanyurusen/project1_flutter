import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/activity_conversation_dynamic.dart';
import 'package:my_project/widgets/widget.dart';

import '../pop_ups/zpop_ups.dart';
import '../zscreens.dart';
import 'zareas.dart';

class ConversationOfActivityBodyArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final double screenWidth;
  final List<int?> uniqueListOfCreatedActivityId;
  final int index;

  ConversationOfActivityBodyArea({
    required this.screenWidth,
    required this.uniqueListOfCreatedActivityId,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ActivityConversationDynamicByUserState conversationState =
        context.read<ActivityConversationDynamicByUserBloc>().state;
    final ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit =
        context.read<ChosenActivityConversationDynamicByUserCubit>();
    final ChosenActivityMessageDynamicByUserCubit
        chosenActivityMessageDynamicByUserCubit =
        context.read<ChosenActivityMessageDynamicByUserCubit>();

    final TextStyle headlineSmall = context.textTheme.headlineSmall!;
    final TextStyle bodyLarge = context.textTheme.bodyLarge!;
    final Color pastActivityColor = _appColors.secondary;

    return CustomColumn(
      children: [
        index == 0 ? const CustomAppSizedBox(height: 14) : const SizedBox(),
        _createActivityConversationArea(
            context,
            conversationState,
            chosenActivityConversationDynamicByUserCubit,
            chosenActivityMessageDynamicByUserCubit,
            screenWidth,
            uniqueListOfCreatedActivityId,
            index,
            headlineSmall,
            bodyLarge,
            pastActivityColor),
        const CustomAppSizedBox(height: 14),
      ],
    );
  }

  /// GENERATE ========================================================================================================
  GestureDetector _createActivityConversationArea(
    BuildContext context,
    ActivityConversationDynamicByUserState conversationState,
    ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit,
    ChosenActivityMessageDynamicByUserCubit
        chosenActivityMessageDynamicByUserCubit,
    double screenWidth,
    List<int?> uniqueListOfCreatedActivityId,
    int index,
    TextStyle headlineSmall,
    TextStyle bodyLarge,
    Color pastActivityColor,
  ) =>
      GestureDetector(
        onTap: () =>
            _checkWhetherMessagesOfActivityConversationAreBroughtFromDatabase(
                    context)
                ? _assignDetailAsChosenAndGoToChosenActivityMessageScreen(
                    context,
                    conversationState,
                    chosenActivityConversationDynamicByUserCubit,
                    chosenActivityMessageDynamicByUserCubit,
                    uniqueListOfCreatedActivityId,
                    index)
                : null,
        onLongPress: () =>
            _checkWhetherMessagesOfActivityConversationAreBroughtFromDatabase(
                    context)
                ? _deleteChosenActivityConversationAndItsMessages(
                    context,
                    conversationState,
                    chosenActivityConversationDynamicByUserCubit,
                    chosenActivityMessageDynamicByUserCubit,
                    index)
                : null,
        child: _displayActivityConversationArea(context, conversationState,
            screenWidth, uniqueListOfCreatedActivityId, index),
      );

  /// DISPLAY =========================================================================================================
  ActivityConversationBox _displayActivityConversationArea(
    BuildContext context,
    ActivityConversationDynamicByUserState conversationState,
    double screenWidth,
    List<int?> uniqueListOfCreatedActivityId,
    int index,
  ) =>
      ActivityConversationBox(
          conversationState: conversationState,
          uniqueListOfCreatedActivityId: uniqueListOfCreatedActivityId,
          screenWidth: screenWidth,
          index: index);

  /// METHODS =========================================================================================================
  void _assignDetailAsChosenAndGoToChosenActivityMessageScreen(
    BuildContext context,
    ActivityConversationDynamicByUserState conversationState,
    ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit,
    ChosenActivityMessageDynamicByUserCubit
        chosenActivityMessageDynamicByUserCubit,
    List<int?> uniqueListOfCreatedActivityId,
    int index,
  ) {
    _assignActivityConversationAsChosenBasedOnCreatedActivity(
        conversationState, chosenActivityConversationDynamicByUserCubit, index);
    //
    // _assignMessagesAsChosenMessagesBasedOnCreatedActivity(
    //     context, chosenActivityMessageDynamicByUserCubit, index);
    _bringMessageByActivityConversation(
        context, uniqueListOfCreatedActivityId, index);
    _goToChosenActivityMessageScreen(context);
  }

  Future<dynamic> _deleteChosenActivityConversationAndItsMessages(
    BuildContext context,
    ActivityConversationDynamicByUserState conversationState,
    ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit,
    ChosenActivityMessageDynamicByUserCubit
        chosenActivityMessageDynamicByUserCubit,
    int index,
  ) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            _assignActivityConversationAsChosenBasedOnCreatedActivity(
                conversationState,
                chosenActivityConversationDynamicByUserCubit,
                index);
            //
            // _assignMessagesAsChosenMessagesBasedOnCreatedActivity(
            //     context, chosenActivityMessageDynamicByUserCubit, index);
            return ConversationOfActivityDeletingPopUp(index: index);
          });

  /// Assign Methods --------------------------------------------------------------------------------------------------
  void _assignActivityConversationAsChosenBasedOnCreatedActivity(
    ActivityConversationDynamicByUserState conversationState,
    ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit,
    int index,
  ) {
    for (var element in conversationState.activityConversationDynamicList) {
      if (_findCreatedActivityId(element) ==
          uniqueListOfCreatedActivityId.elementAt(index)) {
        chosenActivityConversationDynamicByUserCubit
            .pressActivityConversation(element);
      }
    }
  }

  //
  // void _assignMessagesAsChosenMessagesBasedOnCreatedActivity(
  //   BuildContext context,
  //   ChosenActivityMessageDynamicByUserCubit
  //       chosenActivityMessageDynamicByUserCubit,
  //   int index,
  // ) {
  //   for (var element in context
  //       .read<ActivityMessageDynamicByUserBloc>()
  //       .state
  //       .activityMessageDynamicList) {
  //     if (element.activityConversationDynamic.consistedActivityDynamic
  //             .createdActivityDynamic.createdActivityId ==
  //         uniqueListOfCreatedActivityId.elementAt(index)) {
  //       chosenActivityMessageDynamicByUserCubit.pressMessage(element);
  //     }
  //   }
  // }

  /// Database Methods -------------------------------------------------------------------------------------------------
  void _bringMessageByActivityConversation(
    BuildContext context,
    List<int?> uniqueListOfCreatedActivityId,
    int index,
  ) {
    //
    // print(context
    //     .read<ActivityConversationDynamicByUserBloc>()
    //     .state
    //     .activityConversationDynamicList
    //     .where((element) =>
    //         element.consistedActivityDynamic.createdActivityDynamic
    //             .createdActivityId ==
    //         uniqueListOfCreatedActivityId.elementAt(index))
    //     .first
    //     .consistedActivityDynamic
    //     .createdActivityDynamic
    //     .createdActivityId);
    context.read<MessageDynamicByActivityConversationBloc>().add(
        LoadMessageDynamicByActivityConversationEvent(
            createdActivityId: context
                .read<ActivityConversationDynamicByUserBloc>()
                .state
                .activityConversationDynamicList
                .where((element) =>
                    _findCreatedActivityId(element) ==
                    uniqueListOfCreatedActivityId.elementAt(index))
                .first
                .consistedActivityDynamic
                .createdActivityDynamic
                .createdActivityId!));
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherMessagesOfActivityConversationAreBroughtFromDatabase(
    BuildContext context,
  ) =>
      context
          .read<MessageDynamicByGroupOfActivityConversationBloc>()
          .state
          .status ==
      StatusWithoutLoading.success;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  int? _findCreatedActivityId(ActivityConversationDynamic element) =>
      element.consistedActivityDynamic.createdActivityDynamic.createdActivityId;

  /// Screen Methods --------------------------------------------------------------------------------------------------
  void _goToChosenActivityMessageScreen(BuildContext context) {
    //
    // print(
    //     'chosen activity conversations:  ${context.read<ChosenActivityConversationDynamicByUserCubit>().state.chosenActivityConversationDynamicByUser.length}');
    // for (var element in context
    //     .read<ChosenActivityConversationDynamicByUserCubit>()
    //     .state
    //     .chosenActivityConversationDynamicByUser) {
    //   print('a.activityConversationId is: ${element.activityConversationId}');
    //   print(
    //       'a.consistedActivityId is: ${element.consistedActivityDynamic.consistedActivityId}');
    //   print(
    //       'a.attendeeId is: ${element.consistedActivityDynamic.attendee.uId}');
    //   print(
    //       'a.createdActivityId is: ${element.consistedActivityDynamic.createdActivityDynamic.createdActivityId}');
    //   print(
    //       'a.hostId is: ${element.consistedActivityDynamic.createdActivityDynamic.host.uId}');
    // }
    // print(
    //     'chosen activity messages: ${context.read<ChosenActivityMessageDynamicByUserCubit>().state.chosenActivityMessageDynamicByUser.length}');
    // for (var element in context
    //     .read<ChosenActivityMessageDynamicByUserCubit>()
    //     .state
    //     .chosenActivityMessageDynamicByUser) {
    //   print('m.messageId is: ${element.messageId}');
    //   print(
    //       'm.activityConversationId is: ${element.activityConversationDynamic.activityConversationId}');
    //   print(
    //       'm.consistedActivityId is: ${element.activityConversationDynamic.consistedActivityDynamic.consistedActivityId}');
    //   print(
    //       'm.attendeeId is: ${element.activityConversationDynamic.consistedActivityDynamic.attendee.uId}');
    //   print(
    //       'm.createdActivityId is: ${element.activityConversationDynamic.consistedActivityDynamic.createdActivityDynamic.createdActivityId}');
    //   print(
    //       'm.hostId is: ${element.activityConversationDynamic.consistedActivityDynamic.createdActivityDynamic.host.uId}');
    // }
    Navigator.of(context).pushNamed(ScreenOfChosenActivityMessage.routeName);
  }
}
