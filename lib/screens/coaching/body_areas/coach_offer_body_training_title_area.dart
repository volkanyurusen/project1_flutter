import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/training_offer_response_dynamic_with_distance.dart';
import 'package:my_project/screens/coaching/local_widgets/zlocal_widgets.dart';
import 'package:my_project/widgets/widget.dart';

class CoachOfferBodyTrainingTitleArea extends StatelessWidget {
  final ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeState
      chosenState;

  const CoachOfferBodyTrainingTitleArea({required this.chosenState, super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall!;

    return CustomColumn(
      children: [
        _bringOfferNumberAndCreateOfferTitleArea(
            chosenState, screenWidth, displaySmall),
        const CustomAppSizedBox(height: 9),
        CustomAppDivider(),
      ],
    );
  }

  /// SKELTONS =========================================================================================================
  AppHeader _createSkeltonArea(double screenWidth) =>
      _displaySkeltonContainer(screenWidth);

  AppHeader _displaySkeltonContainer(double screenWidth) => const AppHeader(
      firstWidget: SkeltonOfHeader(), thirdWidget: SkeltonOfHeader());

  /// TITLE AREA =======================================================================================================
  /// BLOC =============================================================================================================
  BlocBuilder<
          TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
          TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState>
      _bringOfferNumberAndCreateOfferTitleArea(
    ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeState
        chosenState,
    double screenWidth,
    TextStyle? displaySmall,
  ) =>
          BlocBuilder<
                  TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc,
                  TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState>(
              builder: (context, state) {
            switch (state.status) {
              case StatusWithoutLoading.initial:
                return _createSkeltonArea(screenWidth);
              case StatusWithoutLoading.success:
                return _createCorrectOfferTitleArea(
                    state, displaySmall, chosenState);
              case StatusWithoutLoading.failure:
                return StateError(error: state.error);
            }
          });

  /// CREATE ===========================================================================================================
  AppHeader _createCorrectOfferTitleArea(
      TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
          state,
      TextStyle? displaySmall,
      ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeState
          chosenState) {
    if (_checkNoResponse(state)) {
      return _createEmptyOfferTitleArea(displaySmall);
    } else {
      return _createOfferTitleArea(state, chosenState, displaySmall);
    }
  }

  /// EMPTY OFFER ======================================================================================================
  /// CREATE ===========================================================================================================
  AppHeader _createEmptyOfferTitleArea(TextStyle? displaySmall) =>
      AppHeader(firstWidget: _displayEmtyState(displaySmall));

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayEmtyState(TextStyle? displaySmall) =>
      AppHeaderText(textLabel: 'Offer (0)', textStyle: displaySmall);

  /// OFFER TITLE AREA =================================================================================================
  /// CREATE ===========================================================================================================
  AppHeader _createOfferTitleArea(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeState
        chosenState,
    TextStyle? displaySmall,
  ) =>
      AppHeader(firstWidget: _displayOfferTitleAndNumber(state, displaySmall));

  /// TITLE AND NUMBER =================================================================================================
  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayOfferTitleAndNumber(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
    TextStyle? displaySmall,
  ) =>
      AppHeaderText(
          textLabel: 'Offers (${_findLengthOfReleventTrainingResponse(state)})',
          textStyle: displaySmall);

  /// METHODS ==========================================================================================================
  /// Get Methods ------------------------------------------------------------------------------------------------------
  Iterable<TrainingOfferResponseDynamicWithDistance>
      _getTrainingOfferResponseListBasedOnActivityNameId(
              TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
                  state) =>
          state.trainingOfferResponseDynamicWithDistanceList.where((element) =>
              element.trainingOfferDynamic.trainingDetailDynamic
                  .activityNameDynamic.activityNameId ==
              _findChosenActivityNameId);

  /// Find Methods -----------------------------------------------------------------------------------------------------
  int _findLengthOfReleventTrainingResponse(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
  ) =>
      _getTrainingOfferResponseListBasedOnActivityNameId(state).toList().length;

  int? get _findChosenActivityNameId => chosenState
      .chosenTrainingOfferResponseDynamicList
      .last
      .trainingOfferDynamic
      .trainingDetailDynamic
      .activityNameDynamic
      .activityNameId;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkNoResponse(
    TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
        state,
  ) =>
      state.trainingOfferResponseDynamicWithDistanceList.isEmpty;
}
