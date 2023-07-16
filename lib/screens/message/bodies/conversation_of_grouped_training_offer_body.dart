import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/screens/message/local_widgets/zlocal_widget.dart';
import 'package:my_project/screens/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class ConversationOfGroupedTrainingOfferBody extends StatefulWidget {
  final double screenWidth;

  const ConversationOfGroupedTrainingOfferBody({
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  State<ConversationOfGroupedTrainingOfferBody> createState() =>
      _ConversationOfGroupedTrainingOfferBodyState();
}

class _ConversationOfGroupedTrainingOfferBodyState
    extends State<ConversationOfGroupedTrainingOfferBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    final GroupedTrainingOfferConversationDynamicByUserCubit
        groupedTrainingOfferConversationDynamicByUserCubit =
        context.read<GroupedTrainingOfferConversationDynamicByUserCubit>();

    return _bringTrainingOfferConversationByConversationFromDatabaseAndDisplayThem(
        groupedTrainingOfferConversationDynamicByUserCubit);
  }

  /// BLOC =============================================================================================================
  BlocBuilder
      _bringTrainingOfferConversationByConversationFromDatabaseAndDisplayThem(
    GroupedTrainingOfferConversationDynamicByUserCubit
        groupedTrainingOfferConversationDynamicByUserCubit,
  ) =>
          BlocBuilder<TrainingOfferConversationDynamicByUserBloc,
              TrainingOfferConversationDynamicByUserState>(
            builder: (context, state) {
              List<int?> uniqueListOfTrainingOfferId = <int?>[];
              _createUniqueListOfTrainingOfferId(
                  state, uniqueListOfTrainingOfferId);
              switch (state.status) {
                case StatusWithoutLoading.initial:
                  return const StateLoading();
                case StatusWithoutLoading.success:
                  if (_checkWhetherThereIsAnyTrainingOffer(state)) {
                    return _createInformationAreaOfEmptyConversation();
                  } else {
                    //
                    // if (uniqueListOfTrainingOfferId.length <
                    //         AppNumberConstants().queryLimit &&
                    //     state.hasReachedMax != true) {
                    //   context
                    //       .read<TrainingOfferConversationDynamicByUserBloc>()
                    //       .add(LoadTrainingOfferConversationDynamicByUserEvent(
                    //           uId: AppNumberConstants().appUserId,
                    //           offset: state.trainingOfferConversationDynamicList
                    //               .length));
                    //   return const StateLoading();
                    // } else {
                    return _createAppBody(
                        context,
                        state,
                        groupedTrainingOfferConversationDynamicByUserCubit,
                        uniqueListOfTrainingOfferId);
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
    TrainingOfferConversationDynamicByUserState state,
    GroupedTrainingOfferConversationDynamicByUserCubit
        groupedTrainingOfferConversationDynamicByUserCubit,
    List<int?> uniqueListOfTrainingOfferId,
  ) =>
      AppBody(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: AppWrap(
            wrapRunSpacing: 18,
            wrapSpacing: 18,
            children: _generateTrainingOfferConversationColumn(
              context,
              state,
              groupedTrainingOfferConversationDynamicByUserCubit,
              uniqueListOfTrainingOfferId,
            ),
          ),
        ),
      );

  /// GENERATE =========================================================================================================
  List<Widget> _generateTrainingOfferConversationColumn(
    BuildContext context,
    TrainingOfferConversationDynamicByUserState state,
    GroupedTrainingOfferConversationDynamicByUserCubit
        groupedTrainingOfferConversationDynamicByUserCubit,
    List<int?> uniqueListOfTrainingOfferId,
  ) =>
      List.generate(
          state.hasReachedMax == true
              ? uniqueListOfTrainingOfferId.length
              : uniqueListOfTrainingOfferId.length + 1,
          (index) => index >= uniqueListOfTrainingOfferId.length
              ? const BottomLoader()
              : _displayMessageResponseBoxWithPaddingArea(
                  context,
                  state,
                  groupedTrainingOfferConversationDynamicByUserCubit,
                  uniqueListOfTrainingOfferId,
                  index));

  /// DISPLAY ==========================================================================================================
  Padding _displayMessageResponseBoxWithPaddingArea(
    BuildContext context,
    TrainingOfferConversationDynamicByUserState state,
    GroupedTrainingOfferConversationDynamicByUserCubit
        groupedTrainingOfferConversationDynamicByUserCubit,
    List<int?> uniqueListOfTrainingOfferId,
    int index,
  ) =>
      Padding(
        padding: index < 2
            ? const EdgeInsets.only(top: 18)
            : const EdgeInsets.only(top: 0),
        child: _displayResponseBoxes(
            context,
            state,
            groupedTrainingOfferConversationDynamicByUserCubit,
            uniqueListOfTrainingOfferId,
            index),
      );

  CoachingMessageResponseContainer _displayResponseBoxes(
    BuildContext context,
    TrainingOfferConversationDynamicByUserState state,
    GroupedTrainingOfferConversationDynamicByUserCubit
        groupedTrainingOfferConversationDynamicByUserCubit,
    List<int?> uniqueListOfTrainingOfferId,
    int index,
  ) =>
      CoachingMessageResponseContainer(
        screenWidth: widget.screenWidth,
        imageUrl:
            _displayActivityImage(state, uniqueListOfTrainingOfferId, index),
        activityTitle:
            _displayActivityTitle(state, uniqueListOfTrainingOfferId, index),
        responseNumber:
            _displayOfferNumber(state, uniqueListOfTrainingOfferId, index),
        onTap: () {
          //
          // print(_appFunctions.setWithoutUnderscore(
          //     _findUniqueTrainingOffer(state, uniqueListOfTrainingOfferId, index)
          //         .toList()
          //         .toString()));
          groupedTrainingOfferConversationDynamicByUserCubit
              .pressTrainingOfferConversation(state
                  .trainingOfferConversationDynamicList
                  .where((element) =>
                      element.trainingOfferResponseDynamic.trainingOfferDynamic
                          .trainingOfferId ==
                      uniqueListOfTrainingOfferId.elementAt(index))
                  .toList());
          context
              .read<
                  TrainingOfferMessageDynamicByGroupOfTrainingOfferConversationBloc>()
              .add(
                  LoadTrainingOfferMessageDynamicByGroupOfTrainingOfferConversationEvent(
                      uId: AppNumberConstants().appUserId,
                      trainingOfferConversationList: state
                          .trainingOfferConversationDynamicList
                          .where((element) =>
                              element.trainingOfferResponseDynamic
                                  .trainingOfferDynamic.trainingOfferId ==
                              uniqueListOfTrainingOfferId.elementAt(index))
                          .map((e) => e.trainingOfferConversationId)
                          .toList()));
          //
          // context.read<TrainingOfferMessageDynamicByGroupOfTrainingOfferConversationBloc>().add(
          //     LoadTrainingOfferMessageDynamicByGroupOfTrainingOfferConversationEvent(
          //         uId: AppNumberConstants().appUserId,
          //         trainingOfferConversationList: state
          //             .trainingOfferConversationDynamicList
          //             .map((e) => e.trainingOfferConversationId)
          //             .toList()));
          _goToScreenOfConversationOfTrainingOffer(context);
        },
      );

  String _displayActivityImage(
    TrainingOfferConversationDynamicByUserState state,
    List<int?> uniqueListOfTrainingOfferId,
    int index,
  ) =>
      'assets/images/activities/${_findUniqueTrainingOffer(state, uniqueListOfTrainingOfferId, index).first.trainingOfferResponseDynamic.trainingOfferDynamic.trainingDetailDynamic.activityNameDynamic.activityTitle.toLowerCase()}.jpg';

  String _displayActivityTitle(
    TrainingOfferConversationDynamicByUserState state,
    List<int?> uniqueListOfTrainingOfferId,
    int index,
  ) =>
      _findUniqueTrainingOffer(state, uniqueListOfTrainingOfferId, index)
          .first
          .trainingOfferResponseDynamic
          .trainingOfferDynamic
          .trainingDetailDynamic
          .activityNameDynamic
          .activityTitle;

  String _displayOfferNumber(
    TrainingOfferConversationDynamicByUserState state,
    List<int?> uniqueListOfTrainingOfferId,
    int index,
  ) =>
      _findUniqueTrainingOffer(state, uniqueListOfTrainingOfferId, index)
          .toList()
          .length
          .toString();

  /// METHOD ===========================================================================================================
  void _createUniqueListOfTrainingOfferId(
      TrainingOfferConversationDynamicByUserState state,
      List<int?> uniqueListOfTrainingOfferId) {
    for (var element in state.trainingOfferConversationDynamicList) {
      if (uniqueListOfTrainingOfferId.contains(element
          .trainingOfferResponseDynamic.trainingOfferDynamic.trainingOfferId)) {
      } else {
        uniqueListOfTrainingOfferId.add(element
            .trainingOfferResponseDynamic.trainingOfferDynamic.trainingOfferId);
      }
    }
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherThereIsAnyTrainingOffer(
    TrainingOfferConversationDynamicByUserState state,
  ) =>
      state.trainingOfferConversationDynamicList.isEmpty;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  Iterable<TrainingOfferConversationDynamic> _findUniqueTrainingOffer(
    TrainingOfferConversationDynamicByUserState state,
    List<int?> uniqueListOfTrainingOfferId,
    int index,
  ) =>
      state.trainingOfferConversationDynamicList.where((element) =>
          element.trainingOfferResponseDynamic.trainingOfferDynamic
              .trainingOfferId ==
          uniqueListOfTrainingOfferId.elementAt(index));

  /// Screen Methods ---------------------------------------------------------------------------------------------------
  void _goToScreenOfConversationOfTrainingOffer(BuildContext context) {
    Navigator.of(context)
        .pushNamed(ScreenOfConversationOfTrainingOffer.routeName);
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
        //       'the lenght of the list is: ${context.read<TrainingOfferConversationDynamicByUserBloc>().state.trainingOfferConversationDynamicList.length}');
        // }

        List<int?> uniqueTrainingOfferIdList = <int?>[];
        for (var element in context
            .read<TrainingOfferConversationDynamicByUserBloc>()
            .state
            .trainingOfferConversationDynamicList) {
          if (uniqueTrainingOfferIdList.contains(element
              .trainingOfferResponseDynamic
              .trainingOfferDynamic
              .trainingOfferId)) {
          } else {
            uniqueTrainingOfferIdList.add(element.trainingOfferResponseDynamic
                .trainingOfferDynamic.trainingOfferId);
          }
        }
        context.read<TrainingOfferConversationDynamicByUserBloc>().add(
            LoadTrainingOfferConversationDynamicByUserEvent(
                uId: AppNumberConstants().appUserId,
                offset: uniqueTrainingOfferIdList.length));
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

// class ConversationOfGroupedTrainingOfferBody extends StatelessWidget {
//   final AppColors _appColors = AppColors();
//   final AppFunctions _appFunctions = AppFunctions();
//   final AppDateFormat _appDateFormat = AppDateFormat();
//   final double screenWidth;

//   ConversationOfGroupedTrainingOfferBody({
//     required this.screenWidth,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final ChosenTrainingOfferConversationDynamicByUserCubit
//         chosenTrainingOfferConversationDynamicByUserCubit =
//         context.read<ChosenTrainingOfferConversationDynamicByUserCubit>();
//     final ChosenTrainingOfferMessageDynamicByUserCubit
//         chosenTrainingOfferMessageDynamicByUserCubit =
//         context.read<ChosenTrainingOfferMessageDynamicByUserCubit>();
//     final TextStyle headline5 = Theme.of(context).textTheme.headline5!;
//     final TextStyle bodyText1 = Theme.of(context).textTheme.bodyText1!;
//     final Color pastTrainingOfferColor = _appColors.secondary;

//     return _bringTrainingOfferConversationByConversationFromDatabaseAndDisplayThem(
//         chosenTrainingOfferConversationDynamicByUserCubit,
//         chosenTrainingOfferMessageDynamicByUserCubit,
//         screenWidth,
//         headline5,
//         bodyText1,
//         pastTrainingOfferColor);
//   }

//   /// BLOC =============================================================================================================
//   BlocBuilder
//       _bringTrainingOfferConversationByConversationFromDatabaseAndDisplayThem(
//     ChosenTrainingOfferConversationDynamicByUserCubit
//         chosenTrainingOfferConversationDynamicByUserCubit,
//     ChosenTrainingOfferMessageDynamicByUserCubit
//         chosenTrainingOfferMessageDynamicByUserCubit,
//     double screenWidth,
//     TextStyle headline5,
//     TextStyle bodyText1,
//     Color pastTrainingOfferColor,
//   ) =>
//           BlocBuilder<TrainingOfferConversationDynamicByUserBloc,
//               TrainingOfferConversationDynamicByUserState>(
//             builder: (context, state) {
//               Set uniqueListOfTrainingOfferId = <int>{};
//               for (var element in state
//                   .trainingOfferConversationDynamicList) {
//                 uniqueListOfTrainingOfferId
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
//                       chosenTrainingOfferConversationDynamicByUserCubit,
//                       chosenTrainingOfferMessageDynamicByUserCubit,
//                       screenWidth,
//                       uniqueListOfTrainingOfferId,
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
//     TrainingOfferConversationDynamicByUserState state,
//     ChosenTrainingOfferConversationDynamicByUserCubit
//         chosenTrainingOfferConversationDynamicByUserCubit,
//     ChosenTrainingOfferMessageDynamicByUserCubit
//         chosenTrainingOfferMessageDynamicByUserCubit,
//     double screenWidth,
//     List<int?> uniqueListOfTrainingOfferId,
//     TextStyle headline5,
//     TextStyle bodyText1,
//     Color pastTrainingOfferColor,
//   ) =>
//       BasicScrollView(
//           children: _generateTrainingOfferConversationColumn(
//               context,
//               state,
//               chosenTrainingOfferConversationDynamicByUserCubit,
//               chosenTrainingOfferMessageDynamicByUserCubit,
//               screenWidth,
//               uniqueListOfTrainingOfferId,
//               headline5,
//               bodyText1,
//               pastTrainingOfferColor));

//   /// GENERATE ========================================================================================================
//   List<Widget> _generateTrainingOfferConversationColumn(
//     BuildContext context,
//     TrainingOfferConversationDynamicByUserState state,
//     ChosenTrainingOfferConversationDynamicByUserCubit
//         chosenTrainingOfferConversationDynamicByUserCubit,
//     ChosenTrainingOfferMessageDynamicByUserCubit
//         chosenTrainingOfferMessageDynamicByUserCubit,
//     double screenWidth,
//     List<int?> uniqueListOfTrainingOfferId,
//     TextStyle headline5,
//     TextStyle bodyText1,
//     Color pastTrainingOfferColor,
//   ) =>
//       List.generate(
//         state
//             .trainingOfferConversationDynamicList.length,
//         (index) => CustomColumn(
//           children: [
//             const CustomAppSizedBox(height: 14),
//             _generateTrainingOfferConversationArea(
//                 state,
//                 index,
//                 chosenTrainingOfferConversationDynamicByUserCubit,
//                 context,
//                 chosenTrainingOfferMessageDynamicByUserCubit,
//                 screenWidth,
//                 uniqueListOfTrainingOfferId,
//                 headline5,
//                 bodyText1,
//                 pastTrainingOfferColor),
//           ],
//         ),
//       );

//   GestureDetector _generateTrainingOfferConversationArea(
//     TrainingOfferConversationDynamicByUserState state,
//     int index,
//     ChosenTrainingOfferConversationDynamicByUserCubit
//         chosenTrainingOfferConversationDynamicByUserCubit,
//     BuildContext context,
//     ChosenTrainingOfferMessageDynamicByUserCubit
//         chosenTrainingOfferMessageDynamicByUserCubit,
//     double screenWidth,
//     List<int?> uniqueListOfTrainingOfferId,
//     TextStyle headline5,
//     TextStyle bodyText1,
//     Color pastTrainingOfferColor,
//   ) =>
//       GestureDetector(
//         onTap: () => _assignDetailAsChosenAndGoToChosenConversationScreen(
//             context,
//             state,
//             chosenTrainingOfferConversationDynamicByUserCubit,
//             chosenTrainingOfferMessageDynamicByUserCubit,
//             index),
//         onLongPress: () => _deleteChosenTrainingOfferConversationAndItsMessages(
//             context,
//             state,
//             chosenTrainingOfferConversationDynamicByUserCubit,
//             chosenTrainingOfferMessageDynamicByUserCubit,
//             index),
//         child: _displayTrainingOfferConversationArea(
//             context,
//             state,
//             screenWidth,
//             uniqueListOfTrainingOfferId,
//             index,
//             headline5,
//             bodyText1,
//             pastTrainingOfferColor),
//       );

//   /// DISPLAY =========================================================================================================
//   SizedBox _displayTrainingOfferConversationArea(
//     BuildContext context,
//     TrainingOfferConversationDynamicByUserState state,
//     double screenWidth,
//     List<int?> uniqueListOfTrainingOfferId,
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
//                       'assets/images/activities/${state.trainingOfferConversationDynamicList.elementAt(index).trainingOfferResponseDynamic.trainingOfferDynamic.activityDetailDynamic.activityNameDynamic.activityTitle.toLowerCase()}.jpg'),
//             ),
//             secondWidget: const CustomAppSizedBox(width: 10),
//             thirdWidget: CustomColumn(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 AppHeaderText(
//                     textLabel: _appFunctions.setWithoutUnderscore(
//                         state
//                             .trainingOfferConversationDynamicList
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
//                 BlocBuilder<BringTrainingOfferMessageDynamicByUserBloc,
//                     BringTrainingOfferMessageDynamicByUserState>(
//                   builder: (context, messageState) {
//                     List<MessageDynamic>
//                         messageListByUniqueTrainingOfferConversation = [];
//                     for (var element in messageState
//                         .bringTrainingOfferMessageDynamicByUserList) {
//                       if (element.TrainingOfferConversationDynamic
//                               .TrainingOfferConversationId ==
//                           uniqueListOfTrainingOfferId.elementAt(index)) {
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
//                           .trainingOfferConversationDynamicList
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
//                       .trainingOfferConversationDynamicList
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
//     TrainingOfferConversationDynamicByUserState state,
//     ChosenTrainingOfferConversationDynamicByUserCubit
//         chosenTrainingOfferConversationDynamicByUserCubit,
//     ChosenTrainingOfferMessageDynamicByUserCubit
//         chosenTrainingOfferMessageDynamicByUserCubit,
//     int index,
//   ) {
//     _assignTrainingOfferConversationAsChosen(
//         chosenTrainingOfferConversationDynamicByUserCubit,
//         state,
//         index);
//     _assignMessagesAsChosenMessagesBasedOnChosenTrainingOfferConversation(
//         context,
//         state,
//         index,
//         chosenTrainingOfferMessageDynamicByUserCubit);
//     _goToChosenConversationScreen(context);
//   }

//   Future<dynamic> _deleteChosenTrainingOfferConversationAndItsMessages(
//     BuildContext context,
//     TrainingOfferConversationDynamicByUserState state,
//     ChosenTrainingOfferConversationDynamicByUserCubit
//         chosenTrainingOfferConversationDynamicByUserCubit,
//     ChosenTrainingOfferMessageDynamicByUserCubit
//         chosenTrainingOfferMessageDynamicByUserCubit,
//     int index,
//   ) =>
//       showDialog(
//           barrierDismissible: false,
//           context: context,
//           builder: (context) {
//             _assignTrainingOfferConversationAsChosen(
//                 chosenTrainingOfferConversationDynamicByUserCubit,
//                 state,
//                 index);
//             _assignMessagesAsChosenMessagesBasedOnChosenTrainingOfferConversation(
//                 context,
//                 state,
//                 index,
//                 chosenTrainingOfferMessageDynamicByUserCubit);
//             return ConversationOfActivityDeletingPopUp(index: index);
//           });

//   /// Check Method ----------------------------------------------------------------------------------------------------
//   bool _checkActivityDateInFuture(
//     TrainingOfferConversationDynamicByUserState state,
//     int index,
//   ) =>
//       state.trainingOfferConversationDynamicList
//           .elementAt(index)
//           .trainingOfferResponseDynamic
//           .trainingOfferDynamic
//           .activityDate
//           .isAfter(DateTime.now());

//   /// Other Method ----------------------------------------------------------------------------------------------------
//   double _decideOpacityByCheckingRelevantActivityDateIsBeingInFuture(
//     TrainingOfferConversationDynamicByUserState state,
//     int index,
//   ) =>
//       _checkActivityDateInFuture(state, index) ? 1.0 : 0.5;

//   /// Find Method -----------------------------------------------------------------------------------------------------

//   /// Assign Methods --------------------------------------------------------------------------------------------------
//   void _assignTrainingOfferConversationAsChosen(
//     ChosenTrainingOfferConversationDynamicByUserCubit
//         chosenTrainingOfferConversationDynamicByUserCubit,
//     TrainingOfferConversationDynamicByUserState state,
//     int index,
//   ) =>
//       chosenTrainingOfferConversationDynamicByUserCubit
//           .pressTrainingOfferConversation(state
//               .trainingOfferConversationDynamicList
//               .elementAt(index));

//   void _assignMessagesAsChosenMessagesBasedOnChosenTrainingOfferConversation(
//     BuildContext context,
//     TrainingOfferConversationDynamicByUserState state,
//     int index,
//     ChosenTrainingOfferMessageDynamicByUserCubit
//         chosenTrainingOfferMessageDynamicByUserCubit,
//   ) {
//     for (var element in context
//         .read<BringTrainingOfferMessageDynamicByUserBloc>()
//         .state
//         .bringTrainingOfferMessageDynamicByUserList) {
//       if (element.TrainingOfferConversationDynamic.TrainingOfferConversationId ==
//           state
//               .trainingOfferConversationDynamicList[index]
//               .TrainingOfferConversationId) {
//         chosenTrainingOfferMessageDynamicByUserCubit.pressMessage(element);
//       }
//     }
//   }

//   /// Screen Methods ---------------------------------------------------------------------------------------------------
//   void _goToChosenConversationScreen(BuildContext context) =>
//       Navigator.of(context)
//           .pushNamed(ChosenConversationOfActivityScreen.routeName);
// }