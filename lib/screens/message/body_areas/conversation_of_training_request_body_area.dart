import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/message/pop_ups/zpop_ups.dart';
import 'package:my_project/screens/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

import 'zareas.dart';

class ConversationOfTrainingRequestBodyArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final double screenWidth;
  final Set<int?> uniqueSetOfTrainingRequestResponseId;
  final int index;

  ConversationOfTrainingRequestBodyArea({
    required this.screenWidth,
    required this.uniqueSetOfTrainingRequestResponseId,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChosenTrainingRequestConversationDynamicByUserCubit
        chosenTrainingRequestConversationDynamicByUserCubit =
        context.read<ChosenTrainingRequestConversationDynamicByUserCubit>();
    final ChosenTrainingRequestMessageDynamicByUserCubit
        chosenTrainingRequestMessageDynamicByUserCubit =
        context.read<ChosenTrainingRequestMessageDynamicByUserCubit>();

    final TextStyle headlineSmall = context.textTheme.headlineSmall!;
    final TextStyle bodyLarge = context.textTheme.bodyLarge!;
    final Color pastTrainingRequestColor = _appColors.textColor;

    return CustomColumn(
      children: [
        index == 0 ? const CustomAppSizedBox(height: 22) : const SizedBox(),
        _createTrainingRequestConversationArea(
            context,
            chosenTrainingRequestConversationDynamicByUserCubit,
            chosenTrainingRequestMessageDynamicByUserCubit,
            screenWidth,
            uniqueSetOfTrainingRequestResponseId,
            index,
            headlineSmall,
            bodyLarge,
            pastTrainingRequestColor),
        const CustomAppSizedBox(height: 22),
      ],
    );
  }

  /// GENERATE ========================================================================================================
  GestureDetector _createTrainingRequestConversationArea(
    BuildContext context,
    ChosenTrainingRequestConversationDynamicByUserCubit
        chosenTrainingRequestConversationDynamicByUserCubit,
    ChosenTrainingRequestMessageDynamicByUserCubit
        chosenTrainingRequestMessageDynamicByUserCubit,
    double screenWidth,
    Set<int?> uniqueSetOfTrainingRequestResponseId,
    int index,
    TextStyle headlineSmall,
    TextStyle bodyLarge,
    Color pastTrainingRequestColor,
  ) =>
      GestureDetector(
        onTap: () =>
            _checkWhetherMessagesOfTrainingRequestConversationAreBroughtFromDatabase(
                    context)
                ? _assignDetailAsChosenAndGoToChosenTrainingRequestMessageScreen(
                    context,
                    chosenTrainingRequestConversationDynamicByUserCubit,
                    chosenTrainingRequestMessageDynamicByUserCubit,
                    uniqueSetOfTrainingRequestResponseId,
                    index)
                : null,
        onLongPress: () =>
            _checkWhetherMessagesOfTrainingRequestConversationAreBroughtFromDatabase(
                    context)
                ? _deleteChosenTrainingRequestConversationAndItsMessages(
                    context,
                    chosenTrainingRequestConversationDynamicByUserCubit,
                    chosenTrainingRequestMessageDynamicByUserCubit,
                    uniqueSetOfTrainingRequestResponseId,
                    index)
                : null,
        child: _displayTrainingRequestConversationArea(
            context, screenWidth, index),
      );

  /// DISPLAY =========================================================================================================
  ChosenTrainingRequestConversationBox _displayTrainingRequestConversationArea(
    BuildContext context,
    double screenWidth,
    int index,
  ) =>
      ChosenTrainingRequestConversationBox(
          screenWidth: screenWidth, index: index);

  /// METHODS =========================================================================================================
  void _assignDetailAsChosenAndGoToChosenTrainingRequestMessageScreen(
    BuildContext context,
    ChosenTrainingRequestConversationDynamicByUserCubit
        chosenTrainingRequestConversationDynamicByUserCubit,
    ChosenTrainingRequestMessageDynamicByUserCubit
        chosenTrainingRequestMessageDynamicByUserCubit,
    Set<int?> uniqueSetOfTrainingRequestResponseId,
    int index,
  ) {
    _assignTrainingRequestConversationAsChosenBasedOnTrainingRequestResponse(
        context,
        chosenTrainingRequestConversationDynamicByUserCubit,
        uniqueSetOfTrainingRequestResponseId,
        index);
    //
    // _assignMessagesAsChosenMessagesBasedOnTrainingRequestResponse(context,
    //     chosenTrainingRequestMessageDynamicByUserCubit, index);
    _bringTrainingRequestMessageByTrainingRequestConversation(context, index);
    _goToChosenTrainingRequestMessageScreen(context, index);
  }

  Future<dynamic> _deleteChosenTrainingRequestConversationAndItsMessages(
    BuildContext context,
    ChosenTrainingRequestConversationDynamicByUserCubit
        chosenTrainingRequestConversationDynamicByUserCubit,
    ChosenTrainingRequestMessageDynamicByUserCubit
        chosenTrainingRequestMessageDynamicByUserCubit,
    Set<int?> uniqueSetOfTrainingRequestResponseId,
    int index,
  ) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            _assignTrainingRequestConversationAsChosenBasedOnTrainingRequestResponse(
                context,
                chosenTrainingRequestConversationDynamicByUserCubit,
                uniqueSetOfTrainingRequestResponseId,
                index);
            //
            // _assignMessagesAsChosenMessagesBasedOnTrainingRequestResponse(
            //     context,
            //     chosenTrainingRequestMessageDynamicByUserCubit,
            //     index);
            return ConversationOfChosenTrainingRequestDeletingPopUp(
                index: index);
          });

  /// Assign Methods --------------------------------------------------------------------------------------------------
  void _assignTrainingRequestConversationAsChosenBasedOnTrainingRequestResponse(
    BuildContext context,
    ChosenTrainingRequestConversationDynamicByUserCubit
        chosenTrainingRequestConversationDynamicByUserCubit,
    Set<int?> uniqueSetOfTrainingRequestResponseId,
    int index,
  ) {
    for (var element in context
        .read<GroupedTrainingRequestConversationDynamicByUserCubit>()
        .state
        .groupedTrainingRequestConversationDynamicList) {
      if (element.trainingRequestResponseDynamic.trainingRequestResponseId ==
          uniqueSetOfTrainingRequestResponseId.elementAt(index)) {
        chosenTrainingRequestConversationDynamicByUserCubit
            .pressTrainingRequestConversation(element);
      }
    }
  }


  /// Database Methods -------------------------------------------------------------------------------------------------
  void _bringTrainingRequestMessageByTrainingRequestConversation(
    BuildContext context,
    int index,
  ) {
    context
        .read<TrainingRequestMessageDynamicByTrainingRequestConversationBloc>()
        .add(
            LoadTrainingRequestMessageDynamicByTrainingRequestConversationEvent(
                uId: AppNumberConstants().appUserId,
                trainingRequestConversationId: context
                    .read<
                        GroupedTrainingRequestConversationDynamicByUserCubit>()
                    .state
                    .groupedTrainingRequestConversationDynamicList
                    .elementAt(index)
                    .trainingRequestConversationId!));
  }

  //
  // void _assignMessagesAsChosenMessagesBasedOnTrainingRequestResponse(
  //   BuildContext context,
  //   ChosenTrainingRequestMessageDynamicByUserCubit
  //       chosenTrainingRequestMessageDynamicByUserCubit,
  //   int index,
  // ) {
  //   chosenTrainingRequestMessageDynamicByUserCubit.pressMessage(context
  //       .read<
  //           TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationBloc>()
  //       .state
  //       .trainingRequestMessageDynamicList
  //       .where((element) =>
  //           element.trainingRequestConversationDynamic
  //               .trainingRequestResponseDynamic.trainingRequestResponseId ==
  //           uniqueSetOfTrainingRequestResponseId.elementAt(index))
  //       .toList());
  // }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherMessagesOfTrainingRequestConversationAreBroughtFromDatabase(
    BuildContext context,
  ) =>
      context
          .read<
              TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationBloc>()
          .state
          .status ==
      Status.success;

  /// Screen Methods --------------------------------------------------------------------------------------------------
  void _goToChosenTrainingRequestMessageScreen(BuildContext context, index) {
    //
    // print(
    //     'chosen training Request conversations:  ${context.read<ChosenTrainingRequestConversationDynamicByUserCubit>().state.chosenTrainingRequestConversationDynamicByUser.length}');
    // for (var element in context
    //     .read<ChosenTrainingRequestConversationDynamicByUserCubit>()
    //     .state
    //     .chosenTrainingRequestConversationDynamicByUser) {
    //   print(
    //       'c.TrainingRequestConversationId is: ${element.trainingRequestConversationId}');
    //   print(
    //       'c.trainingRequestResponseId is: ${element.trainingRequestResponseDynamic.trainingRequestResponseId}');
    //   print(
    //       'c.traineeId is: ${element.trainingRequestResponseDynamic.trainee.uId}');
    //   print(
    //       'c.trainingRequestId is: ${element.trainingRequestResponseDynamic.trainingRequestDynamic.trainingRequestId}');
    //   print(
    //       'c.coachId is: ${element.trainingRequestResponseDynamic.trainingRequestDynamic.coachDynamic.userDynamic.uId}');
    // }
    // print(
    //     'chosen training Request messages: ${context.read<ChosenTrainingRequestMessageDynamicByUserCubit>().state.chosenTrainingRequestMessageDynamicByUser.length}');
    // for (var element in context
    //     .read<ChosenTrainingRequestMessageDynamicByUserCubit>()
    //     .state
    //     .chosenTrainingRequestMessageDynamicByUser) {
    //   print('m.messageId is: ${element.trainingRequestMessageId}');
    //   print(
    //       'm.TrainingRequestConversationId is: ${element.trainingRequestConversationDynamic.trainingRequestConversationId}');
    //   print(
    //       'm.trainingRequestResponseId is: ${element.trainingRequestConversationDynamic.trainingRequestResponseDynamic.trainingRequestResponseId}');
    //   print(
    //       'm.traineeId is: ${element.trainingRequestConversationDynamic.trainingRequestResponseDynamic.trainee.uId}');
    //   print(
    //       'm.trainingRequestId is: ${element.trainingRequestConversationDynamic.trainingRequestResponseDynamic.trainingRequestDynamic.trainingRequestId}');
    //   print(
    //       'm.coachId is: ${element.trainingRequestConversationDynamic.trainingRequestResponseDynamic.trainingRequestDynamic.coachDynamic.userDynamic.uId}');
    // }
    Navigator.of(context)
        .pushNamed(ScreenOfChosenTrainingRequestMessage.routeName);
  }
}
