import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

import '../local_widgets/zlocal_widget.dart';

class ChosenConversationOfTrainingOfferBodyMessageContentArea
    extends StatefulWidget {
  const ChosenConversationOfTrainingOfferBodyMessageContentArea({
    // required this.uniqueListOfMessageDate,
    Key? key,
  }) : super(key: key);

  @override
  State<ChosenConversationOfTrainingOfferBodyMessageContentArea>
      createState() =>
          _ChosenConversationOfTrainingOfferBodyMessageContentAreaState();
}

class _ChosenConversationOfTrainingOfferBodyMessageContentAreaState
    extends State<ChosenConversationOfTrainingOfferBodyMessageContentArea> {
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
  BlocBuilder<TrainingOfferMessageDynamicByTrainingOfferConversationBloc,
          TrainingOfferMessageDynamicByTrainingOfferConversationState>
      _buildMessageDateAndContentArea(
    int onWhichNumber,
  ) =>
          BlocBuilder<
              TrainingOfferMessageDynamicByTrainingOfferConversationBloc,
              TrainingOfferMessageDynamicByTrainingOfferConversationState>(
            builder: (context, state) {
              List<DateTime> uniqueListOfMessageDate = <DateTime>[];
              _createListOfSentMessageDate(state, uniqueListOfMessageDate);
              switch (state.status) {
                case StatusWithoutLoading.initial:
                  return const Expanded(child: StateLoading());
                case StatusWithoutLoading.success:
                  if (state.trainingOfferMessageDynamicList.isEmpty) {
                    return MessageContentAreaNoMessage();
                  } else {
                    return Expanded(
                        child: AppBody(
                            child: SingleChildScrollView(
                                controller: _scrollController,
                                child: CustomColumn(
                                    children:
                                        _generateMessageDateAndContentArea(
                                            state,
                                            onWhichNumber,
                                            uniqueListOfMessageDate)))));
                  }
                case StatusWithoutLoading.failure:
                  return StateError(error: state.error);
              }
            },
          );

  /// CREATE ========================================================================================================
  //
  //Widget createMessageContentBody() =>
  // _checkWhetherThereIsAnyMessage()
  //     ? MessageContentAreaNoMessage()
  //     : _buildMessageDateAndContentArea();
  MessageTextFieldWithButton _createMessageTextFieldAreaWithButton() =>
      MessageTextFieldWithButton(sendMessageContent: () {
        if (kDebugMode) {
          print('Sending button has just beeen clicked!!!');
        }
      });

  /// GENERATE =========================================================================================================
  List<Widget> _generateMessageDateAndContentArea(
    TrainingOfferMessageDynamicByTrainingOfferConversationState state,
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
                state.trainingOfferMessageDynamicList
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
  //   TrainingOfferMessageDynamicByTrainingOfferConversationState state,
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
  //   TrainingOfferMessageDynamicByTrainingOfferConversationState state,
  //   int onWhichNumber,
  //   List<DateTime> uniqueListOfMessageDate,
  //   int index,
  // ) =>
  //     List.generate(
  //       state.trainingOfferMessageDynamicList
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
    TrainingOfferMessageDynamicByTrainingOfferConversationState state,
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
    TrainingOfferMessageDynamicByTrainingOfferConversationState state,
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
    TrainingOfferMessageDynamicByTrainingOfferConversationState state,
    int index,
  ) =>
      state.trainingOfferMessageDynamicList.elementAt(index).sender.username;

  String _displayMessageContent(
    TrainingOfferMessageDynamicByTrainingOfferConversationState state,
    int index,
  ) =>
      state.trainingOfferMessageDynamicList.elementAt(index).messageContent;

  String _displaySentTime(
    TrainingOfferMessageDynamicByTrainingOfferConversationState state,
    int index,
  ) =>
      _appDateFormat.hourAndMinutesOnly.format(_findSendingTime(state, index));

  /// METHODS ==========================================================================================================
  DateTime _findSevenDaysBeforeThanToday() =>
      DateUtils.dateOnly(DateTime.now()).subtract(const Duration(days: 7));

  void _createListOfSentMessageDate(
    TrainingOfferMessageDynamicByTrainingOfferConversationState state,
    List<DateTime> uniqueListOfMessageDate,
  ) {
    for (var element in state.trainingOfferMessageDynamicList) {
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
    TrainingOfferMessageDynamicByTrainingOfferConversationState state,
    int index,
  ) =>
      _findUserIdOfSender(state, index) == _appNumberConstants.appUserId;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  int? _findUserIdOfSender(
    TrainingOfferMessageDynamicByTrainingOfferConversationState state,
    int index,
  ) =>
      state.trainingOfferMessageDynamicList.elementAt(index).sender.uId;

  DateTime _findSendingTime(
    TrainingOfferMessageDynamicByTrainingOfferConversationState state,
    int index,
  ) =>
      state.trainingOfferMessageDynamicList.elementAt(index).sentAt;

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
            .read<TrainingOfferMessageDynamicByTrainingOfferConversationBloc>()
            .add(LoadTrainingOfferMessageDynamicByTrainingOfferConversationEvent(
                uId: AppNumberConstants().appUserId,
                trainingOfferConversationId: context
                    .read<
                        TrainingOfferMessageDynamicByTrainingOfferConversationBloc>()
                    .state
                    .trainingOfferMessageDynamicList
                    .first
                    .trainingOfferConversationDynamic
                    .trainingOfferConversationId!,
                offset: context
                    .read<
                        TrainingOfferMessageDynamicByTrainingOfferConversationBloc>()
                    .state
                    .trainingOfferMessageDynamicList
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
// class ChosenConversationOfTrainingOfferBodyMessageContentArea
//     extends StatelessWidget {
//   final AppFunctions _appFunctions = AppFunctions();
//   final AppDateFormat _appDateFormat = AppDateFormat();
//   final AppNumberConstants _appNumberConstants = AppNumberConstants();
//   final List<DateTime> uniqueListOfMessageDate;
//
//   ChosenConversationOfTrainingOfferBodyMessageContentArea({
//     required this.uniqueListOfMessageDate,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     ChosenTrainingOfferMessageDynamicByUserCubit
//         chosenTrainingOfferMessageDynamicByUserCubit =
//         context.read<ChosenTrainingOfferMessageDynamicByUserCubit>();
//     return chosenTrainingOfferMessageDynamicByUserCubit
//             .state.chosenTrainingOfferMessageDynamicByUser.isEmpty
//         ? MessageContentAreaNoMessage()
//         : MessageContentAreaWithMessageTextFieldWithButton(
//             children: [
//               BlocBuilder<ChosenTrainingOfferMessageDynamicByUserCubit,
//                   ChosenTrainingOfferMessageDynamicByUserState>(
//                 builder: (context, state) {
//                   if (state
//                       .chosenTrainingOfferMessageDynamicByUser.isEmpty) {
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
//                                     .chosenTrainingOfferMessageDynamicByUser
//                                     .length,
//                                 (index) => Column(
//                                   children: [
//                                     const CustomAppSizedBox(),
//                                     MessageContentBox(
//                                         isMessageWrittenByAppuser: state
//                                                 .chosenTrainingOfferMessageDynamicByUser
//                                                 .elementAt(index)
//                                                 .sender
//                                                 .uId ==
//                                             _appNumberConstants.appUserId,
//                                         username: state
//                                             .chosenTrainingOfferMessageDynamicByUser
//                                             .elementAt(index)
//                                             .sender
//                                             .username,
//                                         messageContent: state
//                                             .chosenTrainingOfferMessageDynamicByUser
//                                             .elementAt(index)
//                                             .message,
//                                         messageTime: _appDateFormat
//                                             .hourAndMinutesOnly
//                                             .format(state
//                                                 .chosenTrainingOfferMessageDynamicByUser
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
