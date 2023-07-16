import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/screens/message/local_widgets/zlocal_widget.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenConversationOfActivityBodyMessageContentArea
    extends StatefulWidget {
  const ChosenConversationOfActivityBodyMessageContentArea({Key? key})
      : super(key: key);

  @override
  State<ChosenConversationOfActivityBodyMessageContentArea> createState() =>
      _ChosenConversationOfActivityBodyMessageContentAreaState();
}

class _ChosenConversationOfActivityBodyMessageContentAreaState
    extends State<ChosenConversationOfActivityBodyMessageContentArea> {
  final AppFunctions _appFunctions = AppFunctions();
  final AppDateFormat _appDateFormat = AppDateFormat();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final ScrollController _scrollController = ScrollController();
  final int onWhichNumber = 0;
  double _maxExt = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return MessageContentAreaWithMessageTextFieldWithButton(
      children: [
        //
        // createMessageContentBody(),
        _buildMessageDateAndContentArea(onWhichNumber),
        _createMessageTextFieldAreaWithButton()
      ],
    );
  }

  /// BLOC =============================================================================================================
  BlocBuilder<MessageDynamicByActivityConversationBloc,
          MessageDynamicByActivityConversationState>
      _buildMessageDateAndContentArea(
    onWhichNumber,
  ) =>
          BlocBuilder<MessageDynamicByActivityConversationBloc,
                  MessageDynamicByActivityConversationState>(
              builder: (context, state) {
            List<DateTime> uniqueListOfMessageDate = <DateTime>[];
            _createListOfSentMessageDate(state, uniqueListOfMessageDate);
            switch (state.status) {
              case StatusWithoutLoading.initial:
                return const Expanded(child: StateLoading());
              case StatusWithoutLoading.success:
                if (state.messageDynamicList.isEmpty) {
                  return MessageContentAreaNoMessage();
                } else {
                  return Expanded(
                      child: AppBody(
                          child: SingleChildScrollView(
                              controller: _scrollController,
                              child: CustomColumn(
                                  children: _generateMessageDateAndContentArea(
                                      state,
                                      onWhichNumber,
                                      uniqueListOfMessageDate)))));
                }
              case StatusWithoutLoading.failure:
                return StateError(error: state.error);
            }
          });

  /// CREATE ===========================================================================================================
  //
  //Widget createMessageContentBody(
  //   ChosenActivityMessageDynamicByUserCubit
  //       chosenActivityMessageDynamicByUserCubit,
  // ) =>
  //     _checkWhetherThereIsAnyMessage(chosenActivityMessageDynamicByUserCubit)
  //         ? MessageContentAreaNoMessage()
  //         : _buildMessageDateAndContentArea();

  MessageTextFieldWithButton _createMessageTextFieldAreaWithButton() =>
      MessageTextFieldWithButton(
        sendMessageContent: () {
          if (kDebugMode) {
            print('Sending button has just beeen clicked!!!');
          }
        },
      );

  /// GENERATE =========================================================================================================
  List<Widget> _generateMessageDateAndContentArea(
    MessageDynamicByActivityConversationState state,
    int onWhichNumber,
    List<DateTime> uniqueListOfMessageDate,
  ) {
    return List.generate(
        state.hasReachedMax
            ? uniqueListOfMessageDate.length
            : uniqueListOfMessageDate.length + 1, (index) {
      if (_scrollController.positions.isNotEmpty) {
        _maxExt = _scrollController.position.maxScrollExtent;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollController
          .jumpTo(_scrollController.position.maxScrollExtent - _maxExt));
      if (index >= uniqueListOfMessageDate.length) {
        return const BottomLoader();
      } else {
        return CustomColumn(children: [
          const CustomAppSizedBox(height: 18),
          _displayMessageDateBox(uniqueListOfMessageDate, index),
          CustomColumn(
            children: List.generate(
              state.messageDynamicList
                  .where((element) =>
                      DateUtils.dateOnly(element.sentAt) ==
                      uniqueListOfMessageDate.elementAt(index))
                  .toList()
                  .length,
              (secondIndex) {
                int chosenIndex = onWhichNumber;
                onWhichNumber++;
                return _createMessageContentColumn(state, chosenIndex);
              },
            ).reversed.toList(),
          )
        ]);
      }
    }).reversed.toList();
  }

  // /// CREATE ===========================================================================================================
  // CustomColumn _createMessageDateAndContentColum(
  //   int index,
  //   MessageDynamicByActivityConversationState state,
  // ) =>
  //     CustomColumn(
  //       children: [
  //         const CustomAppSizedBox(height: 18),
  //         _displayMessageDateBox(index),
  //         CustomColumn(
  //           children: _generateMessageContentArea(state),
  //         )
  //       ],
  //     );

  // /// GENERATE =========================================================================================================
  // List<Widget> _generateMessageContentArea(
  //   MessageDynamicByActivityConversationState state,
  // ) =>
  //     List.generate(
  //       state.messageDynamicList.length,
  //       (index) => _createMessageContentColumn(state, index),
  //     );

  /// CREATE ===========================================================================================================
  CustomColumn _createMessageContentColumn(
    MessageDynamicByActivityConversationState state,
    int index,
  ) =>
      CustomColumn(
        children: [
          const CustomAppSizedBox(),
          _displayMessageContentBox(state, index)
        ],
      );

  /// DISPLAY ==========================================================================================================
  /// Message Date -----------------------------------------------------------------------------------------------------
  MessageDateBox _displayMessageDateBox(
    List<DateTime> uniqueListOfMessageDate,
    int onWhichNumber,
  ) =>
      MessageDateBox(
          dateDetail:
              _displayDateDetail(uniqueListOfMessageDate, onWhichNumber),
          dateDifference:
              _displayDayDifference(uniqueListOfMessageDate, onWhichNumber));

  String _displayDateDetail(uniqueListOfMessageDate, int index) =>
      _checkWhetherSentMessageEarlierThanSevenDaysBefore(
              uniqueListOfMessageDate, index)
          ? displayDateAndDay(uniqueListOfMessageDate, index)
          : displayDayOnly(uniqueListOfMessageDate, index);

  String displayDayOnly(
    List<DateTime> uniqueListOfMessageDate,
    int index,
  ) =>
      _appDateFormat.displayedDayFormat
          .format(uniqueListOfMessageDate.elementAt(index));

  String displayDateAndDay(
    List<DateTime> uniqueListOfMessageDate,
    int index,
  ) =>
      _appDateFormat.displayedDateAndDayFormat
          .format(uniqueListOfMessageDate.elementAt(index))
          .toString();

  String _displayDayDifference(
    List<DateTime> uniqueListOfMessageDate,
    int index,
  ) =>
      _appFunctions.showDayDifference(uniqueListOfMessageDate.elementAt(index));

  /// Message Content --------------------------------------------------------------------------------------------------
  MessageContentBox _displayMessageContentBox(
          MessageDynamicByActivityConversationState state, int index) =>
      MessageContentBox(
          isMessageWrittenByAppuser:
              _checkWhetherMessageSentByAppUser(state, index),
          username: _displaySenderUsername(state, index),
          messageContent: _displayMessageContent(state, index),
          messageTime: _displaySentTime(state, index));

  String _displaySenderUsername(
    MessageDynamicByActivityConversationState state,
    int index,
  ) =>
      state.messageDynamicList.elementAt(index).sender.username;

  String _displayMessageContent(
    MessageDynamicByActivityConversationState state,
    int index,
  ) =>
      state.messageDynamicList.elementAt(index).message;

  String _displaySentTime(
    MessageDynamicByActivityConversationState state,
    int index,
  ) =>
      _appDateFormat.hourAndMinutesOnly.format(_findSendingTime(state, index));

  /// METHODS ==========================================================================================================
  DateTime _findSevenDaysBeforeThanToday() =>
      DateUtils.dateOnly(DateTime.now()).subtract(const Duration(days: 7));

  void _createListOfSentMessageDate(
    MessageDynamicByActivityConversationState state,
    List<DateTime> uniqueListOfMessageDate,
  ) {
    for (var element in state.messageDynamicList) {
      if (uniqueListOfMessageDate
          .contains(DateUtils.dateOnly(element.sentAt))) {
      } else {
        uniqueListOfMessageDate.add(DateUtils.dateOnly(element.sentAt));
      }
    }
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherSentMessageEarlierThanSevenDaysBefore(
    List<DateTime> uniqueListOfMessageDate,
    int index,
  ) =>
      uniqueListOfMessageDate
          .elementAt(index)
          .isBefore(_findSevenDaysBeforeThanToday());

  bool _checkWhetherMessageSentByAppUser(
    MessageDynamicByActivityConversationState state,
    int index,
  ) =>
      _findUserIdOfSender(state, index) == _appNumberConstants.appUserId;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  int? _findUserIdOfSender(
    MessageDynamicByActivityConversationState state,
    int index,
  ) =>
      state.messageDynamicList.elementAt(index).sender.uId;

  DateTime _findSendingTime(
    MessageDynamicByActivityConversationState state,
    int index,
  ) =>
      state.messageDynamicList.elementAt(index).sentAt;

  int _findMessageListLangth() => context
      .read<MessageDynamicByActivityConversationBloc>()
      .state
      .messageDynamicList
      .length;

  int _findCreatedActivityId() => context
      .read<MessageDynamicByActivityConversationBloc>()
      .state
      .messageDynamicList
      .first
      .activityConversationDynamic
      .consistedActivityDynamic
      .createdActivityDynamic
      .createdActivityId!;

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    //
    // print('maxExtent is: ${_scrollController.position.maxScrollExtent}');
    // print('pixels is: ${_scrollController.position.pixels}');
    // print(
    //     'diff is : ${_scrollController.position.maxScrollExtent - _scrollController.position.pixels}}');
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels == 0) {
        context.read<MessageDynamicByActivityConversationBloc>().add(
            LoadMessageDynamicByActivityConversationEvent(
                createdActivityId: _findCreatedActivityId(),
                offset: _findMessageListLangth()));
      }
    }
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_project/constants/constants.dart';
// import 'package:my_project/logic/cubits/cubits.dart';
// import 'package:my_project/widgets/widget.dart';
//
// import '../local_widgets/zlocal_widget.dart';
//
// class ChosenConversationOfActivityBodyMessageContentArea
//     extends StatelessWidget {
//   final AppFunctions _appFunctions = AppFunctions();
//   final AppDateFormat _appDateFormat = AppDateFormat();
//   final AppNumberConstants _appNumberConstants = AppNumberConstants();
//   final Set<DateTime> uniqueListOfMessageDate;
//
//   ChosenConversationOfActivityBodyMessageContentArea({
//     required this.uniqueListOfMessageDate,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     ChosenActivityMessageDynamicByUserCubit
//         chosenActivityMessageDynamicByUserCubit =
//         context.read<ChosenActivityMessageDynamicByUserCubit>();
//     return chosenActivityMessageDynamicByUserCubit
//             .state.chosenActivityMessageDynamicByUser.isEmpty
//         ? MessageContentAreaNoMessage()
//         : MessageContentAreaWithMessageTextFieldWithButton(
//             children: [
//               BlocBuilder<ChosenActivityMessageDynamicByUserCubit,
//                   MessageDynamicByActivityConversationState>(
//                 builder: (context, state) {
//                   if (state
//                       .chosenActivityMessageDynamicByUser.isEmpty) {
//                     return MessageContentAreaNoMessage();
//                   } else {
//                     return MessageContentArea(
//                       children: List.generate(
//                         uniqueListOfMessageDate.length,
//                         (index) => CustomColumn(
//                           children: [
//                             const CustomAppSizedBox(height: 18),
//                             MessageDateBox(
//                                 dateDetail: uniqueListOfMessageDate
//                                         .elementAt(index)
//                                         .isBefore(DateTime.now())
//                                     ? _appDateFormat.displayedDateAndDayFormat
//                                         .format(uniqueListOfMessageDate
//                                             .elementAt(index))
//                                         .toString()
//                                     : _appDateFormat.displayedDayFormat.format(
//                                         uniqueListOfMessageDate
//                                             .elementAt(index)),
//                                 dateDifference: _appFunctions.showDayDifference(
//                                     uniqueListOfMessageDate.elementAt(index))),
//                             CustomColumn(
//                               children: List.generate(
//                                 state
//                                     .chosenActivityMessageDynamicByUser
//                                     .length,
//                                 (index) => Column(
//                                   children: [
//                                     const CustomAppSizedBox(),
//                                     MessageContentBox(
//                                         isMessageWrittenByAppuser: state
//                                                 .chosenActivityMessageDynamicByUser
//                                                 .elementAt(index)
//                                                 .sender
//                                                 .uId ==
//                                             _appNumberConstants.appUserId,
//                                         username: state
//                                             .chosenActivityMessageDynamicByUser
//                                             .elementAt(index)
//                                             .sender
//                                             .username,
//                                         messageContent: state
//                                             .chosenActivityMessageDynamicByUser
//                                             .elementAt(index)
//                                             .message,
//                                         messageTime: _appDateFormat
//                                             .hourAndMinutesOnly
//                                             .format(state
//                                                 .chosenActivityMessageDynamicByUser
//                                                 .elementAt(index)
//                                                 .sentAt))
//                                   ],
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     );
//                   }
//                 },
//               ),
//               MessageTextFieldWithButton(
//                 sendMessageContent: () =>
//                     print('Sending button has just beeen clicked!!!'),
//               )
//             ],
//           );
//   }
// }
