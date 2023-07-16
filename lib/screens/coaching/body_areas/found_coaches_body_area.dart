import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/screens/coaching/local_widgets/zlocal_widgets.dart';
import 'package:my_project/screens/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class FoundCoachesBodyArea extends StatefulWidget {
  const FoundCoachesBodyArea({Key? key}) : super(key: key);

  @override
  State<FoundCoachesBodyArea> createState() => _FoundCoachesBodyAreaState();
}

class _FoundCoachesBodyAreaState extends State<FoundCoachesBodyArea> {
  final AppFunctions _appFunctions = AppFunctions();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    final ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit
        chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit =
        context.read<
            ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit>();
    final TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc
        trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc =
        context.read<
            TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc>();
    TextStyle detailTextStyle = context.textTheme.headlineSmall!
        .copyWith(fontWeight: FontWeight.normal);
    double screenWidth = context.width;

    return _createAppBody(
        chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
        trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
        screenWidth,
        detailTextStyle);
  }

  // CREATE ============================================================================================================
  AppBodyInSafeArea _createAppBody(
          ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit
              chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
          TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc
              trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
          double screenWidth,
          TextStyle detailTextStyle) =>
      AppBodyInSafeArea(
          child: _bringTrainingOfferResponseFromDatabaseAndDisplayThem(
              chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
              trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
              screenWidth,
              detailTextStyle));

  // SKELTON ===========================================================================================================
  BasicScrollView _createFindACoachBoxSkeltonArea() =>
      BasicScrollView(children: [
        AppWrap(
            wrapSpacing: 18,
            wrapRunSpacing: 0,
            children: _generateFindACoachBoxSkeltonArea())
      ]);

  // GENERATE ==========================================================================================================
  List<Widget> _generateFindACoachBoxSkeltonArea() =>
      List.generate(3, (index) => const SkeltonOfTraining());

  // BLOC ==============================================================================================================
  BlocBuilder<TrainingOfferResponseDynamicRespondedByTraineeBloc,
          TrainingOfferResponseDynamicRespondedByTraineeState>
      _bringTrainingOfferResponseFromDatabaseAndDisplayThem(
    ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit
        chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc
        trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
    double screenWidth,
    TextStyle detailTextStyle,
  ) =>
          BlocBuilder<TrainingOfferResponseDynamicRespondedByTraineeBloc,
              TrainingOfferResponseDynamicRespondedByTraineeState>(
            builder: (context, responseState) {
              List<int?> uniqueListOfActivityNameId = <int?>[];
              _createUniqueListOfActivityNameId(
                  responseState, uniqueListOfActivityNameId);
              switch (responseState.status) {
                case StatusWithoutLoading.initial:
                  return _createFindACoachBoxSkeltonArea();
                case StatusWithoutLoading.success:
                  return _createTrainingDetailColumn(
                      responseState,
                      context,
                      chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
                      trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
                      uniqueListOfActivityNameId,
                      screenWidth,
                      detailTextStyle);
                case StatusWithoutLoading.failure:
                  return StateError(error: responseState.error);
              }
            },
          );

  // TRAINING DETAIL COLUMN ============================================================================================
  StatelessWidget _createTrainingDetailColumn(
      TrainingOfferResponseDynamicRespondedByTraineeState responseState,
      BuildContext context,
      ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit
          chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
      TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc
          trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
      List<int?> uniqueListOfActivityNameId,
      double screenWidth,
      TextStyle detailTextStyle) {
    if (_checkWhetherThereIsNoTrainingOfferResponse(responseState)) {
      return _displayEmptyReturn();
    } else {
      return _createTrainingDetailArea(
          context,
          responseState,
          chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
          trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
          uniqueListOfActivityNameId,
          screenWidth,
          detailTextStyle);
    }
  }

  // METHODS ===========================================================================================================
  bool _checkWhetherThereIsNoTrainingOfferResponse(
    TrainingOfferResponseDynamicRespondedByTraineeState responseState,
  ) =>
      responseState.trainingOfferResponseDynamicList.isEmpty;

  // EMPTY RETURN ======================================================================================================
  InformationAboutExisting _displayEmptyReturn() =>
      const InformationAboutExisting(detailLabel: 'response');

  // TRAINING DETAIL AREA ==============================================================================================
  BasicScrollView _createTrainingDetailArea(
    BuildContext context,
    TrainingOfferResponseDynamicRespondedByTraineeState responseState,
    ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit
        chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc
        trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
    List<int?> uniqueListOfActivityNameId,
    double screenWidth,
    TextStyle detailTextStyle,
  ) =>
      BasicScrollView(
          controller: _scrollController,
          children: _generateTrainingDetails(
              context,
              responseState,
              chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
              trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
              uniqueListOfActivityNameId,
              screenWidth,
              detailTextStyle));

  // GENERATE ==================================================================================================
  List<Widget> _generateTrainingDetails(
    BuildContext context,
    TrainingOfferResponseDynamicRespondedByTraineeState responseState,
    ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit
        chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc
        trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
    List<int?> uniqueListOfActivityNameId,
    double screenWidth,
    TextStyle detailTextStyle,
  ) =>
      List.generate(
          _getUniqueActivityNameListLength(
              responseState, uniqueListOfActivityNameId),
          (index) => index >= uniqueListOfActivityNameId.length
              ? const BottomLoader()
              : _createTrainingDetailBoxArea(
                  context,
                  responseState,
                  chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
                  trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
                  uniqueListOfActivityNameId,
                  screenWidth,
                  index,
                  detailTextStyle));

  // METHODS ===========================================================================================================
  bool _checkWhetherResponseReachedMax(
          TrainingOfferResponseDynamicRespondedByTraineeState responseState) =>
      responseState.hasReachedMax == true;

  // Get Methods -------------------------------------------------------------------------------------------------------
  int _getUniqueActivityNameListLength(
          TrainingOfferResponseDynamicRespondedByTraineeState responseState,
          List<int?> uniqueListOfActivityNameId) =>
      _checkWhetherResponseReachedMax(responseState)
          ? uniqueListOfActivityNameId.length
          : uniqueListOfActivityNameId.length + 1;

  // TRAINING DETAIL BOX AREA ==========================================================================================
  GestureDetector _createTrainingDetailBoxArea(
    BuildContext context,
    TrainingOfferResponseDynamicRespondedByTraineeState responseState,
    ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit
        chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc
        trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
    List<int?> uniqueListOfActivityNameId,
    double screenWidth,
    int index,
    TextStyle detailTextStyle,
  ) =>
      GestureDetector(
          onTap: () => _goToTrainingOfferResponsePageWithBringingNecessaryBlocs(
              context,
              responseState,
              chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
              trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
              uniqueListOfActivityNameId,
              index),
          child: _displayTrainingDetailChoiceColumn(context, responseState,
              uniqueListOfActivityNameId, screenWidth, index, detailTextStyle));

  // METHODS ===========================================================================================================
  void _goToTrainingOfferResponsePageWithBringingNecessaryBlocs(
    BuildContext context,
    TrainingOfferResponseDynamicRespondedByTraineeState responseState,
    ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit
        chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc
        trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
    List<int?> uniqueListOfActivityNameId,
    int index,
  ) {
    _assignClickedTrainingOfferResponseAsChosenTrainingOfferResponse(
        context,
        responseState,
        chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
        uniqueListOfActivityNameId,
        index);
    _bringTrainingOfferResponseFromDatabase(
        context,
        responseState,
        trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
        uniqueListOfActivityNameId,
        index);
    _goToChosenTrainingOfferResponseScreen(context);
  }

  // DISPLAY ===========================================================================================================
  CircleImageDetailedChoiceColumn _displayTrainingDetailChoiceColumn(
    BuildContext context,
    TrainingOfferResponseDynamicRespondedByTraineeState responseState,
    List<int?> uniqueListOfActivityNameId,
    double screenWidth,
    int index,
    TextStyle detailTextStyle,
  ) =>
      CircleImageDetailedChoiceColumn(
          additionalSpaceOnBottom: _appNumberConstants.kMainHeight,
          textStyle: detailTextStyle,
          imageWidget: _createHero(context, responseState,
              uniqueListOfActivityNameId, screenWidth, index),
          firstLabel: _displayTrainingActivityTitle(
              responseState, uniqueListOfActivityNameId, index),
          secondLabel: ''
          // _displayNumberOfTrainingOffer(
          //     responseState, uniqueListOfActivityNameId, index),
          );

  // TRAINING IMAGE WITH HERO ==========================================================================================
  Hero _createHero(
    BuildContext context,
    TrainingOfferResponseDynamicRespondedByTraineeState responseState,
    List<int?> uniqueListOfActivityNameId,
    double screenWidth,
    int index,
  ) =>
      Hero(
          tag: _heroTag(responseState, uniqueListOfActivityNameId, index),
          child: _displayTrainingPhoto(context, responseState,
              uniqueListOfActivityNameId, screenWidth, index));

  // METHODS ===========================================================================================================
  String _heroTag(
    TrainingOfferResponseDynamicRespondedByTraineeState responseState,
    List<int?> uniqueListOfActivityNameId,
    int index,
  ) =>
      uniqueListOfActivityNameId.elementAt(index).toString();

  // TRAINING IMAGE ====================================================================================================
  CustomImageContainer _displayTrainingPhoto(
    BuildContext context,
    TrainingOfferResponseDynamicRespondedByTraineeState responseState,
    List<int?> uniqueListOfActivityNameId,
    double screenWidth,
    int index,
  ) =>
      CustomImageContainer(
          height: 200,
          width: screenWidth,
          asset: _displayTrainingImage(
              responseState, uniqueListOfActivityNameId, index));

  String _displayTrainingImage(
    TrainingOfferResponseDynamicRespondedByTraineeState responseState,
    List<int?> uniqueListOfActivityNameId,
    int index,
  ) =>
      'assets/images/activities/${_findTrainingActivityTitle(responseState, uniqueListOfActivityNameId, index).toLowerCase()}.jpg';

  // Get Methods -------------------------------------------------------------------------------------------------------
  Iterable<TrainingOfferResponseDynamic>
      _getTrainingOfferResponseBasedOnUniqueActivityName(
              TrainingOfferResponseDynamicRespondedByTraineeState responseState,
              List<int?> uniqueListOfActivityNameId,
              int index) =>
          responseState.trainingOfferResponseDynamicList.where((element) =>
              element.trainingOfferDynamic.trainingDetailDynamic
                  .activityNameDynamic.activityNameId ==
              uniqueListOfActivityNameId.elementAt(index));

  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findTrainingActivityTitle(
          TrainingOfferResponseDynamicRespondedByTraineeState responseState,
          List<int?> uniqueListOfActivityNameId,
          int index) =>
      _getTrainingOfferResponseBasedOnUniqueActivityName(
              responseState, uniqueListOfActivityNameId, index)
          .first
          .trainingOfferDynamic
          .trainingDetailDynamic
          .activityNameDynamic
          .activityTitle;

  // TRAINING ACTIVITY TITLE ===========================================================================================
  String _displayTrainingActivityTitle(
    TrainingOfferResponseDynamicRespondedByTraineeState responseState,
    List<int?> uniqueListOfActivityNameId,
    int index,
  ) =>
      _appFunctions.setWithoutUnderscore(
          _getTrainingOfferResponseBasedOnUniqueActivityName(
                  responseState, uniqueListOfActivityNameId, index)
              .first
              .trainingOfferDynamic
              .trainingDetailDynamic
              .activityNameDynamic
              .activityTitle);

  String _displayNumberOfTrainingOffer(
    TrainingOfferResponseDynamicRespondedByTraineeState responseState,
    List<int?> uniqueListOfActivityNameId,
    int index,
  ) =>
      '(${_getTrainingOfferResponseBasedOnUniqueActivityName(responseState, uniqueListOfActivityNameId, index).toList().length} ${_getTrainingOfferResponseBasedOnUniqueActivityName(responseState, uniqueListOfActivityNameId, index).toList().length <= 1 ? 'coach)' : 'coaches)'}';

  // METHODS ===========================================================================================================
  void _createUniqueListOfActivityNameId(
      TrainingOfferResponseDynamicRespondedByTraineeState responseState,
      List<int?> uniqueListOfActivityNameId) {
    for (var element in responseState.trainingOfferResponseDynamicList) {
      if (uniqueListOfActivityNameId.contains(element.trainingOfferDynamic
          .trainingDetailDynamic.activityNameDynamic.activityNameId)) {
      } else {
        uniqueListOfActivityNameId.add(element.trainingOfferDynamic
            .trainingDetailDynamic.activityNameDynamic.activityNameId);
      }
    }
  }

  // Database Methods --------------------------------------------------------------------------------------------------
  void _bringTrainingOfferResponseFromDatabase(
    BuildContext context,
    TrainingOfferResponseDynamicRespondedByTraineeState responseState,
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc
        trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
    List<int?> uniqueListOfActivityNameId,
    int index,
  ) =>
      trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc.add(
          LoadTrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeEvent(
              traineeId: _findAppUserId,
              activityNameId: _findChosenTrainingActivityNameId(
                  responseState, uniqueListOfActivityNameId, index)));

  void _assignClickedTrainingOfferResponseAsChosenTrainingOfferResponse(
    BuildContext context,
    TrainingOfferResponseDynamicRespondedByTraineeState responseState,
    ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit
        chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
    List<int?> uniqueListOfActivityNameId,
    int index,
  ) {
    chosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit
        .pressTraining(_getTrainingOfferResponseBasedOnUniqueActivityName(
                responseState, uniqueListOfActivityNameId, index)
            .toList());
  }

  // Find Methods ------------------------------------------------------------------------------------------------------
  int _findChosenTrainingActivityNameId(
    TrainingOfferResponseDynamicRespondedByTraineeState responseState,
    List<int?> uniqueListOfActivityNameId,
    int index,
  ) =>
      uniqueListOfActivityNameId.elementAt(index)!;

  int get _findAppUserId => _appNumberConstants.appUserId;

  // Screen Method -----------------------------------------------------------------------------------------------------
  void _goToChosenTrainingOfferResponseScreen(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenOfCoachOffer.routeName);
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
        //if (kDebugMode) {
        //   print(
        //       'the lenght of the list is: ${context.read<TrainingOfferResponseDynamicRespondedByTraineeBloc>().state.trainingOfferResponseDynamicList.length}');
        // }
        List<int?> uniqueActivityNameIdList = <int?>[];
        for (var element in context
            .read<TrainingOfferResponseDynamicRespondedByTraineeBloc>()
            .state
            .trainingOfferResponseDynamicList) {
          if (uniqueActivityNameIdList
              .contains(_findTrainingActivityNameId(element))) {
          } else {
            uniqueActivityNameIdList.add(_findTrainingActivityNameId(element));
          }
        }
        context.read<TrainingOfferResponseDynamicRespondedByTraineeBloc>().add(
            LoadTrainingOfferResponseDynamicRespondedByTraineeEvent(
                traineeId: _findAppUserId,
                offset: uniqueActivityNameIdList.length));
      }
    }
  }

  // METHODS ===========================================================================================================
  int? _findTrainingActivityNameId(TrainingOfferResponseDynamic element) =>
      element.trainingOfferDynamic.trainingDetailDynamic.activityNameDynamic
          .activityNameId;
}
