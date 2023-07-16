import 'package:flutter/material.dart';
import 'package:my_project/screens/coaching/bodies/zbodies.dart';
import 'package:my_project/widgets/widget.dart';

class ScreenOfFoundCoaches extends StatelessWidget {
  static const String routeName = 'screen_of_found_coaches';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: FoundCoachesBody(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}




// class ScreenOfFoundCoaches extends StatefulWidget {
//   static const String routeName = 'screen_of_found_coaches';

//   const ScreenOfFoundCoaches({Key? key}) : super(key: key);

//   @override
//   State<ScreenOfFoundCoaches> createState() => _ScreenOfFoundCoachesState();
// }

// class _ScreenOfFoundCoachesState extends State<ScreenOfFoundCoaches> {
//   final AppFunctions _appFunctions = AppFunctions();
//   final AppNumberConstants _appNumberConstants = AppNumberConstants();
//   final ScrollController _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_onScroll);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit
//         chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit =
//         context.read<
//             ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit>();
//     final TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc
//         trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc =
//         context.read<
//             TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc>();
//     TextStyle detailTextStyle = context.textTheme.headlineSmall!
//         .copyWith(fontWeight: FontWeight.normal);
//     double screenWidth = context.width;

//     return Scaffold(
//       appBar: const CustomAppBar(),
//       body: _createAppBody(
//           chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
//           trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
//           screenWidth,
//           detailTextStyle),
//       bottomNavigationBar: const CustomBottomNavigationBar(),
//     );
//   }

//   // CREATE ============================================================================================================
//   AppBodyInSafeArea _createAppBody(
//           ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit
//               chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
//           TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc
//               trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
//           double screenWidth,
//           TextStyle detailTextStyle) =>
//       AppBodyInSafeArea(
//           child: _bringTrainingOfferResponseFromDatabaseAndDisplayThem(
//               chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
//               trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
//               screenWidth,
//               detailTextStyle));

//   // SKELTON ===========================================================================================================
//   // CRWATE ============================================================================================================
//   BasicScrollView _createFindACoachBoxSkeltonArea() =>
//       BasicScrollView(children: [
//         AppWrap(
//             wrapSpacing: 18,
//             wrapRunSpacing: 0,
//             children: _generateFindACoachBoxSkeltonArea())
//       ]);

//   // GENERATE ==========================================================================================================
//   List<Widget> _generateFindACoachBoxSkeltonArea() =>
//       List.generate(3, (index) => const SkeltonOfTraining());

//   // BLOC ==============================================================================================================
//   BlocBuilder<TrainingOfferResponseDynamicRespondedByTraineeBloc,
//           TrainingOfferResponseDynamicRespondedByTraineeState>
//       _bringTrainingOfferResponseFromDatabaseAndDisplayThem(
//     ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit
//         chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
//     TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc
//         trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
//     double screenWidth,
//     TextStyle detailTextStyle,
//   ) =>
//           BlocBuilder<TrainingOfferResponseDynamicRespondedByTraineeBloc,
//               TrainingOfferResponseDynamicRespondedByTraineeState>(
//             builder: (context, responseState) {
//               List<int?> uniqueListOfActivityNameId = <int?>[];
//               _createUniqueListOfActivityNameId(
//                   responseState, uniqueListOfActivityNameId);
//               switch (responseState.status) {
//                 case StatusWithoutLoading.initial:
//                   return _createFindACoachBoxSkeltonArea();
//                 case StatusWithoutLoading.success:
//                   return _createTrainingDetailColumn(
//                       responseState,
//                       context,
//                       chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
//                       trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
//                       uniqueListOfActivityNameId,
//                       screenWidth,
//                       detailTextStyle);
//                 case StatusWithoutLoading.failure:
//                   return StateError(error: responseState.error);
//               }
//             },
//           );

//   // TRAINING DETAIL COLUMN ============================================================================================
//   // CREATE ============================================================================================================
//   StatelessWidget _createTrainingDetailColumn(
//       TrainingOfferResponseDynamicRespondedByTraineeState responseState,
//       BuildContext context,
//       ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit
//           chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
//       TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc
//           trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
//       List<int?> uniqueListOfActivityNameId,
//       double screenWidth,
//       TextStyle detailTextStyle) {
//     if (_checkWhetherThereIsNoTrainingOfferResponse(responseState)) {
//       return _displayEmptyReturn();
//     } else {
//       return _createTrainingDetailArea(
//           context,
//           responseState,
//           chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
//           trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
//           uniqueListOfActivityNameId,
//           screenWidth,
//           detailTextStyle);
//     }
//   }

//   // METHODS ===========================================================================================================
//   // Check Methods -----------------------------------------------------------------------------------------------------
//   bool _checkWhetherThereIsNoTrainingOfferResponse(
//     TrainingOfferResponseDynamicRespondedByTraineeState responseState,
//   ) =>
//       responseState.trainingOfferResponseDynamicList.isEmpty;

//   // EMPTY RETURN ======================================================================================================
//   // DISPLAY ===========================================================================================================
//   InformationAboutExisting _displayEmptyReturn() =>
//       const InformationAboutExisting(detailLabel: 'response');

//   // TRAINING DETAIL AREA ==============================================================================================
//   // CREATE ==================================================================================================
//   BasicScrollView _createTrainingDetailArea(
//     BuildContext context,
//     TrainingOfferResponseDynamicRespondedByTraineeState responseState,
//     ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit
//         chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
//     TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc
//         trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
//     List<int?> uniqueListOfActivityNameId,
//     double screenWidth,
//     TextStyle detailTextStyle,
//   ) =>
//       BasicScrollView(
//           controller: _scrollController,
//           children: _generateTrainingDetails(
//               context,
//               responseState,
//               chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
//               trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
//               uniqueListOfActivityNameId,
//               screenWidth,
//               detailTextStyle));

//   // GENERATE ==================================================================================================
//   List<Widget> _generateTrainingDetails(
//     BuildContext context,
//     TrainingOfferResponseDynamicRespondedByTraineeState responseState,
//     ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit
//         chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
//     TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc
//         trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
//     List<int?> uniqueListOfActivityNameId,
//     double screenWidth,
//     TextStyle detailTextStyle,
//   ) =>
//       List.generate(
//           _getUniqueActivityNameListLength(
//               responseState, uniqueListOfActivityNameId),
//           (index) => index >= uniqueListOfActivityNameId.length
//               ? const BottomLoader()
//               : _createTrainingDetailBoxArea(
//                   context,
//                   responseState,
//                   chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
//                   trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
//                   uniqueListOfActivityNameId,
//                   screenWidth,
//                   index,
//                   detailTextStyle));

//   // METHODS ===========================================================================================================
//   // Check Methods -----------------------------------------------------------------------------------------------------
//   bool _checkWhetherResponseReachedMax(
//           TrainingOfferResponseDynamicRespondedByTraineeState responseState) =>
//       responseState.hasReachedMax == true;

//   // Get Methods -------------------------------------------------------------------------------------------------------
//   int _getUniqueActivityNameListLength(
//           TrainingOfferResponseDynamicRespondedByTraineeState responseState,
//           List<int?> uniqueListOfActivityNameId) =>
//       _checkWhetherResponseReachedMax(responseState)
//           ? uniqueListOfActivityNameId.length
//           : uniqueListOfActivityNameId.length + 1;

//   // TRAINING DETAIL BOX AREA ==========================================================================================
//   // CREATE ==================================================================================================
//   GestureDetector _createTrainingDetailBoxArea(
//     BuildContext context,
//     TrainingOfferResponseDynamicRespondedByTraineeState responseState,
//     ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit
//         chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
//     TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc
//         trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
//     List<int?> uniqueListOfActivityNameId,
//     double screenWidth,
//     int index,
//     TextStyle detailTextStyle,
//   ) =>
//       GestureDetector(
//           onTap: () => _goToTrainingOfferResponsePageWithBringingNecessaryBlocs(
//               context,
//               responseState,
//               chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
//               trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
//               uniqueListOfActivityNameId,
//               index),
//           child: _displayTrainingDetailChoiceColumn(context, responseState,
//               uniqueListOfActivityNameId, screenWidth, index, detailTextStyle));

//   // METHODS ===========================================================================================================
//   void _goToTrainingOfferResponsePageWithBringingNecessaryBlocs(
//     BuildContext context,
//     TrainingOfferResponseDynamicRespondedByTraineeState responseState,
//     ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit
//         chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
//     TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc
//         trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
//     List<int?> uniqueListOfActivityNameId,
//     int index,
//   ) {
//     _assignClickedTrainingOfferResponseAsChosenTrainingOfferResponse(
//         context,
//         responseState,
//         chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
//         uniqueListOfActivityNameId,
//         index);
//     _bringTrainingOfferResponseFromDatabase(
//         context,
//         responseState,
//         trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
//         uniqueListOfActivityNameId,
//         index);
//     _goToChosenTrainingOfferResponseScreen(context);
//   }

//   // DISPLAY ===========================================================================================================
//   CircleImageDetailedChoiceColumn _displayTrainingDetailChoiceColumn(
//     BuildContext context,
//     TrainingOfferResponseDynamicRespondedByTraineeState responseState,
//     List<int?> uniqueListOfActivityNameId,
//     double screenWidth,
//     int index,
//     TextStyle detailTextStyle,
//   ) =>
//       CircleImageDetailedChoiceColumn(
//           additionalSpaceOnBottom: _appNumberConstants.kMainHeight,
//           textStyle: detailTextStyle,
//           imageWidget: _createHero(context, responseState,
//               uniqueListOfActivityNameId, screenWidth, index),
//           firstLabel: _displayTrainingActivityTitle(
//               responseState, uniqueListOfActivityNameId, index),
//           secondLabel: _displayNumberOfTrainingActivityLevel(
//               responseState, uniqueListOfActivityNameId, index));

//   // TRAINING IMAGE WITH HERO ==========================================================================================
//   // CREATE ============================================================================================================
//   Hero _createHero(
//     BuildContext context,
//     TrainingOfferResponseDynamicRespondedByTraineeState responseState,
//     List<int?> uniqueListOfActivityNameId,
//     double screenWidth,
//     int index,
//   ) =>
//       Hero(
//           tag: _heroTag(responseState, uniqueListOfActivityNameId, index),
//           child: _displayTrainingPhoto(context, responseState,
//               uniqueListOfActivityNameId, screenWidth, index));

//   // METHODS ===========================================================================================================
//   // Hero Tags ---------------------------------------------------------------------------------------------------------
//   String _heroTag(
//     TrainingOfferResponseDynamicRespondedByTraineeState responseState,
//     List<int?> uniqueListOfActivityNameId,
//     int index,
//   ) =>
//       uniqueListOfActivityNameId.elementAt(index).toString();

//   // TRAINING IMAGE ====================================================================================================
//   // DISPLAY ===========================================================================================================
//   CustomImageContainer _displayTrainingPhoto(
//     BuildContext context,
//     TrainingOfferResponseDynamicRespondedByTraineeState responseState,
//     List<int?> uniqueListOfActivityNameId,
//     double screenWidth,
//     int index,
//   ) =>
//       CustomImageContainer(
//           height: 200,
//           width: screenWidth,
//           asset: _displayTrainingImage(
//               responseState, uniqueListOfActivityNameId, index));

//   String _displayTrainingImage(
//     TrainingOfferResponseDynamicRespondedByTraineeState responseState,
//     List<int?> uniqueListOfActivityNameId,
//     int index,
//   ) =>
//       'assets/images/activities/${_findTrainingActivityTitle(responseState, uniqueListOfActivityNameId, index).toLowerCase()}.jpg';

//   // Get Methods -------------------------------------------------------------------------------------------------------
//   Iterable<TrainingOfferResponseDynamic>
//       _getTrainingOfferResponseBasedOnUniqueActivityName(
//               TrainingOfferResponseDynamicRespondedByTraineeState responseState,
//               List<int?> uniqueListOfActivityNameId,
//               int index) =>
//           responseState.trainingOfferResponseDynamicList.where((element) =>
//               element.trainingOfferDynamic.trainingDetailDynamic
//                   .activityNameDynamic.activityNameId ==
//               uniqueListOfActivityNameId.elementAt(index));

//   // Find Methods ------------------------------------------------------------------------------------------------------
//   String _findTrainingActivityTitle(
//           TrainingOfferResponseDynamicRespondedByTraineeState responseState,
//           List<int?> uniqueListOfActivityNameId,
//           int index) =>
//       _getTrainingOfferResponseBasedOnUniqueActivityName(
//               responseState, uniqueListOfActivityNameId, index)
//           .first
//           .trainingOfferDynamic
//           .trainingDetailDynamic
//           .activityNameDynamic
//           .activityTitle;

//   // TRAINING ACTIVITY TITLE ===========================================================================================
//   // DISPLAY ===========================================================================================================
//   String _displayTrainingActivityTitle(
//     TrainingOfferResponseDynamicRespondedByTraineeState responseState,
//     List<int?> uniqueListOfActivityNameId,
//     int index,
//   ) =>
//       _appFunctions.setWithoutUnderscore(
//           _getTrainingOfferResponseBasedOnUniqueActivityName(
//                   responseState, uniqueListOfActivityNameId, index)
//               .first
//               .trainingOfferDynamic
//               .trainingDetailDynamic
//               .activityNameDynamic
//               .activityTitle);

//   String _displayNumberOfTrainingActivityLevel(
//     TrainingOfferResponseDynamicRespondedByTraineeState responseState,
//     List<int?> uniqueListOfActivityNameId,
//     int index,
//   ) =>
//       '(${_getTrainingOfferResponseBasedOnUniqueActivityName(responseState, uniqueListOfActivityNameId, index).toList().length} ${_getTrainingOfferResponseBasedOnUniqueActivityName(responseState, uniqueListOfActivityNameId, index).toList().length <= 1 ? 'coach)' : 'coaches)'}';

//   // METHODS ===========================================================================================================
//   // Unique List Methods -----------------------------------------------------------------------------------------------
//   void _createUniqueListOfActivityNameId(
//       TrainingOfferResponseDynamicRespondedByTraineeState responseState,
//       List<int?> uniqueListOfActivityNameId) {
//     for (var element in responseState.trainingOfferResponseDynamicList) {
//       if (uniqueListOfActivityNameId.contains(element.trainingOfferDynamic
//           .trainingDetailDynamic.activityNameDynamic.activityNameId)) {
//       } else {
//         uniqueListOfActivityNameId.add(element.trainingOfferDynamic
//             .trainingDetailDynamic.activityNameDynamic.activityNameId);
//       }
//     }
//   }

//   // Database Methods --------------------------------------------------------------------------------------------------
//   void _bringTrainingOfferResponseFromDatabase(
//     BuildContext context,
//     TrainingOfferResponseDynamicRespondedByTraineeState responseState,
//     TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc
//         trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
//     List<int?> uniqueListOfActivityNameId,
//     int index,
//   ) =>
//       trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc.add(
//           LoadTrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeEvent(
//               traineeId: _findAppUserId,
//               activityNameId: _findChosenTrainingActivityNameId(
//                   responseState, uniqueListOfActivityNameId, index)));

//   void _assignClickedTrainingOfferResponseAsChosenTrainingOfferResponse(
//     BuildContext context,
//     TrainingOfferResponseDynamicRespondedByTraineeState responseState,
//     ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit
//         chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
//     List<int?> uniqueListOfActivityNameId,
//     int index,
//   ) {
//     chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit
//         .pressTraining(_getTrainingOfferResponseBasedOnUniqueActivityName(
//                 responseState, uniqueListOfActivityNameId, index)
//             .first);
//   }

//   // Find Methods ------------------------------------------------------------------------------------------------------
//   int _findChosenTrainingActivityNameId(
//     TrainingOfferResponseDynamicRespondedByTraineeState responseState,
//     List<int?> uniqueListOfActivityNameId,
//     int index,
//   ) =>
//       uniqueListOfActivityNameId.elementAt(index)!;

//   int get _findAppUserId => _appNumberConstants.appUserId;

//   // Screen Method -----------------------------------------------------------------------------------------------------
//   void _goToChosenTrainingOfferResponseScreen(BuildContext context) {
//     Navigator.of(context).pushNamed(ScreenOfTrainingOfferResponse.routeName);
//   }

//   @override
//   void dispose() {
//     _scrollController
//       ..removeListener(_onScroll)
//       ..dispose();
//     super.dispose();
//   }

//   void _onScroll() {
//     if (_scrollController.position.atEdge) {
//       if (_scrollController.position.pixels != 0) {
//         //
//         //if (kDebugMode) {
//         //   print(
//         //       'the lenght of the list is: ${context.read<TrainingOfferResponseDynamicRespondedByTraineeBloc>().state.trainingOfferResponseDynamicList.length}');
//         // }
//         List<int?> uniqueActivityNameIdList = <int?>[];
//         for (var element in context
//             .read<TrainingOfferResponseDynamicRespondedByTraineeBloc>()
//             .state
//             .trainingOfferResponseDynamicList) {
//           if (uniqueActivityNameIdList
//               .contains(_findTrainingActivityNameId(element))) {
//           } else {
//             uniqueActivityNameIdList.add(_findTrainingActivityNameId(element));
//           }
//         }
//         context.read<TrainingOfferResponseDynamicRespondedByTraineeBloc>().add(
//             LoadTrainingOfferResponseDynamicRespondedByTraineeEvent(
//                 traineeId: _findAppUserId,
//                 offset: uniqueActivityNameIdList.length));
//       }
//     }
//   }

//   // METHODS ===========================================================================================================
//   // Check Methods -----------------------------------------------------------------------------------------------------
//   int? _findTrainingActivityNameId(TrainingOfferResponseDynamic element) =>
//       element.trainingOfferDynamic.trainingDetailDynamic.activityNameDynamic
//           .activityNameId;
// }