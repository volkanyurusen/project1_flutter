import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/widgets/widget.dart';

import '../local_widgets/zlocal_widget.dart';

class ActivityConversationBox extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppFunctions _appFunctions = AppFunctions();
  final AppDateFormat _appDateFormat = AppDateFormat();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final ActivityConversationDynamicByUserState conversationState;
  final List<int?> uniqueListOfCreatedActivityId;
  final double screenWidth;
  final int index;

  ActivityConversationBox({
    required this.conversationState,
    required this.uniqueListOfCreatedActivityId,
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
    final Color pastActivityColor = _appColors.secondary;

    return SizedBox(
      height: boxHeight,
      width: screenWidth,
      child: _createActivityConversationBoxArea(context, imageBoxHeight,
          imageBoxWidth, headlineSmall, bodyLarge, pastActivityColor),
    );
  }

  /// CREATE ===========================================================================================================
  ConversationBox _createActivityConversationBoxArea(
    BuildContext context,
    double imageBoxHeight,
    double imageBoxWidth,
    TextStyle headlineSmall,
    TextStyle bodyLarge,
    Color pastActivityColor,
  ) =>
      ConversationBox(
        imageWidget: _displayActivityImage(),
        textOf: _displayActivityTitleText(),
        textOfDate: _displayDate(),
        textOfDateDetail: _displayDayDifferences(),
        isActivityCreatedByAppUser: checkWhetherTheActivityIsCreatedByAppUser(),
        isActivityNotPassed: _checkDateInFuture(conversationState, index),
        widget:
            _buildAndDisplayTheLastMessageOfTheRelevantActvitiyConversationArea(
          bodyLarge,
          pastActivityColor,
        ),
      );

  /// SKELTON ==========================================================================================================
  SkeltonContainer _createSkeltonContainer() =>
      SkeltonContainer(height: 14, width: 180);

  /// BUILD ============================================================================================================
  BlocBuilder<MessageDynamicByGroupOfActivityConversationBloc,
          MessageDynamicByGroupOfActivityConversationState>
      _buildAndDisplayTheLastMessageOfTheRelevantActvitiyConversationArea(
    TextStyle bodyLarge,
    Color pastActivityColor,
  ) =>
          BlocBuilder<MessageDynamicByGroupOfActivityConversationBloc,
              MessageDynamicByGroupOfActivityConversationState>(
            builder: (context, messageState) {
              List<MessageDynamic> messageListByUniqueCreatedActivity = [];
              addTheMessagesInMessageListByUniqueCreatedActivity(
                  messageState, messageListByUniqueCreatedActivity);
              switch (messageState.status) {
                case StatusWithoutLoading.initial:
                  return _createSkeltonContainer();
                case StatusWithoutLoading.success:
                  return _displayTheLastMessage(
                      context,
                      messageListByUniqueCreatedActivity,
                      bodyLarge,
                      pastActivityColor);
                case StatusWithoutLoading.failure:
                  return StateError(error: messageState.error);
              }
            },
          );

  /// DISPLAY ==========================================================================================================
  AssetImage _displayActivityImage() => _findActivityImage();

  String _displayActivityTitleText() =>
      _appFunctions.setWithoutUnderscore(_findActivityTitle());

  String _displayDate() =>
      _appDateFormat.monthAndDayWithDayName.format(_findDate());

  String _displayDayDifferences() =>
      _appFunctions.showDayDifference(_findDate());

  AppHeaderText _displayTheLastMessage(
    BuildContext context,
    List<MessageDynamic> messageListByUniqueCreatedActivity,
    TextStyle bodyLarge,
    Color pastActivityColor,
  ) =>
      AppHeaderText(
          textLabel: _displayMessageText(messageListByUniqueCreatedActivity),
          textStyle: _determineTextStyle(
              _checkDateInFuture(conversationState, index),
              bodyLarge,
              pastActivityColor));

  String _displayMessageText(
    List<MessageDynamic> messageListByUniqueCreatedActivity,
  ) =>
      messageListByUniqueCreatedActivity.isEmpty
          ? ''
          : _displayMessageTextWithMax30Character(
              messageListByUniqueCreatedActivity);

  String _displayMessageTextWithMax30Character(
          List<MessageDynamic> messageListByUniqueCreatedActivity) =>
      _findLastMessageLenght(messageListByUniqueCreatedActivity) > 30
          ? '${messageListByUniqueCreatedActivity.last.message.substring(0, 30)}...'
          : messageListByUniqueCreatedActivity.last.message.substring(
              0, _findLastMessageLenght(messageListByUniqueCreatedActivity));

  /// METHODS ==========================================================================================================
  void addTheMessagesInMessageListByUniqueCreatedActivity(
    MessageDynamicByGroupOfActivityConversationState messageState,
    List<MessageDynamic> messageListByUniqueCreatedActivity,
  ) {
    for (var element in messageState.messageDynamicList) {
      if (_findCreatedActivityId(element) ==
          uniqueListOfCreatedActivityId.elementAt(index)) {
        messageListByUniqueCreatedActivity.add(element);
      }
    }
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findActivityTitle() =>
      '${_checkAndFindUniqueActivity().first.consistedActivityDynamic.createdActivityDynamic.createdActivityId}';

  int? _findCreatedActivityId(MessageDynamic element) => element
      .activityConversationDynamic
      .consistedActivityDynamic
      .createdActivityDynamic
      .createdActivityId;

  int _findLastMessageLenght(
          List<MessageDynamic> messageListByUniqueCreatedActivity) =>
      messageListByUniqueCreatedActivity.last.message.length;

  DateTime _findDate() => _checkAndFindUniqueActivity()
      .first
      .consistedActivityDynamic
      .createdActivityDynamic
      .createdAt;

  AssetImage _findActivityImage() => AssetImage(
      'assets/images/activities/${_checkAndFindUniqueActivity().first.consistedActivityDynamic.createdActivityDynamic.activityNameDynamic.activityTitle.toLowerCase()}.jpg');

  /// Check Methods ----------------------------------------------------------------------------------------------------
  Iterable<ActivityConversationDynamic> _checkAndFindUniqueActivity() =>
      conversationState.activityConversationDynamicList.where((element) =>
          element.consistedActivityDynamic.createdActivityDynamic
              .createdActivityId ==
          uniqueListOfCreatedActivityId.elementAt(index));

  bool checkWhetherTheActivityIsCreatedByAppUser() =>
      _checkAndFindUniqueActivity()
          .first
          .consistedActivityDynamic
          .createdActivityDynamic
          .host
          .uId ==
      _appNumberConstants.appUserId;

  bool _checkDateInFuture(
    ActivityConversationDynamicByUserState conversationState,
    int index,
  ) =>
      _checkAndFindUniqueActivity()
          .first
          .consistedActivityDynamic
          .createdActivityDynamic
          .createdAt
          .isAfter(DateTime.now());

  /// Other Methods ----------------------------------------------------------------------------------------------------
  TextStyle _determineTextStyle(
    bool checkMethod,
    TextStyle textStyle,
    Color pastActivityColor,
  ) =>
      checkMethod ? textStyle : textStyle.copyWith(color: pastActivityColor);
}
