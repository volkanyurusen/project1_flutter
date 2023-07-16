import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/screens/message/local_widgets/zlocal_widget.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenFindACoachConversationBox extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppFunctions _appFunctions = AppFunctions();
  final AppDateFormat _appDateFormat = AppDateFormat();
  final double screenWidth;
  final int index;

  ChosenFindACoachConversationBox({
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
    final Color pastFindACoachColor = _appColors.textColor;

    return SizedBox(
      height: boxHeight,
      width: screenWidth,
      child: _createChosenFindACoachConversationBoxArea(
          context,
          index,
          imageBoxHeight,
          imageBoxWidth,
          headlineSmall,
          bodyLarge,
          pastFindACoachColor),
    );
  }

  /// CREATE ===========================================================================================================
  ConversationBox _createChosenFindACoachConversationBoxArea(
    BuildContext context,
    int index,
    double imageBoxHeight,
    double imageBoxWidth,
    TextStyle headlineSmall,
    TextStyle bodyLarge,
    Color pastFindACoachColor,
  ) =>
      ConversationBox(
        imageWidget: _displayActivityImage(context, index),
        textOf: _displayCoachUsername(context, index),
        textDetailOf: _displayPerLessonPrice(context, index),
        textOfDate: _displayDate(context, index),
        textOfDateDetail: _displayDayDifferences(context, index),
        isActivityNotPassed: true,
        pastActivityColor: pastFindACoachColor,
        widget:
            _buildAndDisplayTheLastMessageOfTheRelevantFindACoachConversationArea(
                context, bodyLarge, pastFindACoachColor),
      );

  /// SKELTON ==========================================================================================================
  SkeltonContainer _createSkeltonContainer() =>
      SkeltonContainer(height: 14, width: 180);

  /// BUILD ============================================================================================================
  BlocBuilder<FindACoachMessageDynamicByGroupOfFindACoachConversationBloc,
          FindACoachMessageDynamicByGroupOfFindACoachConversationState>
      _buildAndDisplayTheLastMessageOfTheRelevantFindACoachConversationArea(
    BuildContext context,
    TextStyle bodyLarge,
    Color pastFindACoachColor,
  ) =>
          BlocBuilder<
              FindACoachMessageDynamicByGroupOfFindACoachConversationBloc,
              FindACoachMessageDynamicByGroupOfFindACoachConversationState>(
            builder: (context, messageState) {
              List<int?> uniqueListOfCoachUserId = <int?>[];
              List<TrainingOfferMessageDynamic> messageListByUniqueCoachUser =
                  [];
              _createListOfTrainingOfferConversationId(
                  context, uniqueListOfCoachUserId);
              _addTheMessagesInMessageListByUniqueCoachUserId(
                  context,
                  messageState,
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
                      pastFindACoachColor);
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
          .read<GroupedFindACoachConversationDynamicByTraineeCubit>()
          .state
          .groupedFindACoachConversationDynamicList
          .elementAt(index)
          .trainingOfferConversationId
          .toString();

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
    List<TrainingOfferMessageDynamic> messageListByUniqueCoachUser,
    TextStyle bodyLarge,
    Color pastFindACoachColor,
  ) =>
      AppHeaderText(
          textLabel: _displayMessageText(messageListByUniqueCoachUser),
          textStyle:
              _determineTextStyle(false, bodyLarge, pastFindACoachColor));

  String _displayMessageText(
    List<TrainingOfferMessageDynamic> messageListByUniqueCoachUser,
  ) =>
      messageListByUniqueCoachUser.isEmpty
          ? ''
          : _displayMessageTextWithMax30Character(messageListByUniqueCoachUser);

  String _displayMessageTextWithMax30Character(
      List<TrainingOfferMessageDynamic> messageListByUniqueCoachUser) {
    return _findLastMessageLenght(messageListByUniqueCoachUser) > 28
        ? '${messageListByUniqueCoachUser.last.messageContent.substring(0, 28)}...'
        : messageListByUniqueCoachUser.last.messageContent
            .substring(0, _findLastMessageLenght(messageListByUniqueCoachUser));
  }

  /// METHODS ==========================================================================================================
  void _addTheMessagesInMessageListByUniqueCoachUserId(
    BuildContext context,
    FindACoachMessageDynamicByGroupOfFindACoachConversationState messageState,
    // Set<int?> uniqueListOfTrainingRequestResponseId,
    List<TrainingOfferMessageDynamic> messageListByUniqueCoachUser,
    List<int?> uniqueListOfCoachUserId,
  ) {
    for (var element in messageState.trainingOfferMessageDynamicList) {
      if (element.trainingOfferConversationDynamic.trainingOfferResponseDynamic
              .trainingOfferDynamic.coachDynamic.userDynamic.uId ==
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
  //         .read<GroupedFindACoachConversationDynamicByTraineeCubit>()
  //         .state
  //         .groupedFindACoachConversationDynamicList
  //         .elementAt(index)
  //         .trainingOfferResponseDynamic
  //         .trainingOfferDynamic.coachDynamic
  //         .userDynamic
  //         .username;

  int _findLastMessageLenght(
    List<TrainingOfferMessageDynamic> messageListByUniqueCoachUser,
  ) =>
      messageListByUniqueCoachUser.last.messageContent.length;

  int _findPerLessonPrice(
    BuildContext context,
    int index,
  ) =>
      context
          .read<GroupedFindACoachConversationDynamicByTraineeCubit>()
          .state
          .groupedFindACoachConversationDynamicList
          .elementAt(index)
          .trainingOfferResponseDynamic
          .trainingOfferDynamic
          .coachDynamic
          .perLessonPrice;

  DateTime _findDate(
    BuildContext context,
    int index,
  ) =>
      context
          .read<GroupedFindACoachConversationDynamicByTraineeCubit>()
          .state
          .groupedFindACoachConversationDynamicList
          .elementAt(index)
          .trainingOfferResponseDynamic
          .approvedDate!;

  NetworkImage _findActivityImage(
    BuildContext context,
    int index,
  ) =>
      NetworkImage(context
          .read<GroupedFindACoachConversationDynamicByTraineeCubit>()
          .state
          .groupedFindACoachConversationDynamicList
          .elementAt(index)
          .trainingOfferResponseDynamic
          .trainingOfferDynamic
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
  //             element.trainingOfferResponseDynamic.trainingRequestDynamic
  //                 .trainingRequestId ==
  //             chosenConversationState
  //                 .groupedTrainingRequestConversationDynamicByUser
  //                 .elementAt(index)
  //                 .trainingOfferResponseDynamic
  //                 .trainingRequestDynamic
  //                 .trainingRequestId);

  /// Other Methods ----------------------------------------------------------------------------------------------------
  TextStyle _determineTextStyle(
    bool checkMethod,
    TextStyle textStyle,
    Color pastFindACoachColor,
  ) =>
      checkMethod ? textStyle : textStyle.copyWith(color: pastFindACoachColor);

  void _createListOfTrainingOfferConversationId(
    BuildContext context,
    List<int?> uniqueListOfCoachUserId,
  ) {
    for (var element in context
        .read<GroupedFindACoachConversationDynamicByTraineeCubit>()
        .state
        .groupedFindACoachConversationDynamicList) {
      if (uniqueListOfCoachUserId.contains(element.trainingOfferResponseDynamic
          .trainingOfferDynamic.coachDynamic.userDynamic.uId)) {
      } else {
        uniqueListOfCoachUserId.add(element.trainingOfferResponseDynamic
            .trainingOfferDynamic.coachDynamic.userDynamic.uId);
      }
    }
  }
}
