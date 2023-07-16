import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/screens/message/local_widgets/zlocal_widget.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenConversationOfTrainingRequestBodyMessageContentArea
    extends StatefulWidget {
  const ChosenConversationOfTrainingRequestBodyMessageContentArea({Key? key})
      : super(key: key);

  @override
  State<ChosenConversationOfTrainingRequestBodyMessageContentArea>
      createState() =>
          _ChosenConversationOfTrainingRequestBodyMessageContentAreaState();
}

class _ChosenConversationOfTrainingRequestBodyMessageContentAreaState
    extends State<ChosenConversationOfTrainingRequestBodyMessageContentArea> {
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
  BlocBuilder<TrainingRequestMessageDynamicByTrainingRequestConversationBloc,
          TrainingRequestMessageDynamicByTrainingRequestConversationState>
      _buildMessageDateAndContentArea(
    int onWhichNumber,
  ) =>
          BlocBuilder<
                  TrainingRequestMessageDynamicByTrainingRequestConversationBloc,
                  TrainingRequestMessageDynamicByTrainingRequestConversationState>(
              builder: (context, state) {
            List<DateTime> uniqueListOfMessageDate = <DateTime>[];
            _createListOfSentMessageDate(state, uniqueListOfMessageDate);
            switch (state.status) {
              case StatusWithoutLoading.initial:
                return const Expanded(child: StateLoading());
              case StatusWithoutLoading.success:
                if (state.trainingRequestMessageDynamicList.isEmpty) {
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
  //Widget createMessageContentBody() =>
  //     _checkWhetherThereIsAnyMessage()
  //         ? MessageContentAreaNoMessage()
  //         : _buildMessageDateAndContentArea();

  MessageTextFieldWithButton _createMessageTextFieldAreaWithButton() =>
      MessageTextFieldWithButton(sendMessageContent: () {
        if (kDebugMode) {
          print('Sending button has just beeen clicked!!!');
        }
      });

  /// GENERATE =========================================================================================================
  List<Widget> _generateMessageDateAndContentArea(
    TrainingRequestMessageDynamicByTrainingRequestConversationState state,
    int onWhichNumber,
    List<DateTime> uniqueListOfMessageDate,
  ) {
    //
    // if (_scrollController.positions.isNotEmpty) {
    //   print('pix: $_maxExt');
    //   print('maxScrollExtent: ${_scrollController.position.maxScrollExtent}');
    // }
    return List.generate(
        state.hasReachedMax
            ? uniqueListOfMessageDate.length
            : uniqueListOfMessageDate.length + 1, (index) {
      if (_scrollController.positions.isNotEmpty) {
        _maxExt = _scrollController.position.maxScrollExtent;
      }
      //
      // WidgetsBinding.instance.addPostFrameCallback((_) => {
      //       _scrollController
      //           .jumpTo(_scrollController.position.maxScrollExtent - _maxExt)
      //     });
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollController
          .jumpTo(_scrollController.position.maxScrollExtent - _maxExt));
      if (index >= uniqueListOfMessageDate.length) {
        return const BottomLoader();
      } else {
        return CustomColumn(
          children: [
            const CustomAppSizedBox(height: 18),
            _displayMessageDateBox(uniqueListOfMessageDate, index),
            CustomColumn(
              children: List.generate(
                state.trainingRequestMessageDynamicList
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
          ],
        );
      }
    }).reversed.toList();
  }
  // /// CREATE ===========================================================================================================
  // CustomColumn _createMessageDateAndContentColum(
  //   TrainingRequestMessageDynamicByTrainingRequestConversationState state,
  //   int onWhichNumber,
  //   List<DateTime> uniqueListOfMessageDate,
  //   int index,
  // ) =>
  //     CustomColumn(
  //       children: [
  //         const CustomAppSizedBox(height: 18),
  //         _displayMessageDateBox(uniqueListOfMessageDate, index),
  //         CustomColumn(
  //           children: _generateMessageContentArea(
  //               state, onWhichNumber, uniqueListOfMessageDate, index),
  //         )
  //       ],
  //     );

  // /// GENERATE =========================================================================================================
  // List<Widget> _generateMessageContentArea(
  //   TrainingRequestMessageDynamicByTrainingRequestConversationState state,
  //   int onWhichNumber,
  //   List<DateTime> uniqueListOfMessageDate,
  //   int index,
  // ) =>
  //     List.generate(
  //       state.trainingRequestMessageDynamicList
  //           .where((element) =>
  //               DateUtils.dateOnly(element.sentAt) ==
  //               uniqueListOfMessageDate.elementAt(index))
  //           .toList()
  //           .length,
  //       (secondIndex) {
  //         int chosenIndex = onWhichNumber;
  //         onWhichNumber++;
  //         return _createMessageContentColumn(state, chosenIndex);
  //       },
  //     );

  /// CREATE ===========================================================================================================
  CustomColumn _createMessageContentColumn(
    TrainingRequestMessageDynamicByTrainingRequestConversationState state,
    int chosenIndex,
  ) =>
      CustomColumn(
        children: [
          const CustomAppSizedBox(),
          _displayMessageContentBox(state, chosenIndex)
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
    TrainingRequestMessageDynamicByTrainingRequestConversationState state,
    int index,
  ) =>
      MessageContentBox(
        isMessageWrittenByAppuser:
            _checkWhetherMessageSentByAppUser(state, index),
        username: _displaySenderUsername(state, index),
        messageContent: _displayMessageContent(state, index),
        messageTime: _displaySentTime(state, index),
      );

  String _displaySenderUsername(
    TrainingRequestMessageDynamicByTrainingRequestConversationState state,
    int index,
  ) =>
      state.trainingRequestMessageDynamicList.elementAt(index).sender.username;

  String _displayMessageContent(
    TrainingRequestMessageDynamicByTrainingRequestConversationState state,
    int index,
  ) =>
      state.trainingRequestMessageDynamicList.elementAt(index).messageContent;

  String _displaySentTime(
    TrainingRequestMessageDynamicByTrainingRequestConversationState state,
    int index,
  ) =>
      _appDateFormat.hourAndMinutesOnly.format(_findSendingTime(state, index));

  /// METHODS ==========================================================================================================
  DateTime _findSevenDaysBeforeThanToday() =>
      DateUtils.dateOnly(DateTime.now()).subtract(const Duration(days: 7));

  void _createListOfSentMessageDate(
    TrainingRequestMessageDynamicByTrainingRequestConversationState state,
    List<DateTime> uniqueListOfMessageDate,
  ) {
    for (var element in state.trainingRequestMessageDynamicList) {
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
    TrainingRequestMessageDynamicByTrainingRequestConversationState state,
    int index,
  ) =>
      _findUserIdOfSender(state, index) == _appNumberConstants.appUserId;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  int? _findUserIdOfSender(
    TrainingRequestMessageDynamicByTrainingRequestConversationState state,
    int index,
  ) =>
      state.trainingRequestMessageDynamicList.elementAt(index).sender.uId;

  DateTime _findSendingTime(
    TrainingRequestMessageDynamicByTrainingRequestConversationState state,
    int index,
  ) =>
      state.trainingRequestMessageDynamicList.elementAt(index).sentAt;

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
        context
            .read<
                TrainingRequestMessageDynamicByTrainingRequestConversationBloc>()
            .add(LoadTrainingRequestMessageDynamicByTrainingRequestConversationEvent(
                uId: AppNumberConstants().appUserId,
                trainingRequestConversationId: context
                    .read<
                        TrainingRequestMessageDynamicByTrainingRequestConversationBloc>()
                    .state
                    .trainingRequestMessageDynamicList
                    .first
                    .trainingRequestConversationDynamic
                    .trainingRequestConversationId!,
                offset: context
                    .read<
                        TrainingRequestMessageDynamicByTrainingRequestConversationBloc>()
                    .state
                    .trainingRequestMessageDynamicList
                    .length));
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
// class ChosenConversationOfTrainingRequestBodyMessageContentArea
//     extends StatelessWidget {
//   final AppFunctions _appFunctions = AppFunctions();
//   final AppDateFormat _appDateFormat = AppDateFormat();
//   final AppNumberConstants _appNumberConstants = AppNumberConstants();
//   final Set<DateTime> uniqueSetOfMessageDate;
//
//   ChosenConversationOfTrainingRequestBodyMessageContentArea({
//     required this.uniqueSetOfMessageDate,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     ChosenTrainingRequestMessageDynamicByIndividualUserCubit
//         chosenTrainingRequestMessageDynamicByIndividualUserCubit =
//         context.read<ChosenTrainingRequestMessageDynamicByIndividualUserCubit>();
//     return chosenTrainingRequestMessageDynamicByIndividualUserCubit
//             .state.chosenTrainingRequestMessageDynamicByIndividualUser.isEmpty
//         ? MessageContentAreaNoMessage()
//         : MessageContentAreaWithMessageTextFieldWithButton(
//             children: [
//               BlocBuilder<ChosenTrainingRequestMessageDynamicByIndividualUserCubit,
//                   TrainingRequestMessageDynamicByTrainingRequestConversationState>(
//                 builder: (context, state) {
//                   if (state
//                       .chosenTrainingRequestMessageDynamicByIndividualUser.isEmpty) {
//                     return MessageContentAreaNoMessage();
//                   } else {
//                     return MessageContentArea(
//                       children: List.generate(
//                         uniqueSetOfMessageDate.length,
//                         (index) => CustomColumn(
//                           children: [
//                             const CustomAppSizedBox(height: 18),
//                             MessageDateBox(
//                                 dateDetail: uniqueSetOfMessageDate
//                                         .elementAt(index)
//                                         .isBefore(DateTime.now())
//                                     ? _appDateFormat.displayedDateAndDayFormat
//                                         .format(uniqueSetOfMessageDate
//                                             .elementAt(index))
//                                         .toString()
//                                     : _appDateFormat.displayedDayFormat.format(
//                                         uniqueSetOfMessageDate
//                                             .elementAt(index)),
//                                 dateDifference: _appFunctions.showDayDifference(
//                                     uniqueSetOfMessageDate.elementAt(index))),
//                             CustomColumn(
//                               children: List.generate(
//                                 state
//                                     .chosenTrainingRequestMessageDynamicByIndividualUser
//                                     .length,
//                                 (index) => Column(
//                                   children: [
//                                     const CustomAppSizedBox(),
//                                     MessageContentBox(
//                                         isMessageWrittenByAppuser: state
//                                                 .chosenTrainingRequestMessageDynamicByIndividualUser
//                                                 .elementAt(index)
//                                                 .sender
//                                                 .uId ==
//                                             _appNumberConstants.appUserId,
//                                         username: state
//                                             .chosenTrainingRequestMessageDynamicByIndividualUser
//                                             .elementAt(index)
//                                             .sender
//                                             .username,
//                                         messageContent: state
//                                             .chosenTrainingRequestMessageDynamicByIndividualUser
//                                             .elementAt(index)
//                                             .message,
//                                         messageTime: _appDateFormat
//                                             .hourAndMinutesOnly
//                                             .format(state
//                                                 .chosenTrainingRequestMessageDynamicByIndividualUser
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
