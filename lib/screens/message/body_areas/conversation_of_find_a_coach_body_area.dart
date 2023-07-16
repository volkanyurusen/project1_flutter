import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/message/pop_ups/zpop_ups.dart';
import 'package:my_project/screens/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

import 'zareas.dart';

class ConversationOfFindACoachBodyArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final double screenWidth;
  final Set<int?> uniqueSetOfTrainingOfferResponseId;
  final int index;

  ConversationOfFindACoachBodyArea({
    required this.screenWidth,
    required this.uniqueSetOfTrainingOfferResponseId,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChosenFindACoachConversationDynamicByTraineeCubit
        chosenFindACoachConversationDynamicByTraineeCubit =
        context.read<ChosenFindACoachConversationDynamicByTraineeCubit>();
    // final ChosenFindACoachMessageDynamicByTraineeCubit
    //     chosenFindACoachMessageDynamicByTraineeCubit =
    //     context.read<ChosenFindACoachMessageDynamicByTraineeCubit>();

    final TextStyle headlineSmall = context.textTheme.headlineSmall!;
    final TextStyle bodyLarge = context.textTheme.bodyLarge!;
    final Color pastTrainingOfferColor = _appColors.textColor;

    return CustomColumn(
      children: [
        index == 0 ? const CustomAppSizedBox(height: 22) : const SizedBox(),
        _createTrainingOfferConversationArea(
            context,
            chosenFindACoachConversationDynamicByTraineeCubit,
            // chosenFindACoachMessageDynamicByTraineeCubit,
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
    ChosenFindACoachConversationDynamicByTraineeCubit
        chosenFindACoachConversationDynamicByTraineeCubit,
    // ChosenFindACoachMessageDynamicByTraineeCubit
    //     chosenFindACoachMessageDynamicByTraineeCubit,
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
                ? _assignDetailAsChosenAndGoToChosenFindACoachMessageScreen(
                    context,
                    chosenFindACoachConversationDynamicByTraineeCubit,
                    // chosenFindACoachMessageDynamicByTraineeCubit,
                    uniqueSetOfTrainingOfferResponseId,
                    index)
                : null,
        onLongPress: () =>
            _checkWhetherMessagesOfTrainingOfferConversationAreBroughtFromDatabase(
                    context)
                ? _deleteChosenTrainingOfferConversationAndItsMessages(
                    context,
                    chosenFindACoachConversationDynamicByTraineeCubit,
                    // chosenFindACoachMessageDynamicByTraineeCubit,
                    uniqueSetOfTrainingOfferResponseId,
                    index)
                : null,
        child: _displayFindACoachConversationArea(context, screenWidth, index),
      );

  /// DISPLAY =========================================================================================================
  ChosenFindACoachConversationBox _displayFindACoachConversationArea(
    BuildContext context,
    double screenWidth,
    int index,
  ) =>
      ChosenFindACoachConversationBox(screenWidth: screenWidth, index: index);

  /// METHODS =========================================================================================================
  void _assignDetailAsChosenAndGoToChosenFindACoachMessageScreen(
    BuildContext context,
    ChosenFindACoachConversationDynamicByTraineeCubit
        chosenFindACoachConversationDynamicByTraineeCubit,
    // ChosenFindACoachMessageDynamicByTraineeCubit
    //     chosenFindACoachMessageDynamicByTraineeCubit,
    Set<int?> uniqueSetOfTrainingOfferResponseId,
    int index,
  ) {
    _assignFindACoachConversationAsChosenBasedOnTrainingOfferResponse(
        context,
        chosenFindACoachConversationDynamicByTraineeCubit,
        uniqueSetOfTrainingOfferResponseId,
        index);
    //
    // _assignMessagesAsChosenMessagesBasedOnTrainingOfferResponse(
    //     context, chosenFindACoachMessageDynamicByTraineeCubit, index);
    _bringTrainingOfferMessageByTrainingOfferConversation(context, index);
    _goToChosenFindACoachMessageScreen(context, index);
  }

  Future<dynamic> _deleteChosenTrainingOfferConversationAndItsMessages(
    BuildContext context,
    ChosenFindACoachConversationDynamicByTraineeCubit
        chosenFindACoachConversationDynamicByTraineeCubit,
    // ChosenFindACoachMessageDynamicByTraineeCubit
    //     chosenFindACoachMessageDynamicByTraineeCubit,
    Set<int?> uniqueSetOfTrainingOfferResponseId,
    int index,
  ) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            _assignFindACoachConversationAsChosenBasedOnTrainingOfferResponse(
                context,
                chosenFindACoachConversationDynamicByTraineeCubit,
                uniqueSetOfTrainingOfferResponseId,
                index);
            //
            // _assignMessagesAsChosenMessagesBasedOnTrainingOfferResponse(
            //     context, chosenFindACoachMessageDynamicByTraineeCubit, index);
            return ConversationOfChosenFindACoachDeletingPopUp(index: index);
          });

  /// Assign Methods --------------------------------------------------------------------------------------------------
  void _assignFindACoachConversationAsChosenBasedOnTrainingOfferResponse(
    BuildContext context,
    ChosenFindACoachConversationDynamicByTraineeCubit
        chosenFindACoachConversationDynamicByTraineeCubit,
    Set<int?> uniqueSetOfTrainingOfferResponseId,
    int index,
  ) {
    for (var element in context
        .read<GroupedFindACoachConversationDynamicByTraineeCubit>()
        .state
        .groupedFindACoachConversationDynamicList) {
      if (element.trainingOfferResponseDynamic.trainingOfferResponseId ==
          uniqueSetOfTrainingOfferResponseId.elementAt(index)) {
        chosenFindACoachConversationDynamicByTraineeCubit
            .pressFindACoachConversation(element);
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
          .read<GroupedFindACoachConversationDynamicByTraineeCubit>()
          .state
          .groupedFindACoachConversationDynamicList
          .elementAt(index)
          .trainingOfferConversationId!);
    }
    context.read<FindACoachMessageDynamicByFindACoachConversationBloc>().add(
        LoadFindACoachMessageDynamicByFindACoachConversationEvent(
            traineeId: AppNumberConstants().appUserId,
            findACoachConversationId: context
                .read<GroupedFindACoachConversationDynamicByTraineeCubit>()
                .state
                .groupedFindACoachConversationDynamicList
                .elementAt(index)
                .trainingOfferConversationId!));
  }

  //
  // void _assignMessagesAsChosenMessagesBasedOnTrainingOfferResponse(
  //   BuildContext context,
  //   ChosenFindACoachMessageDynamicByTraineeCubit
  //       chosenFindACoachMessageDynamicByTraineeCubit,
  //   int index,
  // ) {
  //   chosenFindACoachMessageDynamicByTraineeCubit.pressMessage(context
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
          .read<FindACoachMessageDynamicByGroupOfFindACoachConversationBloc>()
          .state
          .status ==
      Status.success;

  /// Screen Methods --------------------------------------------------------------------------------------------------
  void _goToChosenFindACoachMessageScreen(BuildContext context, index) {
    //
    // print(
    //     'chosen training offer conversations:  ${context.read<ChosenFindACoachConversationDynamicByTraineeCubit>().state.chosenFindACoachConversationDynamicByTrainee.length}');
    // for (var element in context
    //     .read<ChosenFindACoachConversationDynamicByTraineeCubit>()
    //     .state
    //     .chosenFindACoachConversationDynamicByTrainee) {
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
    //     'chosen training offer messages: ${context.read<ChosenFindACoachMessageDynamicByTraineeCubit>().state.chosenFindACoachMessageDynamicByTrainee.length}');
    // for (var element in context
    //     .read<ChosenFindACoachMessageDynamicByTraineeCubit>()
    //     .state
    //     .chosenFindACoachMessageDynamicByTrainee) {
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
    Navigator.of(context).pushNamed(ScreenOfChosenFindACoachMessage.routeName);
  }
}
