import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import 'zbodies.dart';

class ConversationOfTrainingRequestBody extends StatelessWidget {
  final double screenWidth;

  const ConversationOfTrainingRequestBody({required this.screenWidth, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _bringTrainingRequestConversationByConversationFromDatabaseAndDisplayThem();
  }

  /// BLOC =============================================================================================================
  BlocBuilder
      _bringTrainingRequestConversationByConversationFromDatabaseAndDisplayThem() =>
          BlocBuilder<GroupedTrainingRequestConversationDynamicByUserCubit,
              GroupedTrainingRequestConversationDynamicByUserState>(
            builder: (context, state) {
              Set<int?> uniqueSetOfTrainingRequestResponseId = <int?>{};
              _createSetOfTrainingRequestResponseId(
                  state, uniqueSetOfTrainingRequestResponseId);
              if (_checkWhetherThereIsAnyTrainingRequest(state)) {
                return _createInformationAreaOfEmptyConversation();
              } else {
                return _createAppBody(
                    context, state, uniqueSetOfTrainingRequestResponseId);
              }
            },
          );

  /// CREATE ===========================================================================================================
  InformationAboutExisting _createInformationAreaOfEmptyConversation() =>
      const InformationAboutExisting(detailLabel: 'conversation');

  AppBody _createAppBody(
    BuildContext context,
    GroupedTrainingRequestConversationDynamicByUserState state,
    Set<int?> uniqueSetOfTrainingRequestResponseId,
  ) =>
      AppBody(
          child: _createTrainingRequestConversationArea(
              context, state, uniqueSetOfTrainingRequestResponseId));

  BasicScrollView _createTrainingRequestConversationArea(
    BuildContext context,
    GroupedTrainingRequestConversationDynamicByUserState state,
    Set<int?> uniqueSetOfTrainingRequestResponseId,
  ) =>
      BasicScrollView(
          children: _generateTrainingRequestConversationColumn(
              context, state, uniqueSetOfTrainingRequestResponseId));

  /// GENERATE =========================================================================================================
  List<Widget> _generateTrainingRequestConversationColumn(
    BuildContext context,
    GroupedTrainingRequestConversationDynamicByUserState state,
    Set<int?> uniqueSetOfTrainingRequestResponseId,
  ) =>
      List.generate(
        state.groupedTrainingRequestConversationDynamicList.length,
        (index) => _displayConversationOfTrainingRequestBodyArea(
            uniqueSetOfTrainingRequestResponseId, index),
      );

  /// DISPLAY ==========================================================================================================
  ConversationOfTrainingRequestBodyArea
      _displayConversationOfTrainingRequestBodyArea(
    Set<int?> uniqueSetOfTrainingRequestResponseId,
    int index,
  ) =>
          ConversationOfTrainingRequestBodyArea(
              screenWidth: screenWidth,
              index: index,
              uniqueSetOfTrainingRequestResponseId:
                  uniqueSetOfTrainingRequestResponseId);

  /// METHOD ===========================================================================================================
  /// Check Method -----------------------------------------------------------------------------------------------------
  bool _checkWhetherThereIsAnyTrainingRequest(
    GroupedTrainingRequestConversationDynamicByUserState state,
  ) =>
      state.groupedTrainingRequestConversationDynamicList.isEmpty;

  void _createSetOfTrainingRequestResponseId(
      GroupedTrainingRequestConversationDynamicByUserState state,
      Set<int?> uniqueSetOfTrainingRequestResponseId) {
    for (var element in state.groupedTrainingRequestConversationDynamicList) {
      uniqueSetOfTrainingRequestResponseId.add(
          element.trainingRequestResponseDynamic.trainingRequestResponseId);
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

// class ConversationOfTrainingRequestBody extends StatelessWidget {
//   final AppColors _appColors = AppColors();
//   final AppFunctions _appFunctions = AppFunctions();
//   final AppDateFormat _appDateFormat = AppDateFormat();
//   final double screenWidth;

//   ConversationOfTrainingRequestBody({
//     required this.screenWidth,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final ChosenTrainingRequestConversationDynamicByIndividualUserCubit
//         chosenTrainingRequestConversationDynamicByIndividualUserCubit =
//         context.read<ChosenTrainingRequestConversationDynamicByIndividualUserCubit>();
//     final ChosenTrainingRequestMessageDynamicByIndividualUserCubit
//         chosenTrainingRequestMessageDynamicByIndividualUserCubit =
//         context.read<ChosenTrainingRequestMessageDynamicByIndividualUserCubit>();
//     final TextStyle headline5 = Theme.of(context).textTheme.headline5!;
//     final TextStyle bodyText1 = Theme.of(context).textTheme.bodyText1!;
//     final Color pastTrainingRequestColor = _appColors.secondary;

//     return _bringTrainingRequestConversationByConversationFromDatabaseAndDisplayThem(
//         chosenTrainingRequestConversationDynamicByIndividualUserCubit,
//         chosenTrainingRequestMessageDynamicByIndividualUserCubit,
//         screenWidth,
//         headline5,
//         bodyText1,
//         pastTrainingRequestColor);
//   }

//   /// BLOC =============================================================================================================
//   BlocBuilder
//       _bringTrainingRequestConversationByConversationFromDatabaseAndDisplayThem(
//     ChosenTrainingRequestConversationDynamicByIndividualUserCubit
//         chosenTrainingRequestConversationDynamicByIndividualUserCubit,
//     ChosenTrainingRequestMessageDynamicByIndividualUserCubit
//         chosenTrainingRequestMessageDynamicByIndividualUserCubit,
//     double screenWidth,
//     TextStyle headline5,
//     TextStyle bodyText1,
//     Color pastTrainingRequestColor,
//   ) =>
//           BlocBuilder<BringTrainingRequestConversationDynamicByIndividualUserBloc,
//               GroupedTrainingRequestConversationDynamicByUserState>(
//             builder: (context, state) {
//               Set uniqueSetOfTrainingRequestId = <int>{};
//               for (var element in state
//                   .bringTrainingRequestConversationDynamicByIndividualUserList) {
//                 uniqueSetOfTrainingRequestId
//                     .add(element.TrainingRequestConversationId);
//               }
//               switch (state.status) {
//                 case Status.initial:
//                   return const StateLoading();
//                 case Status.loading:
//                   return const StateLoading();
//                 case Status.success:
//                   return AppBody(
//                     child: _createTrainingRequestConversationArea(
//                       context,
//                       state,
//                       chosenTrainingRequestConversationDynamicByIndividualUserCubit,
//                       chosenTrainingRequestMessageDynamicByIndividualUserCubit,
//                       screenWidth,
//                       uniqueSetOfTrainingRequestId,
//                       headline5,
//                       bodyText1,
//                       pastTrainingRequestColor,
//                     ),
//                   );
//                 case Status.failure:
//                   return StateError(error: state.error);
//               }
//             },
//           );

//   /// CREATE ===========================================================================================================
//   BasicScrollView _createTrainingRequestConversationArea(
//     BuildContext context,
//     GroupedTrainingRequestConversationDynamicByUserState state,
//     ChosenTrainingRequestConversationDynamicByIndividualUserCubit
//         chosenTrainingRequestConversationDynamicByIndividualUserCubit,
//     ChosenTrainingRequestMessageDynamicByIndividualUserCubit
//         chosenTrainingRequestMessageDynamicByIndividualUserCubit,
//     double screenWidth,
//     Set<int?> uniqueSetOfTrainingRequestId,
//     TextStyle headline5,
//     TextStyle bodyText1,
//     Color pastTrainingRequestColor,
//   ) =>
//       BasicScrollView(
//           children: _generateTrainingRequestConversationColumn(
//               context,
//               state,
//               chosenTrainingRequestConversationDynamicByIndividualUserCubit,
//               chosenTrainingRequestMessageDynamicByIndividualUserCubit,
//               screenWidth,
//               uniqueSetOfTrainingRequestId,
//               headline5,
//               bodyText1,
//               pastTrainingRequestColor));

//   /// GENERATE ========================================================================================================
//   List<Widget> _generateTrainingRequestConversationColumn(
//     BuildContext context,
//     GroupedTrainingRequestConversationDynamicByUserState state,
//     ChosenTrainingRequestConversationDynamicByIndividualUserCubit
//         chosenTrainingRequestConversationDynamicByIndividualUserCubit,
//     ChosenTrainingRequestMessageDynamicByIndividualUserCubit
//         chosenTrainingRequestMessageDynamicByIndividualUserCubit,
//     double screenWidth,
//     Set<int?> uniqueSetOfTrainingRequestId,
//     TextStyle headline5,
//     TextStyle bodyText1,
//     Color pastTrainingRequestColor,
//   ) =>
//       List.generate(
//         state
//             .bringTrainingRequestConversationDynamicByIndividualUserList.length,
//         (index) => CustomColumn(
//           children: [
//             const CustomAppSizedBox(height: 14),
//             _generateTrainingRequestConversationArea(
//                 state,
//                 index,
//                 chosenTrainingRequestConversationDynamicByIndividualUserCubit,
//                 context,
//                 chosenTrainingRequestMessageDynamicByIndividualUserCubit,
//                 screenWidth,
//                 uniqueSetOfTrainingRequestId,
//                 headline5,
//                 bodyText1,
//                 pastTrainingRequestColor),
//           ],
//         ),
//       );

//   GestureDetector _generateTrainingRequestConversationArea(
//     GroupedTrainingRequestConversationDynamicByUserState state,
//     int index,
//     ChosenTrainingRequestConversationDynamicByIndividualUserCubit
//         chosenTrainingRequestConversationDynamicByIndividualUserCubit,
//     BuildContext context,
//     ChosenTrainingRequestMessageDynamicByIndividualUserCubit
//         chosenTrainingRequestMessageDynamicByIndividualUserCubit,
//     double screenWidth,
//     Set<int?> uniqueSetOfTrainingRequestId,
//     TextStyle headline5,
//     TextStyle bodyText1,
//     Color pastTrainingRequestColor,
//   ) =>
//       GestureDetector(
//         onTap: () => _assignDetailAsChosenAndGoToChosenConversationScreen(
//             context,
//             state,
//             chosenTrainingRequestConversationDynamicByIndividualUserCubit,
//             chosenTrainingRequestMessageDynamicByIndividualUserCubit,
//             index),
//         onLongPress: () => _deleteChosenTrainingRequestConversationAndItsMessages(
//             context,
//             state,
//             chosenTrainingRequestConversationDynamicByIndividualUserCubit,
//             chosenTrainingRequestMessageDynamicByIndividualUserCubit,
//             index),
//         child: _displayTrainingRequestConversationArea(
//             context,
//             state,
//             screenWidth,
//             uniqueSetOfTrainingRequestId,
//             index,
//             headline5,
//             bodyText1,
//             pastTrainingRequestColor),
//       );

//   /// DISPLAY =========================================================================================================
//   SizedBox _displayTrainingRequestConversationArea(
//     BuildContext context,
//     GroupedTrainingRequestConversationDynamicByUserState state,
//     double screenWidth,
//     Set<int?> uniqueSetOfTrainingRequestId,
//     int index,
//     TextStyle headline5,
//     TextStyle bodyText1,
//     Color pastTrainingRequestColor,
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
//                       'assets/images/activities/${state.bringTrainingRequestConversationDynamicByIndividualUserList.elementAt(index).trainingRequestResponseDynamic.trainingRequestDynamic.activityDetailDynamic.activityNameDynamic.activityTitle.toLowerCase()}.jpg'),
//             ),
//             secondWidget: const CustomAppSizedBox(width: 10),
//             thirdWidget: CustomColumn(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 AppHeaderText(
//                     textLabel: _appFunctions.setWithoutUnderscore(
//                         state
//                             .bringTrainingRequestConversationDynamicByIndividualUserList
//                             .elementAt(index)
//                             .trainingRequestResponseDynamic
//                             .trainingRequestDynamic
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
//                 BlocBuilder<BringTrainingRequestMessageDynamicByIndividualUserBloc,
//                     BringTrainingRequestMessageDynamicByIndividualUserState>(
//                   builder: (context, messageState) {
//                     List<MessageDynamic>
//                         messageListByUniqueTrainingRequestConversation = [];
//                     for (var element in messageState
//                         .bringTrainingRequestMessageDynamicByIndividualUserList) {
//                       if (element.TrainingRequestConversationDynamic
//                               .TrainingRequestConversationId ==
//                           uniqueSetOfTrainingRequestId.elementAt(index)) {
//                         messageListByUniqueTrainingRequestConversation.add(element);
//                       }
//                     }
//                     switch (messageState.status) {
//                       case Status.initial:
//                         return SkeltonContainer(height: 14, width: 180);
//                       case Status.loading:
//                         return SkeltonContainer(height: 14, width: 180);
//                       case Status.success:
//                         return AppHeaderText(
//                             textLabel: messageListByUniqueTrainingRequestConversation
//                                     .isEmpty
//                                 ? ''
//                                 : messageListByUniqueTrainingRequestConversation
//                                             .last.message.length >
//                                         30
//                                     ? '${messageListByUniqueTrainingRequestConversation.last.message.substring(0, 30)}...'
//                                     : messageListByUniqueTrainingRequestConversation
//                                         .last.message
//                                         .substring(
//                                             0,
//                                             messageListByUniqueTrainingRequestConversation
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
//                           .bringTrainingRequestConversationDynamicByIndividualUserList
//                           .elementAt(index)
//                           .trainingRequestResponseDynamic
//                           .trainingRequestDynamic
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
//                       .bringTrainingRequestConversationDynamicByIndividualUserList
//                       .elementAt(index)
//                       .trainingRequestResponseDynamic
//                       .trainingRequestDynamic
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
//     GroupedTrainingRequestConversationDynamicByUserState state,
//     ChosenTrainingRequestConversationDynamicByIndividualUserCubit
//         chosenTrainingRequestConversationDynamicByIndividualUserCubit,
//     ChosenTrainingRequestMessageDynamicByIndividualUserCubit
//         chosenTrainingRequestMessageDynamicByIndividualUserCubit,
//     int index,
//   ) {
//     _assignTrainingRequestConversationAsChosen(
//         chosenTrainingRequestConversationDynamicByIndividualUserCubit,
//         state,
//         index);
//     _assignMessagesAsChosenMessagesBasedOnChosenTrainingRequestConversation(
//         context,
//         state,
//         index,
//         chosenTrainingRequestMessageDynamicByIndividualUserCubit);
//     _goToChosenConversationScreen(context);
//   }

//   Future<dynamic> _deleteChosenTrainingRequestConversationAndItsMessages(
//     BuildContext context,
//     GroupedTrainingRequestConversationDynamicByUserState state,
//     ChosenTrainingRequestConversationDynamicByIndividualUserCubit
//         chosenTrainingRequestConversationDynamicByIndividualUserCubit,
//     ChosenTrainingRequestMessageDynamicByIndividualUserCubit
//         chosenTrainingRequestMessageDynamicByIndividualUserCubit,
//     int index,
//   ) =>
//       showDialog(
//           barrierDismissible: false,
//           context: context,
//           builder: (context) {
//             _assignTrainingRequestConversationAsChosen(
//                 chosenTrainingRequestConversationDynamicByIndividualUserCubit,
//                 state,
//                 index);
//             _assignMessagesAsChosenMessagesBasedOnChosenTrainingRequestConversation(
//                 context,
//                 state,
//                 index,
//                 chosenTrainingRequestMessageDynamicByIndividualUserCubit);
//             return ConversationOfActivityDeletingPopUp(index: index);
//           });

//   /// Check Method ----------------------------------------------------------------------------------------------------
//   bool _checkActivityDateInFuture(
//     GroupedTrainingRequestConversationDynamicByUserState state,
//     int index,
//   ) =>
//       state.bringTrainingRequestConversationDynamicByIndividualUserList
//           .elementAt(index)
//           .trainingRequestResponseDynamic
//           .trainingRequestDynamic
//           .activityDate
//           .isAfter(DateTime.now());

//   /// Other Method ----------------------------------------------------------------------------------------------------
//   double _decideOpacityByCheckingRelevantActivityDateIsBeingInFuture(
//     GroupedTrainingRequestConversationDynamicByUserState state,
//     int index,
//   ) =>
//       _checkActivityDateInFuture(state, index) ? 1.0 : 0.5;

//   /// Find Method -----------------------------------------------------------------------------------------------------

//   /// Assign Methods --------------------------------------------------------------------------------------------------
//   void _assignTrainingRequestConversationAsChosen(
//     ChosenTrainingRequestConversationDynamicByIndividualUserCubit
//         chosenTrainingRequestConversationDynamicByIndividualUserCubit,
//     GroupedTrainingRequestConversationDynamicByUserState state,
//     int index,
//   ) =>
//       chosenTrainingRequestConversationDynamicByIndividualUserCubit
//           .pressTrainingRequestConversation(state
//               .bringTrainingRequestConversationDynamicByIndividualUserList
//               .elementAt(index));

//   void _assignMessagesAsChosenMessagesBasedOnChosenTrainingRequestConversation(
//     BuildContext context,
//     GroupedTrainingRequestConversationDynamicByUserState state,
//     int index,
//     ChosenTrainingRequestMessageDynamicByIndividualUserCubit
//         chosenTrainingRequestMessageDynamicByIndividualUserCubit,
//   ) {
//     for (var element in context
//         .read<BringTrainingRequestMessageDynamicByIndividualUserBloc>()
//         .state
//         .bringTrainingRequestMessageDynamicByIndividualUserList) {
//       if (element.TrainingRequestConversationDynamic.TrainingRequestConversationId ==
//           state
//               .bringTrainingRequestConversationDynamicByIndividualUserList[index]
//               .TrainingRequestConversationId) {
//         chosenTrainingRequestMessageDynamicByIndividualUserCubit.pressMessage(element);
//       }
//     }
//   }

//   /// Screen Methods ---------------------------------------------------------------------------------------------------
//   void _goToChosenConversationScreen(BuildContext context) =>
//       Navigator.of(context)
//           .pushNamed(ChosenConversationOfActivityScreen.routeName);
// }