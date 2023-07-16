import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/widgets/widget.dart';

import '../local_widgets/zlocal_widget.dart';

class ChosenTrainingOfferConversationBox extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppFunctions _appFunctions = AppFunctions();
  final AppDateFormat _appDateFormat = AppDateFormat();
  final double screenWidth;
  final int index;

  ChosenTrainingOfferConversationBox({
    required this.screenWidth,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double boxHeight = 70;
    double imageBoxHeight = boxHeight;
    double imageBoxWidth = boxHeight;
    final TextStyle headlineSmall = context.textTheme.headlineSmall!;
    final TextStyle bodyLarge = context.textTheme.bodyLarge!;
    final Color pastTrainingOfferColor = _appColors.textColor;

    return SizedBox(
      height: boxHeight,
      width: screenWidth,
      child: _createChosenTrainingOfferConversationBoxArea(
          context,
          index,
          imageBoxHeight,
          imageBoxWidth,
          headlineSmall,
          bodyLarge,
          pastTrainingOfferColor),
    );
  }

  /// CREATE ===========================================================================================================
  ConversationBox _createChosenTrainingOfferConversationBoxArea(
    BuildContext context,
    int index,
    double imageBoxHeight,
    double imageBoxWidth,
    TextStyle headlineSmall,
    TextStyle bodyLarge,
    Color pastTrainingOfferColor,
  ) =>
      ConversationBox(
        imageWidget: _displayActivityImage(context, index),
        textOf: _displayTraineeUsername(context, index),
        textOfDate: _displayDate(context, index),
        textOfDateDetail: _displayDayDifferences(context, index),
        isActivityNotPassed: true,
        pastActivityColor: pastTrainingOfferColor,
        widget:
            _buildAndDisplayTheLastMessageOfTheRelevantActvitiyConversationArea(
                context, bodyLarge, pastTrainingOfferColor),
      );

  /// SKELTON ==========================================================================================================
  SkeltonContainer _createSkeltonContainer() =>
      SkeltonContainer(height: 14, width: 180);

  /// BUILD ============================================================================================================
  BlocBuilder<TrainingOfferMessageDynamicByGroupOfTrainingOfferConversationBloc,
          TrainingOfferMessageDynamicByGroupOfTrainingOfferConversationState>
      _buildAndDisplayTheLastMessageOfTheRelevantActvitiyConversationArea(
    BuildContext context,
    TextStyle bodyLarge,
    Color pastTrainingOfferColor,
  ) =>
          BlocBuilder<
              TrainingOfferMessageDynamicByGroupOfTrainingOfferConversationBloc,
              TrainingOfferMessageDynamicByGroupOfTrainingOfferConversationState>(
            builder: (context, messageState) {
              List<int?> uniqueListOfTraineeId = <int?>[];
              List<TrainingOfferMessageDynamic> messageListByUniqueTrainee = [];
              _createListOfTrainingOfferConversationId(
                  context, uniqueListOfTraineeId);
              _addTheMessagesInMessageListByUniqueTraineeId(
                  context,
                  messageState,
                  messageListByUniqueTrainee,
                  uniqueListOfTraineeId);
              switch (messageState.status) {
                case Status.initial:
                  return _createSkeltonContainer();
                case Status.loading:
                  return _createSkeltonContainer();
                case Status.success:
                  return _displayTheLastMessage(
                      context,
                      messageListByUniqueTrainee,
                      bodyLarge,
                      pastTrainingOfferColor);
                case Status.failure:
                  return StateError(error: messageState.error);
              }
            },
          );

  /// DISPLAY ==========================================================================================================
  NetworkImage _displayActivityImage(BuildContext context, int index) =>
      _findActivityImage(context, index);

  String _displayTraineeUsername(
    BuildContext context,
    int index,
  ) =>
      context
          .read<GroupedTrainingOfferConversationDynamicByUserCubit>()
          .state
          .groupedTrainingOfferConversationDynamicList
          .elementAt(index)
          .trainingOfferConversationId
          .toString();
  // _findTraineeUsername(context, index);

  String _displayDate(
    BuildContext context,
    int index,
  ) =>
      _appDateFormat.monthAndDayWithDayName.format(_findDate(context, index));

  String _displayDayDifferences(
    BuildContext context,
    int index,
  ) =>
      _appFunctions.showDayDifference(_findDate(context, index));

  AppHeaderText _displayTheLastMessage(
    BuildContext context,
    List<TrainingOfferMessageDynamic> messageListByUniqueTrainee,
    TextStyle bodyLarge,
    Color pastTrainingOfferColor,
  ) =>
      AppHeaderText(
          textLabel: _displayMessageText(messageListByUniqueTrainee),
          textStyle:
              _determineTextStyle(false, bodyLarge, pastTrainingOfferColor));

  String _displayMessageText(
    List<TrainingOfferMessageDynamic> messageListByUniqueTrainee,
  ) =>
      messageListByUniqueTrainee.isEmpty
          ? ''
          : _displayMessageTextWithMax30Character(messageListByUniqueTrainee);

  String _displayMessageTextWithMax30Character(
      List<TrainingOfferMessageDynamic> messageListByUniqueTrainee) {
    return _findLastMessageLenght(messageListByUniqueTrainee) > 30
        ? '${messageListByUniqueTrainee.last.messageContent.substring(0, 30)}...'
        : messageListByUniqueTrainee.last.messageContent
            .substring(0, _findLastMessageLenght(messageListByUniqueTrainee));
  }

  /// METHODS ==========================================================================================================
  void _addTheMessagesInMessageListByUniqueTraineeId(
    BuildContext context,
    TrainingOfferMessageDynamicByGroupOfTrainingOfferConversationState
        messageState,
    List<TrainingOfferMessageDynamic> messageListByUniqueTrainee,
    List<int?> uniqueListOfTraineeId,
  ) {
    for (var element in messageState.trainingOfferMessageDynamicList) {
      if (element.trainingOfferConversationDynamic.trainingOfferResponseDynamic
              .trainee.uId ==
          uniqueListOfTraineeId.elementAt(index)) {
        messageListByUniqueTrainee.add(element);
      }
    }
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  //
  //String _findTraineeUsername(
  //   BuildContext context,
  //   int index,
  // ) =>
  //     context
  //         .read<GroupedTrainingOfferConversationDynamicByUserCubit>()
  //         .state
  //         .groupedTrainingOfferConversationDynamicList
  //         .elementAt(index)
  //         .trainingOfferResponseDynamic
  //         .trainee
  //         .username;

  int _findLastMessageLenght(
    List<TrainingOfferMessageDynamic> messageListByUniqueTrainee,
  ) =>
      messageListByUniqueTrainee.last.messageContent.length;

  DateTime _findDate(
    BuildContext context,
    int index,
  ) =>
      context
          .read<GroupedTrainingOfferConversationDynamicByUserCubit>()
          .state
          .groupedTrainingOfferConversationDynamicList
          .elementAt(index)
          .trainingOfferResponseDynamic
          .approvedDate!;

  NetworkImage _findActivityImage(
    BuildContext context,
    int index,
  ) =>
      NetworkImage(context
          .read<GroupedTrainingOfferConversationDynamicByUserCubit>()
          .state
          .groupedTrainingOfferConversationDynamicList
          .elementAt(index)
          .trainingOfferResponseDynamic
          .trainee
          .picUrl);

  /// Check Methods ----------------------------------------------------------------------------------------------------
  // Iterable<TrainingOfferConversationDynamic> _checkAndFindUniqueActivity(
  //   GroupedTrainingOfferConversationDynamicByUserState
  //       chosenConversationState,
  //   int index,
  // ) =>
  //     chosenConversationState
  //         .groupedTrainingOfferConversationDynamicByUser
  //         .where((element) =>
  //             element.trainingOfferResponseDynamic.trainingOfferDynamic
  //                 .trainingOfferId ==
  //             chosenConversationState
  //                 .groupedTrainingOfferConversationDynamicByUser
  //                 .elementAt(index)
  //                 .trainingOfferResponseDynamic
  //                 .trainingOfferDynamic
  //                 .trainingOfferId);

  /// Other Methods ----------------------------------------------------------------------------------------------------
  TextStyle _determineTextStyle(
    bool checkMethod,
    TextStyle textStyle,
    Color pastTrainingOfferColor,
  ) =>
      checkMethod
          ? textStyle
          : textStyle.copyWith(color: pastTrainingOfferColor);

  void _createListOfTrainingOfferConversationId(
    BuildContext context,
    List<int?> uniqueListOfTraineeId,
  ) {
    for (var element in context
        .read<GroupedTrainingOfferConversationDynamicByUserCubit>()
        .state
        .groupedTrainingOfferConversationDynamicList) {
      if (uniqueListOfTraineeId
          .contains(element.trainingOfferResponseDynamic.trainee.uId)) {
      } else {
        uniqueListOfTraineeId
            .add(element.trainingOfferResponseDynamic.trainee.uId);
      }
    }
  }
}
