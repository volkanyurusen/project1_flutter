import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/screens/message/local_widgets/zlocal_widget.dart';
import 'package:my_project/screens/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class ConversationOfGroupedTrainingRequestBody extends StatefulWidget {
  final double screenWidth;

  const ConversationOfGroupedTrainingRequestBody({
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  State<ConversationOfGroupedTrainingRequestBody> createState() =>
      _ConversationOfGroupedTrainingRequestBodyState();
}

class _ConversationOfGroupedTrainingRequestBodyState
    extends State<ConversationOfGroupedTrainingRequestBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    final GroupedTrainingRequestConversationDynamicByUserCubit
        groupedTrainingRequestConversationDynamicByUserCubit =
        context.read<GroupedTrainingRequestConversationDynamicByUserCubit>();

    return _bringTrainingRequestConversationByConversationFromDatabaseAndDisplayThem(
        groupedTrainingRequestConversationDynamicByUserCubit);
  }

  /// BLOC =============================================================================================================
  BlocBuilder
      _bringTrainingRequestConversationByConversationFromDatabaseAndDisplayThem(
    GroupedTrainingRequestConversationDynamicByUserCubit
        groupedTrainingRequestConversationDynamicByUserCubit,
  ) =>
          BlocBuilder<TrainingRequestConversationDynamicByUserBloc,
              TrainingRequestConversationDynamicByUserState>(
            builder: (context, state) {
              List<int?> uniqueListOfTrainingRequestId = <int?>[];
              _createUniqueListOfTrainingRequestId(
                  state, uniqueListOfTrainingRequestId);
              switch (state.status) {
                case StatusWithoutLoading.initial:
                  return const StateLoading();
                case StatusWithoutLoading.success:
                  if (_checkWhetherThereIsAnyTrainingRequest(state)) {
                    return _createInformationAreaOfEmptyConversation();
                  } else {
                    //
                    // if (uniqueListOfTrainingRequestId.length <
                    //         AppNumberConstants().queryLimit &&
                    //     state.hasReachedMax != true) {
                    //   context
                    //       .read<TrainingRequestConversationDynamicByUserBloc>()
                    //       .add(
                    //           LoadTrainingRequestConversationDynamicByUserEvent(
                    //               uId: AppNumberConstants().appUserId,
                    //               offset: state
                    //                   .trainingRequestConversationDynamicList
                    //                   .length));
                    //   return const StateLoading();
                    // } else {
                    return _createAppBody(
                        context,
                        state,
                        groupedTrainingRequestConversationDynamicByUserCubit,
                        uniqueListOfTrainingRequestId);
                    // }
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
    TrainingRequestConversationDynamicByUserState state,
    GroupedTrainingRequestConversationDynamicByUserCubit
        groupedTrainingRequestConversationDynamicByUserCubit,
    List<int?> uniqueListOfTrainingRequestId,
  ) =>
      AppBody(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: AppWrap(
            wrapRunSpacing: 18,
            wrapSpacing: 18,
            children: _generateTrainingRequestConversationColumn(
              context,
              state,
              groupedTrainingRequestConversationDynamicByUserCubit,
              uniqueListOfTrainingRequestId,
            ),
          ),
        ),
      );

  /// GENERATE =========================================================================================================
  List<Widget> _generateTrainingRequestConversationColumn(
    BuildContext context,
    TrainingRequestConversationDynamicByUserState state,
    GroupedTrainingRequestConversationDynamicByUserCubit
        groupedTrainingRequestConversationDynamicByUserCubit,
    List<int?> uniqueListOfTrainingRequestId,
  ) =>
      List.generate(
          state.hasReachedMax
              ? uniqueListOfTrainingRequestId.length
              : uniqueListOfTrainingRequestId.length + 1,
          (index) => index >= uniqueListOfTrainingRequestId.length
              ? const BottomLoader()
              : _displayMessageResponseBoxWithPaddingArea(
                  context,
                  state,
                  groupedTrainingRequestConversationDynamicByUserCubit,
                  uniqueListOfTrainingRequestId,
                  index));

  /// DISPLAY ==========================================================================================================
  Padding _displayMessageResponseBoxWithPaddingArea(
    BuildContext context,
    TrainingRequestConversationDynamicByUserState state,
    GroupedTrainingRequestConversationDynamicByUserCubit
        groupedTrainingRequestConversationDynamicByUserCubit,
    List<int?> uniqueListOfTrainingRequestId,
    int index,
  ) =>
      Padding(
        padding: index < 2
            ? const EdgeInsets.only(top: 18)
            : const EdgeInsets.only(top: 0),
        child: _displayResponseBoxes(
            context,
            state,
            groupedTrainingRequestConversationDynamicByUserCubit,
            uniqueListOfTrainingRequestId,
            index),
      );

  CoachingMessageResponseContainer _displayResponseBoxes(
    BuildContext context,
    TrainingRequestConversationDynamicByUserState state,
    GroupedTrainingRequestConversationDynamicByUserCubit
        groupedTrainingRequestConversationDynamicByUserCubit,
    List<int?> uniqueListOfTrainingRequestId,
    int index,
  ) =>
      CoachingMessageResponseContainer(
        screenWidth: widget.screenWidth,
        imageUrl:
            _displayActivityImage(state, uniqueListOfTrainingRequestId, index),
        activityTitle:
            _displayActivityTitle(state, uniqueListOfTrainingRequestId, index),
        responseNumber:
            _displayRequestNumber(state, uniqueListOfTrainingRequestId, index),
        onTap: () {
          //
          // print(_appFunctions.setWithoutUnderscore(
          //     _findUniqueTrainingRequest(state, uniqueListOfTrainingRequestId, index)
          //         .toList()
          //         .toString()));
          groupedTrainingRequestConversationDynamicByUserCubit
              .pressTrainingRequestConversation(state
                  .trainingRequestConversationDynamicList
                  .where((element) =>
                      element.trainingRequestResponseDynamic
                          .trainingRequestDynamic.trainingRequestId ==
                      uniqueListOfTrainingRequestId.elementAt(index))
                  .toList());
          context
              .read<
                  TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationBloc>()
              .add(
                  LoadTrainingRequestMessageDynamicByGroupOfTrainingRequestConversationEvent(
                      uId: AppNumberConstants().appUserId,
                      trainingRequestConversationList: state
                          .trainingRequestConversationDynamicList
                          .where((element) =>
                              element.trainingRequestResponseDynamic
                                  .trainingRequestDynamic.trainingRequestId ==
                              uniqueListOfTrainingRequestId.elementAt(index))
                          .map((e) => e.trainingRequestConversationId)
                          .toList()));
          //
          // context.read<TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationBloc>().add(
          //     LoadTrainingRequestMessageDynamicByGroupOfTrainingRequestConversationEvent(
          //         uId: AppNumberConstants().appUserId,
          //         trainingRequestConversationList: state
          //             .trainingRequestConversationDynamicList
          //             .map((e) => e.trainingRequestConversationId)
          //             .toList()));
          _goToScreenOfConversationOfTrainingRequest(context);
        },
      );

  String _displayActivityImage(
    TrainingRequestConversationDynamicByUserState state,
    List<int?> uniqueListOfTrainingRequestId,
    int index,
  ) =>
      'assets/images/activities/${_findUniqueTrainingRequest(state, uniqueListOfTrainingRequestId, index).first.trainingRequestResponseDynamic.trainingRequestDynamic.trainingDetailDynamic.activityNameDynamic.activityTitle.toLowerCase()}.jpg';

  String _displayActivityTitle(
    TrainingRequestConversationDynamicByUserState state,
    List<int?> uniqueListOfTrainingRequestId,
    int index,
  ) =>
      _findUniqueTrainingRequest(state, uniqueListOfTrainingRequestId, index)
          .first
          .trainingRequestResponseDynamic
          .trainingRequestDynamic
          .trainingDetailDynamic
          .activityNameDynamic
          .activityTitle;

  String _displayRequestNumber(
    TrainingRequestConversationDynamicByUserState state,
    List<int?> uniqueListOfTrainingRequestId,
    int index,
  ) =>
      _findUniqueTrainingRequest(state, uniqueListOfTrainingRequestId, index)
          .toList()
          .length
          .toString();

  /// METHOD ===========================================================================================================
  void _createUniqueListOfTrainingRequestId(
      TrainingRequestConversationDynamicByUserState state,
      List<int?> uniqueListOfTrainingRequestId) {
    for (var element in state.trainingRequestConversationDynamicList) {
      if (uniqueListOfTrainingRequestId.contains(element
          .trainingRequestResponseDynamic
          .trainingRequestDynamic
          .trainingRequestId)) {
      } else {
        uniqueListOfTrainingRequestId.add(element.trainingRequestResponseDynamic
            .trainingRequestDynamic.trainingRequestId);
      }
    }
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherThereIsAnyTrainingRequest(
    TrainingRequestConversationDynamicByUserState state,
  ) =>
      state.trainingRequestConversationDynamicList.isEmpty;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  Iterable<TrainingRequestConversationDynamic> _findUniqueTrainingRequest(
    TrainingRequestConversationDynamicByUserState state,
    List<int?> uniqueListOfTrainingRequestId,
    int index,
  ) =>
      state.trainingRequestConversationDynamicList.where((element) =>
          element.trainingRequestResponseDynamic.trainingRequestDynamic
              .trainingRequestId ==
          uniqueListOfTrainingRequestId.elementAt(index));

  /// Scren Methods ----------------------------------------------------------------------------------------------------
  void _goToScreenOfConversationOfTrainingRequest(BuildContext context) {
    Navigator.of(context)
        .pushNamed(ScreenOfConversationOfTrainingRequest.routeName);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0) {
        //
        // if (kDebugMode) {
        //   print(
        //       'the lenght of the list is: ${context.read<TrainingRequestConversationDynamicByUserBloc>().state.trainingRequestConversationDynamicList.length}');
        // }
        List<int?> uniqueTrainingRequestIdList = <int?>[];
        for (var element in context
            .read<TrainingRequestConversationDynamicByUserBloc>()
            .state
            .trainingRequestConversationDynamicList) {
          if (uniqueTrainingRequestIdList.contains(element
              .trainingRequestResponseDynamic
              .trainingRequestDynamic
              .trainingRequestId)) {
          } else {
            uniqueTrainingRequestIdList.add(element
                .trainingRequestResponseDynamic
                .trainingRequestDynamic
                .trainingRequestId);
          }
        }
        context.read<TrainingRequestConversationDynamicByUserBloc>().add(
            LoadTrainingRequestConversationDynamicByUserEvent(
                uId: AppNumberConstants().appUserId,
                offset: uniqueTrainingRequestIdList.length));
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

// class ConversationOfGroupedTrainingRequestBody extends StatelessWidget {
//   final AppColors _appColors = AppColors();
//   final AppFunctions _appFunctions = AppFunctions();
//   final AppDateFormat _appDateFormat = AppDateFormat();
//   final double screenWidth;

//   ConversationOfGroupedTrainingRequestBody({
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
//           BlocBuilder<TrainingRequestConversationDynamicByUserBloc,
//               TrainingRequestConversationDynamicByUserState>(
//             builder: (context, state) {
//               Set uniqueListOfTrainingRequestId = <int>{};
//               for (var element in state
//                   .trainingRequestConversationDynamicList) {
//                 uniqueListOfTrainingRequestId
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
//                       uniqueListOfTrainingRequestId,
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
//     TrainingRequestConversationDynamicByUserState state,
//     ChosenTrainingRequestConversationDynamicByIndividualUserCubit
//         chosenTrainingRequestConversationDynamicByIndividualUserCubit,
//     ChosenTrainingRequestMessageDynamicByIndividualUserCubit
//         chosenTrainingRequestMessageDynamicByIndividualUserCubit,
//     double screenWidth,
//     List<int?> uniqueListOfTrainingRequestId,
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
//               uniqueListOfTrainingRequestId,
//               headline5,
//               bodyText1,
//               pastTrainingRequestColor));

//   /// GENERATE ========================================================================================================
//   List<Widget> _generateTrainingRequestConversationColumn(
//     BuildContext context,
//     TrainingRequestConversationDynamicByUserState state,
//     ChosenTrainingRequestConversationDynamicByIndividualUserCubit
//         chosenTrainingRequestConversationDynamicByIndividualUserCubit,
//     ChosenTrainingRequestMessageDynamicByIndividualUserCubit
//         chosenTrainingRequestMessageDynamicByIndividualUserCubit,
//     double screenWidth,
//     List<int?> uniqueListOfTrainingRequestId,
//     TextStyle headline5,
//     TextStyle bodyText1,
//     Color pastTrainingRequestColor,
//   ) =>
//       List.generate(
//         state
//             .trainingRequestConversationDynamicList.length,
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
//                 uniqueListOfTrainingRequestId,
//                 headline5,
//                 bodyText1,
//                 pastTrainingRequestColor),
//           ],
//         ),
//       );

//   GestureDetector _generateTrainingRequestConversationArea(
//     TrainingRequestConversationDynamicByUserState state,
//     int index,
//     ChosenTrainingRequestConversationDynamicByIndividualUserCubit
//         chosenTrainingRequestConversationDynamicByIndividualUserCubit,
//     BuildContext context,
//     ChosenTrainingRequestMessageDynamicByIndividualUserCubit
//         chosenTrainingRequestMessageDynamicByIndividualUserCubit,
//     double screenWidth,
//     List<int?> uniqueListOfTrainingRequestId,
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
//             uniqueListOfTrainingRequestId,
//             index,
//             headline5,
//             bodyText1,
//             pastTrainingRequestColor),
//       );

//   /// DISPLAY =========================================================================================================
//   SizedBox _displayTrainingRequestConversationArea(
//     BuildContext context,
//     TrainingRequestConversationDynamicByUserState state,
//     double screenWidth,
//     List<int?> uniqueListOfTrainingRequestId,
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
//                       'assets/images/activities/${state.trainingRequestConversationDynamicList.elementAt(index).trainingRequestResponseDynamic.trainingRequestDynamic.activityDetailDynamic.activityNameDynamic.activityTitle.toLowerCase()}.jpg'),
//             ),
//             secondWidget: const CustomAppSizedBox(width: 10),
//             thirdWidget: CustomColumn(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 AppHeaderText(
//                     textLabel: _appFunctions.setWithoutUnderscore(
//                         state
//                             .trainingRequestConversationDynamicList
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
//                           uniqueListOfTrainingRequestId.elementAt(index)) {
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
//                           .trainingRequestConversationDynamicList
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
//                       .trainingRequestConversationDynamicList
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
//     TrainingRequestConversationDynamicByUserState state,
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
//     TrainingRequestConversationDynamicByUserState state,
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
//     TrainingRequestConversationDynamicByUserState state,
//     int index,
//   ) =>
//       state.trainingRequestConversationDynamicList
//           .elementAt(index)
//           .trainingRequestResponseDynamic
//           .trainingRequestDynamic
//           .activityDate
//           .isAfter(DateTime.now());

//   /// Other Method ----------------------------------------------------------------------------------------------------
//   double _decideOpacityByCheckingRelevantActivityDateIsBeingInFuture(
//     TrainingRequestConversationDynamicByUserState state,
//     int index,
//   ) =>
//       _checkActivityDateInFuture(state, index) ? 1.0 : 0.5;

//   /// Find Method -----------------------------------------------------------------------------------------------------

//   /// Assign Methods --------------------------------------------------------------------------------------------------
//   void _assignTrainingRequestConversationAsChosen(
//     ChosenTrainingRequestConversationDynamicByIndividualUserCubit
//         chosenTrainingRequestConversationDynamicByIndividualUserCubit,
//     TrainingRequestConversationDynamicByUserState state,
//     int index,
//   ) =>
//       chosenTrainingRequestConversationDynamicByIndividualUserCubit
//           .pressTrainingRequestConversation(state
//               .trainingRequestConversationDynamicList
//               .elementAt(index));

//   void _assignMessagesAsChosenMessagesBasedOnChosenTrainingRequestConversation(
//     BuildContext context,
//     TrainingRequestConversationDynamicByUserState state,
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
//               .trainingRequestConversationDynamicList[index]
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