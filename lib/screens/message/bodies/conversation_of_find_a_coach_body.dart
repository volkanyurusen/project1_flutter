import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import 'zbodies.dart';

class ConversationOfFindACoachBody extends StatelessWidget {
  final double screenWidth;

  const ConversationOfFindACoachBody({required this.screenWidth, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _bringFindACoachConversationByConversationFromDatabaseAndDisplayThem();
  }

  /// BLOC =============================================================================================================
  BlocBuilder
      _bringFindACoachConversationByConversationFromDatabaseAndDisplayThem() =>
          BlocBuilder<GroupedFindACoachConversationDynamicByTraineeCubit,
              GroupedFindACoachConversationDynamicByTraineeState>(
            builder: (context, state) {
              Set<int?> uniqueSetOfTrainingOfferResponseId = <int?>{};
              _createSetOfTrainingOfferResponseId(
                  state, uniqueSetOfTrainingOfferResponseId);
              if (_checkWhetherThereIsAnyTrainingOffer(state)) {
                return _createInformationAreaOfEmptyConversation();
              } else {
                return _createAppBody(
                    context, state, uniqueSetOfTrainingOfferResponseId);
              }
            },
          );

  /// CREATE ===========================================================================================================
  InformationAboutExisting _createInformationAreaOfEmptyConversation() =>
      const InformationAboutExisting(detailLabel: 'conversation');

  AppBody _createAppBody(
    BuildContext context,
    GroupedFindACoachConversationDynamicByTraineeState state,
    Set<int?> uniqueSetOfTrainingOfferResponseId,
  ) =>
      AppBody(
          child: _createTrainingOfferConversationArea(
              context, state, uniqueSetOfTrainingOfferResponseId));

  BasicScrollView _createTrainingOfferConversationArea(
    BuildContext context,
    GroupedFindACoachConversationDynamicByTraineeState state,
    Set<int?> uniqueSetOfTrainingOfferResponseId,
  ) =>
      BasicScrollView(
          children: _generateTrainingOfferConversationColumn(
              context, state, uniqueSetOfTrainingOfferResponseId));

  /// GENERATE =========================================================================================================
  List<Widget> _generateTrainingOfferConversationColumn(
    BuildContext context,
    GroupedFindACoachConversationDynamicByTraineeState state,
    Set<int?> uniqueSetOfTrainingOfferResponseId,
  ) =>
      List.generate(
        state.groupedFindACoachConversationDynamicList.length,
        (index) => _displayConversationOfFindACoachBodyArea(
            uniqueSetOfTrainingOfferResponseId, index),
      );

  /// DISPLAY ==========================================================================================================
  ConversationOfFindACoachBodyArea _displayConversationOfFindACoachBodyArea(
    Set<int?> uniqueSetOfTrainingOfferResponseId,
    int index,
  ) =>
      ConversationOfFindACoachBodyArea(
          screenWidth: screenWidth,
          index: index,
          uniqueSetOfTrainingOfferResponseId:
              uniqueSetOfTrainingOfferResponseId);

  /// METHOD ===========================================================================================================
  /// Check Method -----------------------------------------------------------------------------------------------------
  bool _checkWhetherThereIsAnyTrainingOffer(
    GroupedFindACoachConversationDynamicByTraineeState state,
  ) =>
      state.groupedFindACoachConversationDynamicList.isEmpty;

  void _createSetOfTrainingOfferResponseId(
      GroupedFindACoachConversationDynamicByTraineeState state,
      Set<int?> uniqueSetOfTrainingOfferResponseId) {
    for (var element in state.groupedFindACoachConversationDynamicList) {
      uniqueSetOfTrainingOfferResponseId
          .add(element.trainingOfferResponseDynamic.trainingOfferResponseId);
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

// class ConversationOfTrainingOfferBody extends StatelessWidget {
//   final AppColors _appColors = AppColors();
//   final AppFunctions _appFunctions = AppFunctions();
//   final AppDateFormat _appDateFormat = AppDateFormat();
//   final double screenWidth;

//   ConversationOfTrainingOfferBody({
//     required this.screenWidth,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final ChosenTrainingOfferConversationDynamicByIndividualUserCubit
//         chosenTrainingOfferConversationDynamicByIndividualUserCubit =
//         context.read<ChosenTrainingOfferConversationDynamicByIndividualUserCubit>();
//     final ChosenTrainingOfferMessageDynamicByIndividualUserCubit
//         chosenTrainingOfferMessageDynamicByIndividualUserCubit =
//         context.read<ChosenTrainingOfferMessageDynamicByIndividualUserCubit>();
//     final TextStyle headline5 = Theme.of(context).textTheme.headline5!;
//     final TextStyle bodyText1 = Theme.of(context).textTheme.bodyText1!;
//     final Color pastTrainingOfferColor = _appColors.secondary;

//     return _bringFindACoachConversationByConversationFromDatabaseAndDisplayThem(
//         chosenTrainingOfferConversationDynamicByIndividualUserCubit,
//         chosenTrainingOfferMessageDynamicByIndividualUserCubit,
//         screenWidth,
//         headline5,
//         bodyText1,
//         pastTrainingOfferColor);
//   }

//   /// BLOC =============================================================================================================
//   BlocBuilder
//       _bringFindACoachConversationByConversationFromDatabaseAndDisplayThem(
//     ChosenTrainingOfferConversationDynamicByIndividualUserCubit
//         chosenTrainingOfferConversationDynamicByIndividualUserCubit,
//     ChosenTrainingOfferMessageDynamicByIndividualUserCubit
//         chosenTrainingOfferMessageDynamicByIndividualUserCubit,
//     double screenWidth,
//     TextStyle headline5,
//     TextStyle bodyText1,
//     Color pastTrainingOfferColor,
//   ) =>
//           BlocBuilder<BringTrainingOfferConversationDynamicByIndividualUserBloc,
//               GroupedFindACoachConversationDynamicByTraineeState>(
//             builder: (context, state) {
//               Set uniqueSetOfTrainingOfferId = <int>{};
//               for (var element in state
//                   .bringTrainingOfferConversationDynamicByIndividualUserList) {
//                 uniqueSetOfTrainingOfferId
//                     .add(element.TrainingOfferConversationId);
//               }
//               switch (state.status) {
//                 case Status.initial:
//                   return const StateLoading();
//                 case Status.loading:
//                   return const StateLoading();
//                 case Status.success:
//                   return AppBody(
//                     child: _createTrainingOfferConversationArea(
//                       context,
//                       state,
//                       chosenTrainingOfferConversationDynamicByIndividualUserCubit,
//                       chosenTrainingOfferMessageDynamicByIndividualUserCubit,
//                       screenWidth,
//                       uniqueSetOfTrainingOfferId,
//                       headline5,
//                       bodyText1,
//                       pastTrainingOfferColor,
//                     ),
//                   );
//                 case Status.failure:
//                   return StateError(error: state.error);
//               }
//             },
//           );

//   /// CREATE ===========================================================================================================
//   BasicScrollView _createTrainingOfferConversationArea(
//     BuildContext context,
//     GroupedFindACoachConversationDynamicByTraineeState state,
//     ChosenTrainingOfferConversationDynamicByIndividualUserCubit
//         chosenTrainingOfferConversationDynamicByIndividualUserCubit,
//     ChosenTrainingOfferMessageDynamicByIndividualUserCubit
//         chosenTrainingOfferMessageDynamicByIndividualUserCubit,
//     double screenWidth,
//     Set<int?> uniqueSetOfTrainingOfferId,
//     TextStyle headline5,
//     TextStyle bodyText1,
//     Color pastTrainingOfferColor,
//   ) =>
//       BasicScrollView(
//           children: _generateTrainingOfferConversationColumn(
//               context,
//               state,
//               chosenTrainingOfferConversationDynamicByIndividualUserCubit,
//               chosenTrainingOfferMessageDynamicByIndividualUserCubit,
//               screenWidth,
//               uniqueSetOfTrainingOfferId,
//               headline5,
//               bodyText1,
//               pastTrainingOfferColor));

//   /// GENERATE ========================================================================================================
//   List<Widget> _generateTrainingOfferConversationColumn(
//     BuildContext context,
//     GroupedFindACoachConversationDynamicByTraineeState state,
//     ChosenTrainingOfferConversationDynamicByIndividualUserCubit
//         chosenTrainingOfferConversationDynamicByIndividualUserCubit,
//     ChosenTrainingOfferMessageDynamicByIndividualUserCubit
//         chosenTrainingOfferMessageDynamicByIndividualUserCubit,
//     double screenWidth,
//     Set<int?> uniqueSetOfTrainingOfferId,
//     TextStyle headline5,
//     TextStyle bodyText1,
//     Color pastTrainingOfferColor,
//   ) =>
//       List.generate(
//         state
//             .bringTrainingOfferConversationDynamicByIndividualUserList.length,
//         (index) => CustomColumn(
//           children: [
//             const CustomAppSizedBox(height: 14),
//             _generateTrainingOfferConversationArea(
//                 state,
//                 index,
//                 chosenTrainingOfferConversationDynamicByIndividualUserCubit,
//                 context,
//                 chosenTrainingOfferMessageDynamicByIndividualUserCubit,
//                 screenWidth,
//                 uniqueSetOfTrainingOfferId,
//                 headline5,
//                 bodyText1,
//                 pastTrainingOfferColor),
//           ],
//         ),
//       );

//   GestureDetector _generateTrainingOfferConversationArea(
//     GroupedFindACoachConversationDynamicByTraineeState state,
//     int index,
//     ChosenTrainingOfferConversationDynamicByIndividualUserCubit
//         chosenTrainingOfferConversationDynamicByIndividualUserCubit,
//     BuildContext context,
//     ChosenTrainingOfferMessageDynamicByIndividualUserCubit
//         chosenTrainingOfferMessageDynamicByIndividualUserCubit,
//     double screenWidth,
//     Set<int?> uniqueSetOfTrainingOfferId,
//     TextStyle headline5,
//     TextStyle bodyText1,
//     Color pastTrainingOfferColor,
//   ) =>
//       GestureDetector(
//         onTap: () => _assignDetailAsChosenAndGoToChosenConversationScreen(
//             context,
//             state,
//             chosenTrainingOfferConversationDynamicByIndividualUserCubit,
//             chosenTrainingOfferMessageDynamicByIndividualUserCubit,
//             index),
//         onLongPress: () => _deleteChosenTrainingOfferConversationAndItsMessages(
//             context,
//             state,
//             chosenTrainingOfferConversationDynamicByIndividualUserCubit,
//             chosenTrainingOfferMessageDynamicByIndividualUserCubit,
//             index),
//         child: _displayTrainingOfferConversationArea(
//             context,
//             state,
//             screenWidth,
//             uniqueSetOfTrainingOfferId,
//             index,
//             headline5,
//             bodyText1,
//             pastTrainingOfferColor),
//       );

//   /// DISPLAY =========================================================================================================
//   SizedBox _displayTrainingOfferConversationArea(
//     BuildContext context,
//     GroupedFindACoachConversationDynamicByTraineeState state,
//     double screenWidth,
//     Set<int?> uniqueSetOfTrainingOfferId,
//     int index,
//     TextStyle headline5,
//     TextStyle bodyText1,
//     Color pastTrainingOfferColor,
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
//                       'assets/images/activities/${state.bringTrainingOfferConversationDynamicByIndividualUserList.elementAt(index).trainingOfferResponseDynamic.trainingOfferDynamic.activityDetailDynamic.activityNameDynamic.activityTitle.toLowerCase()}.jpg'),
//             ),
//             secondWidget: const CustomAppSizedBox(width: 10),
//             thirdWidget: CustomColumn(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 AppHeaderText(
//                     textLabel: _appFunctions.setWithoutUnderscore(
//                         state
//                             .bringTrainingOfferConversationDynamicByIndividualUserList
//                             .elementAt(index)
//                             .trainingOfferResponseDynamic
//                             .trainingOfferDynamic
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
//                 BlocBuilder<BringTrainingOfferMessageDynamicByIndividualUserBloc,
//                     BringTrainingOfferMessageDynamicByIndividualUserState>(
//                   builder: (context, messageState) {
//                     List<MessageDynamic>
//                         messageListByUniqueTrainingOfferConversation = [];
//                     for (var element in messageState
//                         .bringTrainingOfferMessageDynamicByIndividualUserList) {
//                       if (element.TrainingOfferConversationDynamic
//                               .TrainingOfferConversationId ==
//                           uniqueSetOfTrainingOfferId.elementAt(index)) {
//                         messageListByUniqueTrainingOfferConversation.add(element);
//                       }
//                     }
//                     switch (messageState.status) {
//                       case Status.initial:
//                         return SkeltonContainer(height: 14, width: 180);
//                       case Status.loading:
//                         return SkeltonContainer(height: 14, width: 180);
//                       case Status.success:
//                         return AppHeaderText(
//                             textLabel: messageListByUniqueTrainingOfferConversation
//                                     .isEmpty
//                                 ? ''
//                                 : messageListByUniqueTrainingOfferConversation
//                                             .last.message.length >
//                                         30
//                                     ? '${messageListByUniqueTrainingOfferConversation.last.message.substring(0, 30)}...'
//                                     : messageListByUniqueTrainingOfferConversation
//                                         .last.message
//                                         .substring(
//                                             0,
//                                             messageListByUniqueTrainingOfferConversation
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
//                           .bringTrainingOfferConversationDynamicByIndividualUserList
//                           .elementAt(index)
//                           .trainingOfferResponseDynamic
//                           .trainingOfferDynamic
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
//                       .bringTrainingOfferConversationDynamicByIndividualUserList
//                       .elementAt(index)
//                       .trainingOfferResponseDynamic
//                       .trainingOfferDynamic
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
//     GroupedFindACoachConversationDynamicByTraineeState state,
//     ChosenTrainingOfferConversationDynamicByIndividualUserCubit
//         chosenTrainingOfferConversationDynamicByIndividualUserCubit,
//     ChosenTrainingOfferMessageDynamicByIndividualUserCubit
//         chosenTrainingOfferMessageDynamicByIndividualUserCubit,
//     int index,
//   ) {
//     _assignTrainingOfferConversationAsChosen(
//         chosenTrainingOfferConversationDynamicByIndividualUserCubit,
//         state,
//         index);
//     _assignMessagesAsChosenMessagesBasedOnChosenTrainingOfferConversation(
//         context,
//         state,
//         index,
//         chosenTrainingOfferMessageDynamicByIndividualUserCubit);
//     _goToChosenConversationScreen(context);
//   }

//   Future<dynamic> _deleteChosenTrainingOfferConversationAndItsMessages(
//     BuildContext context,
//     GroupedFindACoachConversationDynamicByTraineeState state,
//     ChosenTrainingOfferConversationDynamicByIndividualUserCubit
//         chosenTrainingOfferConversationDynamicByIndividualUserCubit,
//     ChosenTrainingOfferMessageDynamicByIndividualUserCubit
//         chosenTrainingOfferMessageDynamicByIndividualUserCubit,
//     int index,
//   ) =>
//       showDialog(
//           barrierDismissible: false,
//           context: context,
//           builder: (context) {
//             _assignTrainingOfferConversationAsChosen(
//                 chosenTrainingOfferConversationDynamicByIndividualUserCubit,
//                 state,
//                 index);
//             _assignMessagesAsChosenMessagesBasedOnChosenTrainingOfferConversation(
//                 context,
//                 state,
//                 index,
//                 chosenTrainingOfferMessageDynamicByIndividualUserCubit);
//             return ConversationOfActivityDeletingPopUp(index: index);
//           });

//   /// Check Method ----------------------------------------------------------------------------------------------------
//   bool _checkActivityDateInFuture(
//     GroupedFindACoachConversationDynamicByTraineeState state,
//     int index,
//   ) =>
//       state.bringTrainingOfferConversationDynamicByIndividualUserList
//           .elementAt(index)
//           .trainingOfferResponseDynamic
//           .trainingOfferDynamic
//           .activityDate
//           .isAfter(DateTime.now());

//   /// Other Method ----------------------------------------------------------------------------------------------------
//   double _decideOpacityByCheckingRelevantActivityDateIsBeingInFuture(
//     GroupedFindACoachConversationDynamicByTraineeState state,
//     int index,
//   ) =>
//       _checkActivityDateInFuture(state, index) ? 1.0 : 0.5;

//   /// Find Method -----------------------------------------------------------------------------------------------------

//   /// Assign Methods --------------------------------------------------------------------------------------------------
//   void _assignTrainingOfferConversationAsChosen(
//     ChosenTrainingOfferConversationDynamicByIndividualUserCubit
//         chosenTrainingOfferConversationDynamicByIndividualUserCubit,
//     GroupedFindACoachConversationDynamicByTraineeState state,
//     int index,
//   ) =>
//       chosenTrainingOfferConversationDynamicByIndividualUserCubit
//           .pressTrainingOfferConversation(state
//               .bringTrainingOfferConversationDynamicByIndividualUserList
//               .elementAt(index));

//   void _assignMessagesAsChosenMessagesBasedOnChosenTrainingOfferConversation(
//     BuildContext context,
//     GroupedFindACoachConversationDynamicByTraineeState state,
//     int index,
//     ChosenTrainingOfferMessageDynamicByIndividualUserCubit
//         chosenTrainingOfferMessageDynamicByIndividualUserCubit,
//   ) {
//     for (var element in context
//         .read<BringTrainingOfferMessageDynamicByIndividualUserBloc>()
//         .state
//         .bringTrainingOfferMessageDynamicByIndividualUserList) {
//       if (element.TrainingOfferConversationDynamic.TrainingOfferConversationId ==
//           state
//               .bringTrainingOfferConversationDynamicByIndividualUserList[index]
//               .TrainingOfferConversationId) {
//         chosenTrainingOfferMessageDynamicByIndividualUserCubit.pressMessage(element);
//       }
//     }
//   }

//   /// Screen Methods ---------------------------------------------------------------------------------------------------
//   void _goToChosenConversationScreen(BuildContext context) =>
//       Navigator.of(context)
//           .pushNamed(ChosenConversationOfActivityScreen.routeName);
// }