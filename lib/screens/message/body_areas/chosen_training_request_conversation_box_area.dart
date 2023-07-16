import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/widgets/widget.dart';

import '../local_widgets/zlocal_widget.dart';

class ChosenTrainingRequestConversationBox extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppFunctions _appFunctions = AppFunctions();
  final AppDateFormat _appDateFormat = AppDateFormat();
  final double screenWidth;
  final int index;

  ChosenTrainingRequestConversationBox({
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
    final Color pastTrainingRequestColor = _appColors.textColor;

    return SizedBox(
      height: boxHeight,
      width: screenWidth,
      child: _createChosenTrainingRequestConversationBoxArea(
          context,
          index,
          imageBoxHeight,
          imageBoxWidth,
          headlineSmall,
          bodyLarge,
          pastTrainingRequestColor),
    );
  }

  /// CREATE ===========================================================================================================
  ConversationBox _createChosenTrainingRequestConversationBoxArea(
    BuildContext context,
    int index,
    double imageBoxHeight,
    double imageBoxWidth,
    TextStyle headlineSmall,
    TextStyle bodyLarge,
    Color pastTrainingRequestColor,
  ) =>
      ConversationBox(
        imageWidget: _displayActivityImage(context, index),
        textOf: _displayCoachUsername(context, index),
        textDetailOf: _displayPerLessonPrice(context, index),
        textOfDate: _displayDate(context, index),
        textOfDateDetail: _displayDayDifferences(context, index),
        isActivityNotPassed: true,
        pastActivityColor: pastTrainingRequestColor,
        widget:
            _buildAndDisplayTheLastMessageOfTheRelevantActvitiyConversationArea(
                context, bodyLarge, pastTrainingRequestColor),
      );

  /// SKELTON ==========================================================================================================
  SkeltonContainer _createSkeltonContainer() =>
      SkeltonContainer(height: 14, width: 180);

  /// BUILD ============================================================================================================
  BlocBuilder<
          TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationBloc,
          TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationState>
      _buildAndDisplayTheLastMessageOfTheRelevantActvitiyConversationArea(
    BuildContext context,
    TextStyle bodyLarge,
    Color pastTrainingRequestColor,
  ) =>
          BlocBuilder<
              TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationBloc,
              TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationState>(
            builder: (context, messageState) {
              List<int?> uniqueListOfCoachUserId = <int?>[];
              List<TrainingRequestMessageDynamic> messageListByUniqueCoachUser =
                  [];
              _createListOfTrainingRequestConversationId(
                  context, uniqueListOfCoachUserId);
              _addTheMessagesInMessageListByUniqueCoachUserId(
                  context,
                  messageState,
                  // uniqueListOfTrainingRequestResponseId,
                  messageListByUniqueCoachUser,
                  uniqueListOfCoachUserId);
              switch (messageState.status) {
                case Status.initial:
                  return _createSkeltonContainer();
                case Status.loading:
                  return _createSkeltonContainer();
                case Status.success:
                  return _displayTheLastMessage(
                      context,
                      messageListByUniqueCoachUser,
                      bodyLarge,
                      pastTrainingRequestColor);
                case Status.failure:
                  return StateError(error: messageState.error);
              }
            },
          );

  /// DISPLAY ==========================================================================================================
  NetworkImage _displayActivityImage(BuildContext context, int index) =>
      _findActivityImage(context, index);

  String _displayCoachUsername(
    BuildContext context,
    int index,
  ) =>
      context
          .read<GroupedTrainingRequestConversationDynamicByUserCubit>()
          .state
          .groupedTrainingRequestConversationDynamicList
          .elementAt(index)
          .trainingRequestConversationId
          .toString();
  // _findCoachUsername(context, index);

  String _displayPerLessonPrice(
    BuildContext context,
    int index,
  ) =>
      '(${_findPerLessonPrice(context, index)})';

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
    List<TrainingRequestMessageDynamic> messageListByUniqueCoachUser,
    TextStyle bodyLarge,
    Color pastTrainingRequestColor,
  ) =>
      AppHeaderText(
          textLabel: _displayMessageText(messageListByUniqueCoachUser),
          textStyle:
              _determineTextStyle(false, bodyLarge, pastTrainingRequestColor));

  String _displayMessageText(
    List<TrainingRequestMessageDynamic> messageListByUniqueCoachUser,
  ) =>
      messageListByUniqueCoachUser.isEmpty
          ? ''
          : _displayMessageTextWithMax30Character(messageListByUniqueCoachUser);

  String _displayMessageTextWithMax30Character(
      List<TrainingRequestMessageDynamic> messageListByUniqueCoachUser) {
    return _findLastMessageLenght(messageListByUniqueCoachUser) > 28
        ? '${messageListByUniqueCoachUser.last.messageContent.substring(0, 28)}...'
        : messageListByUniqueCoachUser.last.messageContent
            .substring(0, _findLastMessageLenght(messageListByUniqueCoachUser));
  }

  /// METHODS ==========================================================================================================
  void _addTheMessagesInMessageListByUniqueCoachUserId(
    BuildContext context,
    TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationState
        messageState,
    // Set<int?> uniqueListOfTrainingRequestResponseId,
    List<TrainingRequestMessageDynamic> messageListByUniqueCoachUser,
    List<int?> uniqueListOfCoachUserId,
  ) {
    for (var element in messageState.trainingRequestMessageDynamicList) {
      if (element.trainingRequestConversationDynamic
              .trainingRequestResponseDynamic.coachDynamic.userDynamic.uId ==
          uniqueListOfCoachUserId.elementAt(index)) {
        messageListByUniqueCoachUser.add(element);
      }
    }
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  //
  //String _findCoachUsername(
  //   BuildContext context,
  //   int index,
  // ) =>
  //     context
  //         .read<GroupedTrainingRequestConversationDynamicByUserCubit>()
  //         .state
  //         .groupedTrainingRequestConversationDynamicList
  //         .elementAt(index)
  //         .trainingRequestResponseDynamic
  //         .coachDynamic
  //         .userDynamic
  //         .username;

  int _findLastMessageLenght(
    List<TrainingRequestMessageDynamic> messageListByUniqueCoachUser,
  ) =>
      messageListByUniqueCoachUser.last.messageContent.length;

  int _findPerLessonPrice(
    BuildContext context,
    int index,
  ) =>
      context
          .read<GroupedTrainingRequestConversationDynamicByUserCubit>()
          .state
          .groupedTrainingRequestConversationDynamicList
          .elementAt(index)
          .trainingRequestResponseDynamic
          .coachDynamic
          .perLessonPrice;

  DateTime _findDate(
    BuildContext context,
    int index,
  ) =>
      context
          .read<GroupedTrainingRequestConversationDynamicByUserCubit>()
          .state
          .groupedTrainingRequestConversationDynamicList
          .elementAt(index)
          .trainingRequestResponseDynamic
          .approvedDate!;

  NetworkImage _findActivityImage(
    BuildContext context,
    int index,
  ) =>
      NetworkImage(context
          .read<GroupedTrainingRequestConversationDynamicByUserCubit>()
          .state
          .groupedTrainingRequestConversationDynamicList
          .elementAt(index)
          .trainingRequestResponseDynamic
          .coachDynamic
          .userDynamic
          .picUrl);

  /// Check Methods ----------------------------------------------------------------------------------------------------
  // Iterable<TrainingRequestConversationDynamic> _checkAndFindUniqueActivity(
  //   GroupedTrainingRequestConversationDynamicByUserState
  //       chosenConversationState,
  //   int index,
  // ) =>
  //     chosenConversationState
  //         .groupedTrainingRequestConversationDynamicByUser
  //         .where((element) =>
  //             element.trainingRequestResponseDynamic.trainingRequestDynamic
  //                 .trainingRequestId ==
  //             chosenConversationState
  //                 .groupedTrainingRequestConversationDynamicByUser
  //                 .elementAt(index)
  //                 .trainingRequestResponseDynamic
  //                 .trainingRequestDynamic
  //                 .trainingRequestId);

  /// Other Methods ----------------------------------------------------------------------------------------------------
  TextStyle _determineTextStyle(
    bool checkMethod,
    TextStyle textStyle,
    Color pastTrainingRequestColor,
  ) =>
      checkMethod
          ? textStyle
          : textStyle.copyWith(color: pastTrainingRequestColor);

  void _createListOfTrainingRequestConversationId(
    BuildContext context,
    List<int?> uniqueListOfCoachUserId,
  ) {
    for (var element in context
        .read<GroupedTrainingRequestConversationDynamicByUserCubit>()
        .state
        .groupedTrainingRequestConversationDynamicList) {
      if (uniqueListOfCoachUserId.contains(element
          .trainingRequestResponseDynamic.coachDynamic.userDynamic.uId)) {
      } else {
        uniqueListOfCoachUserId.add(element
            .trainingRequestResponseDynamic.coachDynamic.userDynamic.uId);
      }
    }
  }
}
