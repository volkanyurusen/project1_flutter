import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/activity_conversation_dynamic.dart';
import 'package:my_project/widgets/widget.dart';

import 'zbodies.dart';

class ConversationOfActivityBody extends StatefulWidget {
  final double screenWidth;

  const ConversationOfActivityBody({required this.screenWidth, Key? key})
      : super(key: key);

  @override
  State<ConversationOfActivityBody> createState() =>
      _ConversationOfActivityBodyState();
}

class _ConversationOfActivityBodyState
    extends State<ConversationOfActivityBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return _bringActivityConversationByConversationFromDatabaseAndDisplayThem();
  }

  /// BLOC =============================================================================================================
  BlocBuilder
      _bringActivityConversationByConversationFromDatabaseAndDisplayThem() =>
          BlocBuilder<ActivityConversationDynamicByUserBloc,
              ActivityConversationDynamicByUserState>(
            builder: (context, state) {
              List<int?> uniqueListOfCreatedActivityId = <int?>[];
              _createSetOfActivityConversationId(
                  state, uniqueListOfCreatedActivityId);
              switch (state.status) {
                case StatusWithoutLoading.initial:
                  return const StateLoading();
                case StatusWithoutLoading.success:
                  //
                  // context
                  //     .read<MessageDynamicByGroupOfActivityConversationBloc>()
                  //     .add(LoadMessageDynamicByGroupOfActivityConversationEvent(
                  //         uId: AppNumberConstants().appUserId,
                  //         activityConversationList: context
                  //             .read<ActivityConversationDynamicByUserBloc>()
                  //             .state
                  //             .activityConversationDynamicList
                  //             .map((e) => e.activityConversationId)
                  //             .toList()));
                  if (_checkWhetherThereIsAnyCreatedActivity(state)) {
                    return _createInformationAreaOfEmptyConversation();
                  } else {
                    return _createAppBody(
                        context, state, uniqueListOfCreatedActivityId);
                  }
                case StatusWithoutLoading.failure:
                  return StateError(error: state.error);
              }
            },
          );

  /// CREATE ===========================================================================================================
  InformationAboutExisting _createInformationAreaOfEmptyConversation() =>
      const InformationAboutExisting(detailLabel: 'conversation');

  AppBody _createAppBody(
    BuildContext context,
    ActivityConversationDynamicByUserState state,
    List<int?> uniqueListOfCreatedActivityId,
  ) =>
      AppBody(
          child: _createActivityConversationArea(
              context, state, uniqueListOfCreatedActivityId));

  BasicScrollView _createActivityConversationArea(
    BuildContext context,
    ActivityConversationDynamicByUserState state,
    List<int?> uniqueListOfCreatedActivityId,
  ) =>
      BasicScrollView(
          controller: _scrollController,
          children: _generateActivityConversationColumn(
              context, state, uniqueListOfCreatedActivityId));

  /// GENERATE =========================================================================================================
  List<Widget> _generateActivityConversationColumn(
    BuildContext context,
    ActivityConversationDynamicByUserState state,
    List<int?> uniqueListOfCreatedActivityId,
  ) =>
      List.generate(
          state.hasReachedMax
              ? _lengthUniqueList(
                  uniqueListOfCreatedActivityId)
              : _lengthUniqueList(
                      uniqueListOfCreatedActivityId) +
                  1,
          (index) => index >=
                  _lengthUniqueList(
                      uniqueListOfCreatedActivityId)
              ? const BottomLoader()
              : _displayConversationOfActivityBodyArea(
                  uniqueListOfCreatedActivityId, index));

  /// DISPLAY ==========================================================================================================
  ConversationOfActivityBodyArea _displayConversationOfActivityBodyArea(
    List<int?> uniqueListOfCreatedActivityId,
    int index,
  ) =>
      ConversationOfActivityBodyArea(
          screenWidth: widget.screenWidth,
          uniqueListOfCreatedActivityId: uniqueListOfCreatedActivityId,
          index: index);

  /// METHOD ===========================================================================================================
  void _createSetOfActivityConversationId(
      ActivityConversationDynamicByUserState state,
      List<int?> uniqueListOfCreatedActivityId) {
    for (var element in state.activityConversationDynamicList) {
      if (uniqueListOfCreatedActivityId
          .contains(_findCreatedActivityId(element))) {
      } else {
        uniqueListOfCreatedActivityId.add(_findCreatedActivityId(element));
      }
    }
  }

  int _lengthUniqueList(
          List<int?> uniqueListOfCreatedActivityId) =>
      uniqueListOfCreatedActivityId.length;

  /// Check Method -----------------------------------------------------------------------------------------------------
  bool _checkWhetherThereIsAnyCreatedActivity(
    ActivityConversationDynamicByUserState state,
  ) =>
      state.activityConversationDynamicList.isEmpty;

  /// Find Method ------------------------------------------------------------------------------------------------------
  int? _findCreatedActivityId(ActivityConversationDynamic element) {
    return element
        .consistedActivityDynamic.createdActivityDynamic.createdActivityId;
  }

  int _findAppUserId() => AppNumberConstants().appUserId;

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
      if (_scrollController.position.pixels != 0) {
        List<int?> uniqueListOfCreatedActivityId = <int?>[];
        for (var element in context
            .read<ActivityConversationDynamicByUserBloc>()
            .state
            .activityConversationDynamicList) {
          if (uniqueListOfCreatedActivityId
              .contains(_findCreatedActivityId(element))) {
          } else {
            uniqueListOfCreatedActivityId.add(_findCreatedActivityId(element));
          }
        }
        context.read<ActivityConversationDynamicByUserBloc>().add(
            LoadActivityConversationDynamicByUserEvent(
                uId: _findAppUserId(),
                offset: _lengthUniqueList(
                    uniqueListOfCreatedActivityId)));
        context.read<MessageDynamicByGroupOfActivityConversationBloc>().add(
            LoadMessageDynamicByGroupOfActivityConversationEvent(
                uId: _findAppUserId(),
                offset: _lengthUniqueList(
                    uniqueListOfCreatedActivityId)));
      }
    }
  }
}








// import 'package:flutter/material.dart';
// import 'package:my_project/constants/constants.dart';
// import 'package:my_project/logic/blocs/blocs.dart';
// import 'package:my_project/logic/cubits/cubits.dart';
// import 'package:my_project/models/message_dynamic.dart';
// import 'package:my_project/screens/message/pop_ups/zpop_ups.dart';
// import 'package:my_project/widgets/widget.dart';

// import '../zscreens.dart';

// class ConversationOfActivityBody extends StatelessWidget {
//   final AppColors _appColors = AppColors();
//   final AppFunctions _appFunctions = AppFunctions();
//   final AppDateFormat _appDateFormat = AppDateFormat();
//   final double screenWidth;

//   ConversationOfActivityBody({
//     required this.screenWidth,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final ChosenActivityConversationDynamicByIndividualUserCubit
//         chosenActivityConversationDynamicByIndividualUserCubit =
//         context.read<ChosenActivityConversationDynamicByIndividualUserCubit>();
//     final ChosenActivityMessageDynamicByIndividualUserCubit
//         chosenActivityMessageDynamicByIndividualUserCubit =
//         context.read<ChosenActivityMessageDynamicByIndividualUserCubit>();
//     final TextStyle headline5 = Theme.of(context).textTheme.headline5!;
//     final TextStyle bodyText1 = Theme.of(context).textTheme.bodyText1!;
//     final Color pastActivityColor = _appColors.secondary;

//     return _bringActivityConversationByConversationFromDatabaseAndDisplayThem(
//         chosenActivityConversationDynamicByIndividualUserCubit,
//         chosenActivityMessageDynamicByIndividualUserCubit,
//         screenWidth,
//         headline5,
//         bodyText1,
//         pastActivityColor);
//   }

//   /// BLOC =============================================================================================================
//   BlocBuilder
//       _bringActivityConversationByConversationFromDatabaseAndDisplayThem(
//     ChosenActivityConversationDynamicByIndividualUserCubit
//         chosenActivityConversationDynamicByIndividualUserCubit,
//     ChosenActivityMessageDynamicByIndividualUserCubit
//         chosenActivityMessageDynamicByIndividualUserCubit,
//     double screenWidth,
//     TextStyle headline5,
//     TextStyle bodyText1,
//     Color pastActivityColor,
//   ) =>
//           BlocBuilder<ActivityConversationDynamicByUserBloc,
//               ActivityConversationDynamicByUserState>(
//             builder: (context, state) {
//               Set uniqueListOfCreatedActivityId = <int>{};
//               for (var element in state
//                   .ActivityConversationDynamicByUserList) {
//                 uniqueListOfCreatedActivityId
//                     .add(element.activityConversationId);
//               }
//               switch (state.status) {
//                 case Status.initial:
//                   return const StateLoading();
//                 case Status.loading:
//                   return const StateLoading();
//                 case Status.success:
//                   return AppBody(
//                     child: _createActivityConversationArea(
//                       context,
//                       state,
//                       chosenActivityConversationDynamicByIndividualUserCubit,
//                       chosenActivityMessageDynamicByIndividualUserCubit,
//                       screenWidth,
//                       uniqueListOfCreatedActivityId,
//                       headline5,
//                       bodyText1,
//                       pastActivityColor,
//                     ),
//                   );
//                 case Status.failure:
//                   return StateError(error: state.error);
//               }
//             },
//           );

//   /// CREATE ===========================================================================================================
//   BasicScrollView _createActivityConversationArea(
//     BuildContext context,
//     ActivityConversationDynamicByUserState state,
//     ChosenActivityConversationDynamicByIndividualUserCubit
//         chosenActivityConversationDynamicByIndividualUserCubit,
//     ChosenActivityMessageDynamicByIndividualUserCubit
//         chosenActivityMessageDynamicByIndividualUserCubit,
//     double screenWidth,
//     List<int?> uniqueListOfCreatedActivityId,
//     TextStyle headline5,
//     TextStyle bodyText1,
//     Color pastActivityColor,
//   ) =>
//       BasicScrollView(
//           children: _generateActivityConversationColumn(
//               context,
//               state,
//               chosenActivityConversationDynamicByIndividualUserCubit,
//               chosenActivityMessageDynamicByIndividualUserCubit,
//               screenWidth,
//               uniqueListOfCreatedActivityId,
//               headline5,
//               bodyText1,
//               pastActivityColor));

//   /// GENERATE ========================================================================================================
//   List<Widget> _generateActivityConversationColumn(
//     BuildContext context,
//     ActivityConversationDynamicByUserState state,
//     ChosenActivityConversationDynamicByIndividualUserCubit
//         chosenActivityConversationDynamicByIndividualUserCubit,
//     ChosenActivityMessageDynamicByIndividualUserCubit
//         chosenActivityMessageDynamicByIndividualUserCubit,
//     double screenWidth,
//     List<int?> uniqueListOfCreatedActivityId,
//     TextStyle headline5,
//     TextStyle bodyText1,
//     Color pastActivityColor,
//   ) =>
//       List.generate(
//         state
//             .ActivityConversationDynamicByUserList.length,
//         (index) => CustomColumn(
//           children: [
//             const CustomAppSizedBox(height: 14),
//             _generateActivityConversationArea(
//                 state,
//                 index,
//                 chosenActivityConversationDynamicByIndividualUserCubit,
//                 context,
//                 chosenActivityMessageDynamicByIndividualUserCubit,
//                 screenWidth,
//                 uniqueListOfCreatedActivityId,
//                 headline5,
//                 bodyText1,
//                 pastActivityColor),
//           ],
//         ),
//       );

//   GestureDetector _generateActivityConversationArea(
//     ActivityConversationDynamicByUserState state,
//     int index,
//     ChosenActivityConversationDynamicByIndividualUserCubit
//         chosenActivityConversationDynamicByIndividualUserCubit,
//     BuildContext context,
//     ChosenActivityMessageDynamicByIndividualUserCubit
//         chosenActivityMessageDynamicByIndividualUserCubit,
//     double screenWidth,
//     List<int?> uniqueListOfCreatedActivityId,
//     TextStyle headline5,
//     TextStyle bodyText1,
//     Color pastActivityColor,
//   ) =>
//       GestureDetector(
//         onTap: () => _assignDetailAsChosenAndGoToChosenConversationScreen(
//             context,
//             state,
//             chosenActivityConversationDynamicByIndividualUserCubit,
//             chosenActivityMessageDynamicByIndividualUserCubit,
//             index),
//         onLongPress: () => _deleteChosenActivityConversationAndItsMessages(
//             context,
//             state,
//             chosenActivityConversationDynamicByIndividualUserCubit,
//             chosenActivityMessageDynamicByIndividualUserCubit,
//             index),
//         child: _displayActivityConversationArea(
//             context,
//             state,
//             screenWidth,
//             uniqueListOfCreatedActivityId,
//             index,
//             headline5,
//             bodyText1,
//             pastActivityColor),
//       );

//   /// DISPLAY =========================================================================================================
//   SizedBox _displayActivityConversationArea(
//     BuildContext context,
//     ActivityConversationDynamicByUserState state,
//     double screenWidth,
//     List<int?> uniqueListOfCreatedActivityId,
//     int index,
//     TextStyle headline5,
//     TextStyle bodyText1,
//     Color pastActivityColor,
//   ) =>
//       SizedBox(
//         height: 70,
//         width: screenWidth,
//         child: AppHeader(
//           firstWidget: AppHeader(
//             firstWidget: Opacity(
//               opacity:
//                   _decideOpacityByCheckingRelevantActivityDateIsBeingInFuture(
//                       state, index),
//               child: MessageImageContainer(
//                   height: 70,
//                   width: 70,
//                   url:
//                       'assets/images/activities/${state.ActivityConversationDynamicByUserList.elementAt(index).consistedActivityDynamic.createdActivityDynamic.activityDetailDynamic.activityNameDynamic.activityTitle.toLowerCase()}.jpg'),
//             ),
//             secondWidget: const CustomAppSizedBox(width: 10),
//             thirdWidget: CustomColumn(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 AppHeaderText(
//                     textLabel: _appFunctions.setWithoutUnderscore(
//                         state
//                             .ActivityConversationDynamicByUserList
//                             .elementAt(index)
//                             .consistedActivityDynamic
//                             .createdActivityDynamic
//                             .activityDetailDynamic
//                             .activityNameDynamic
//                             .activityTitle),
//                     textStyle:
//                         _checkActivityDateInFuture(state, index)
//                             ? Theme.of(context).textTheme.headline5!
//                             : Theme.of(context)
//                                 .textTheme
//                                 .headline5!
//                                 .copyWith(color: _appColors.secondary)),
//                 const CustomAppSizedBox(height: 5),
//                 BlocBuilder<BringActivityMessageDynamicByIndividualUserBloc,
//                     BringActivityMessageDynamicByIndividualUserState>(
//                   builder: (context, messageState) {
//                     List<MessageDynamic>
//                         messageListByUniqueActivityConversation = [];
//                     for (var element in messageState
//                         .bringActivityMessageDynamicByIndividualUserList) {
//                       if (element.activityConversationDynamic
//                               .activityConversationId ==
//                           uniqueListOfCreatedActivityId.elementAt(index)) {
//                         messageListByUniqueActivityConversation.add(element);
//                       }
//                     }
//                     switch (messageState.status) {
//                       case Status.initial:
//                         return SkeltonContainer(height: 14, width: 180);
//                       case Status.loading:
//                         return SkeltonContainer(height: 14, width: 180);
//                       case Status.success:
//                         return AppHeaderText(
//                             textLabel: messageListByUniqueActivityConversation
//                                     .isEmpty
//                                 ? ''
//                                 : messageListByUniqueActivityConversation
//                                             .last.message.length >
//                                         30
//                                     ? '${messageListByUniqueActivityConversation.last.message.substring(0, 30)}...'
//                                     : messageListByUniqueActivityConversation
//                                         .last.message
//                                         .substring(
//                                             0,
//                                             messageListByUniqueActivityConversation
//                                                 .last.message.length),
//                             textStyle: _checkActivityDateInFuture(
//                                     state, index)
//                                 ? Theme.of(context).textTheme.bodyText1
//                                 : Theme.of(context)
//                                     .textTheme
//                                     .bodyText1!
//                                     .copyWith(color: _appColors.secondary));
//                       case Status.failure:
//                         return StateError(error: messageState.error);
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//           thirdWidget: CustomColumn(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               AppHeaderText(
//                   textLabel: _appDateFormat.displayedDateFormat.format(
//                       state
//                           .ActivityConversationDynamicByUserList
//                           .elementAt(index)
//                           .consistedActivityDynamic
//                           .createdActivityDynamic
//                           .activityDate),
//                   textStyle:
//                       _checkActivityDateInFuture(state, index)
//                           ? Theme.of(context).textTheme.headline5
//                           : Theme.of(context)
//                               .textTheme
//                               .headline5!
//                               .copyWith(color: _appColors.secondary)),
//               const CustomAppSizedBox(height: 5),
//               AppHeaderText(
//                   textLabel: _appFunctions.showDayDifference(state
//                       .ActivityConversationDynamicByUserList
//                       .elementAt(index)
//                       .consistedActivityDynamic
//                       .createdActivityDynamic
//                       .activityDate),
//                   textStyle:
//                       _checkActivityDateInFuture(state, index)
//                           ? Theme.of(context).textTheme.bodyText1
//                           : Theme.of(context)
//                               .textTheme
//                               .bodyText1!
//                               .copyWith(color: _appColors.secondary)),
//             ],
//           ),
//         ),
//       );

//   /// METHODS =========================================================================================================
//   void _assignDetailAsChosenAndGoToChosenConversationScreen(
//     BuildContext context,
//     ActivityConversationDynamicByUserState state,
//     ChosenActivityConversationDynamicByIndividualUserCubit
//         chosenActivityConversationDynamicByIndividualUserCubit,
//     ChosenActivityMessageDynamicByIndividualUserCubit
//         chosenActivityMessageDynamicByIndividualUserCubit,
//     int index,
//   ) {
//     _assignActivityConversationAsChosen(
//         chosenActivityConversationDynamicByIndividualUserCubit,
//         state,
//         index);
//     _assignMessagesAsChosenMessagesBasedOnChosenActivityConversation(
//         context,
//         state,
//         index,
//         chosenActivityMessageDynamicByIndividualUserCubit);
//     _goToChosenConversationScreen(context);
//   }

//   Future<dynamic> _deleteChosenActivityConversationAndItsMessages(
//     BuildContext context,
//     ActivityConversationDynamicByUserState state,
//     ChosenActivityConversationDynamicByIndividualUserCubit
//         chosenActivityConversationDynamicByIndividualUserCubit,
//     ChosenActivityMessageDynamicByIndividualUserCubit
//         chosenActivityMessageDynamicByIndividualUserCubit,
//     int index,
//   ) =>
//       showDialog(
//           barrierDismissible: false,
//           context: context,
//           builder: (context) {
//             _assignActivityConversationAsChosen(
//                 chosenActivityConversationDynamicByIndividualUserCubit,
//                 state,
//                 index);
//             _assignMessagesAsChosenMessagesBasedOnChosenActivityConversation(
//                 context,
//                 state,
//                 index,
//                 chosenActivityMessageDynamicByIndividualUserCubit);
//             return ConversationOfActivityDeletingPopUp(index: index);
//           });

//   /// Check Method ----------------------------------------------------------------------------------------------------
//   bool _checkActivityDateInFuture(
//     ActivityConversationDynamicByUserState state,
//     int index,
//   ) =>
//       state.ActivityConversationDynamicByUserList
//           .elementAt(index)
//           .consistedActivityDynamic
//           .createdActivityDynamic
//           .activityDate
//           .isAfter(DateTime.now());

//   /// Other Method ----------------------------------------------------------------------------------------------------
//   double _decideOpacityByCheckingRelevantActivityDateIsBeingInFuture(
//     ActivityConversationDynamicByUserState state,
//     int index,
//   ) =>
//       _checkActivityDateInFuture(state, index) ? 1.0 : 0.5;

//   /// Find Method -----------------------------------------------------------------------------------------------------

//   /// Assign Methods --------------------------------------------------------------------------------------------------
//   void _assignActivityConversationAsChosen(
//     ChosenActivityConversationDynamicByIndividualUserCubit
//         chosenActivityConversationDynamicByIndividualUserCubit,
//     ActivityConversationDynamicByUserState state,
//     int index,
//   ) =>
//       chosenActivityConversationDynamicByIndividualUserCubit
//           .pressActivityConversation(state
//               .ActivityConversationDynamicByUserList
//               .elementAt(index));

//   void _assignMessagesAsChosenMessagesBasedOnChosenActivityConversation(
//     BuildContext context,
//     ActivityConversationDynamicByUserState state,
//     int index,
//     ChosenActivityMessageDynamicByIndividualUserCubit
//         chosenActivityMessageDynamicByIndividualUserCubit,
//   ) {
//     for (var element in context
//         .read<BringActivityMessageDynamicByIndividualUserBloc>()
//         .state
//         .bringActivityMessageDynamicByIndividualUserList) {
//       if (element.activityConversationDynamic.activityConversationId ==
//           state
//               .ActivityConversationDynamicByUserList[index]
//               .activityConversationId) {
//         chosenActivityMessageDynamicByIndividualUserCubit.pressMessage(element);
//       }
//     }
//   }

//   /// Screen Methods ---------------------------------------------------------------------------------------------------
//   void _goToChosenConversationScreen(BuildContext context) =>
//       Navigator.of(context)
//           .pushNamed(ChosenConversationOfActivityScreen.routeName);
// }