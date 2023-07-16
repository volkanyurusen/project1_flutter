import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/message/pop_ups/zpop_ups.dart';
import 'package:my_project/screens/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

import 'zareas.dart';

class ConversationOfTrainingOfferBodyArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final double screenWidth;
  final Set<int?> uniqueSetOfTrainingOfferResponseId;
  final int index;

  ConversationOfTrainingOfferBodyArea({
    required this.screenWidth,
    required this.uniqueSetOfTrainingOfferResponseId,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChosenTrainingOfferConversationDynamicByUserCubit
        chosenTrainingOfferConversationDynamicByUserCubit =
        context.read<ChosenTrainingOfferConversationDynamicByUserCubit>();
    final ChosenTrainingOfferMessageDynamicByUserCubit
        chosenTrainingOfferMessageDynamicByUserCubit =
        context.read<ChosenTrainingOfferMessageDynamicByUserCubit>();

    final TextStyle headlineSmall = context.textTheme.headlineSmall!;
    final TextStyle bodyLarge = context.textTheme.bodyLarge!;
    final Color pastTrainingOfferColor = _appColors.textColor;

    return CustomColumn(
      children: [
        index == 0 ? const CustomAppSizedBox(height: 22) : const SizedBox(),
        _createTrainingOfferConversationArea(
            context,
            chosenTrainingOfferConversationDynamicByUserCubit,
            chosenTrainingOfferMessageDynamicByUserCubit,
            screenWidth,
            uniqueSetOfTrainingOfferResponseId,
            index,
            headlineSmall,
            bodyLarge,
            pastTrainingOfferColor),
        const CustomAppSizedBox(height: 22),
      ],
    );
  }

  /// GENERATE ========================================================================================================
  GestureDetector _createTrainingOfferConversationArea(
    BuildContext context,
    ChosenTrainingOfferConversationDynamicByUserCubit
        chosenTrainingOfferConversationDynamicByUserCubit,
    ChosenTrainingOfferMessageDynamicByUserCubit
        chosenTrainingOfferMessageDynamicByUserCubit,
    double screenWidth,
    Set<int?> uniqueSetOfTrainingOfferResponseId,
    int index,
    TextStyle headlineSmall,
    TextStyle bodyLarge,
    Color pastTrainingOfferColor,
  ) =>
      GestureDetector(
        onTap: () =>
            _checkWhetherMessagesOfTrainingOfferConversationAreBroughtFromDatabase(
                    context)
                ? _assignDetailAsChosenAndGoToChosenTrainingOfferMessageScreen(
                    context,
                    chosenTrainingOfferConversationDynamicByUserCubit,
                    chosenTrainingOfferMessageDynamicByUserCubit,
                    uniqueSetOfTrainingOfferResponseId,
                    index)
                : null,
        onLongPress: () =>
            _checkWhetherMessagesOfTrainingOfferConversationAreBroughtFromDatabase(
                    context)
                ? _deleteChosenTrainingOfferConversationAndItsMessages(
                    context,
                    chosenTrainingOfferConversationDynamicByUserCubit,
                    chosenTrainingOfferMessageDynamicByUserCubit,
                    uniqueSetOfTrainingOfferResponseId,
                    index)
                : null,
        child:
            _displayTrainingOfferConversationArea(context, screenWidth, index),
      );

  /// DISPLAY =========================================================================================================
  ChosenTrainingOfferConversationBox _displayTrainingOfferConversationArea(
    BuildContext context,
    double screenWidth,
    int index,
  ) =>
      ChosenTrainingOfferConversationBox(
          screenWidth: screenWidth, index: index);

  /// METHODS =========================================================================================================
  void _assignDetailAsChosenAndGoToChosenTrainingOfferMessageScreen(
    BuildContext context,
    ChosenTrainingOfferConversationDynamicByUserCubit
        chosenTrainingOfferConversationDynamicByUserCubit,
    ChosenTrainingOfferMessageDynamicByUserCubit
        chosenTrainingOfferMessageDynamicByUserCubit,
    Set<int?> uniqueSetOfTrainingOfferResponseId,
    int index,
  ) {
    _assignTrainingOfferConversationAsChosenBasedOnTrainingOfferResponse(
        context,
        chosenTrainingOfferConversationDynamicByUserCubit,
        uniqueSetOfTrainingOfferResponseId,
        index);
    //
    // _assignMessagesAsChosenMessagesBasedOnTrainingOfferResponse(
    //     context, chosenTrainingOfferMessageDynamicByUserCubit, index);
    _bringTrainingOfferMessageByTrainingOfferConversation(context, index);
    _goToChosenTrainingOfferMessageScreen(context, index);
  }

  Future<dynamic> _deleteChosenTrainingOfferConversationAndItsMessages(
    BuildContext context,
    ChosenTrainingOfferConversationDynamicByUserCubit
        chosenTrainingOfferConversationDynamicByUserCubit,
    ChosenTrainingOfferMessageDynamicByUserCubit
        chosenTrainingOfferMessageDynamicByUserCubit,
    Set<int?> uniqueSetOfTrainingOfferResponseId,
    int index,
  ) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            _assignTrainingOfferConversationAsChosenBasedOnTrainingOfferResponse(
                context,
                chosenTrainingOfferConversationDynamicByUserCubit,
                uniqueSetOfTrainingOfferResponseId,
                index);
            //
            // _assignMessagesAsChosenMessagesBasedOnTrainingOfferResponse(
            //     context, chosenTrainingOfferMessageDynamicByUserCubit, index);
            return ConversationOfChosenTrainingOfferDeletingPopUp(index: index);
          });

  /// Assign Methods --------------------------------------------------------------------------------------------------
  void _assignTrainingOfferConversationAsChosenBasedOnTrainingOfferResponse(
    BuildContext context,
    ChosenTrainingOfferConversationDynamicByUserCubit
        chosenTrainingOfferConversationDynamicByUserCubit,
    Set<int?> uniqueSetOfTrainingOfferResponseId,
    int index,
  ) {
    for (var element in context
        .read<GroupedTrainingOfferConversationDynamicByUserCubit>()
        .state
        .groupedTrainingOfferConversationDynamicList) {
      if (element.trainingOfferResponseDynamic.trainingOfferResponseId ==
          uniqueSetOfTrainingOfferResponseId.elementAt(index)) {
        chosenTrainingOfferConversationDynamicByUserCubit
            .pressTrainingOfferConversation(element);
      }
    }
  }

  /// Database Methods -------------------------------------------------------------------------------------------------
  void _bringTrainingOfferMessageByTrainingOfferConversation(
    BuildContext context,
    int index,
  ) {
    if (kDebugMode) {
      print(context
          .read<GroupedTrainingOfferConversationDynamicByUserCubit>()
          .state
          .groupedTrainingOfferConversationDynamicList
          .elementAt(index)
          .trainingOfferConversationId!);
    }
    context
        .read<TrainingOfferMessageDynamicByTrainingOfferConversationBloc>()
        .add(LoadTrainingOfferMessageDynamicByTrainingOfferConversationEvent(
            uId: AppNumberConstants().appUserId,
            trainingOfferConversationId: context
                .read<GroupedTrainingOfferConversationDynamicByUserCubit>()
                .state
                .groupedTrainingOfferConversationDynamicList
                .elementAt(index)
                .trainingOfferConversationId!));
  }

  //
  // void _assignMessagesAsChosenMessagesBasedOnTrainingOfferResponse(
  //   BuildContext context,
  //   ChosenTrainingOfferMessageDynamicByUserCubit
  //       chosenTrainingOfferMessageDynamicByUserCubit,
  //   int index,
  // ) {
  //   chosenTrainingOfferMessageDynamicByUserCubit.pressMessage(context
  //       .read<
  //           TrainingOfferMessageDynamicByGroupOfTrainingOfferConversationBloc>()
  //       .state
  //       .trainingOfferMessageDynamicList
  //       .where((element) =>
  //           element.trainingOfferConversationDynamic
  //               .trainingOfferResponseDynamic.trainingOfferResponseId ==
  //           uniqueSetOfTrainingOfferResponseId.elementAt(index))
  //       .toList());
  // }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherMessagesOfTrainingOfferConversationAreBroughtFromDatabase(
    BuildContext context,
  ) =>
      context
          .read<
              TrainingOfferMessageDynamicByGroupOfTrainingOfferConversationBloc>()
          .state
          .status ==
      Status.success;

  /// Screen Methods --------------------------------------------------------------------------------------------------
  void _goToChosenTrainingOfferMessageScreen(BuildContext context, index) {
    //
    // print(
    //     'chosen training offer conversations:  ${context.read<ChosenTrainingOfferConversationDynamicByUserCubit>().state.chosenTrainingOfferConversationDynamicByUser.length}');
    // for (var element in context
    //     .read<ChosenTrainingOfferConversationDynamicByUserCubit>()
    //     .state
    //     .chosenTrainingOfferConversationDynamicByUser) {
    //   print(
    //       'c.TrainingOfferConversationId is: ${element.trainingOfferConversationId}');
    //   print(
    //       'c.trainingOfferResponseId is: ${element.trainingOfferResponseDynamic.trainingOfferResponseId}');
    //   print(
    //       'c.traineeId is: ${element.trainingOfferResponseDynamic.trainee.uId}');
    //   print(
    //       'c.trainingOfferId is: ${element.trainingOfferResponseDynamic.trainingOfferDynamic.trainingOfferId}');
    //   print(
    //       'c.coachId is: ${element.trainingOfferResponseDynamic.trainingOfferDynamic.coachDynamic.userDynamic.uId}');
    // }
    // print(
    //     'chosen training offer messages: ${context.read<ChosenTrainingOfferMessageDynamicByUserCubit>().state.chosenTrainingOfferMessageDynamicByUser.length}');
    // for (var element in context
    //     .read<ChosenTrainingOfferMessageDynamicByUserCubit>()
    //     .state
    //     .chosenTrainingOfferMessageDynamicByUser) {
    //   print('m.messageId is: ${element.trainingOfferMessageId}');
    //   print(
    //       'm.TrainingOfferConversationId is: ${element.trainingOfferConversationDynamic.trainingOfferConversationId}');
    //   print(
    //       'm.trainingOfferResponseId is: ${element.trainingOfferConversationDynamic.trainingOfferResponseDynamic.trainingOfferResponseId}');
    //   print(
    //       'm.traineeId is: ${element.trainingOfferConversationDynamic.trainingOfferResponseDynamic.trainee.uId}');
    //   print(
    //       'm.trainingOfferId is: ${element.trainingOfferConversationDynamic.trainingOfferResponseDynamic.trainingOfferDynamic.trainingOfferId}');
    //   print(
    //       'm.coachId is: ${element.trainingOfferConversationDynamic.trainingOfferResponseDynamic.trainingOfferDynamic.coachDynamic.userDynamic.uId}');
    // }
    Navigator.of(context)
        .pushNamed(ScreenOfChosenTrainingOfferMessage.routeName);
  }
}
