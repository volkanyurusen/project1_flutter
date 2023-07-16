import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import '../local_widgets/zlocal_widgets.dart';

class TrainingOfferResponseBodyTrainingOfferResponseTitleArea
    extends StatelessWidget {
  final AppDateFormat _appDateFormat = AppDateFormat();
  final ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState chosenState;

  TrainingOfferResponseBodyTrainingOfferResponseTitleArea(
      {required this.chosenState, super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall!;

    return CustomColumn(
      children: [
        _bringResponseNumberAndCreateResponseTitleArea(
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

  /// BLOC =============================================================================================================
  BlocBuilder<TrainingOfferResponseDynamicWithDistanceByTrainingOfferBloc,
          TrainingOfferResponseDynamicWithDistanceByTrainingOfferState>
      _bringResponseNumberAndCreateResponseTitleArea(
    ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState chosenState,
    double screenWidth,
    TextStyle? displaySmall,
  ) =>
          BlocBuilder<
                  TrainingOfferResponseDynamicWithDistanceByTrainingOfferBloc,
                  TrainingOfferResponseDynamicWithDistanceByTrainingOfferState>(
              builder: (context, state) {
            switch (state.status) {
              case StatusWithoutLoading.initial:
                return _createSkeltonArea(screenWidth);
              case StatusWithoutLoading.success:
                if (_checkNoResponse(state)) {
                  return _createEmptyResponseTitleArea(displaySmall);
                } else {
                  return _createResponseTitleArea(
                      state, chosenState, displaySmall);
                }
              case StatusWithoutLoading.failure:
                return StateError(error: state.error);
            }
          });

  /// CREATE ===========================================================================================================

  AppHeader _createEmptyResponseTitleArea(TextStyle? displaySmall) =>
      AppHeader(firstWidget: _displayEmtyState(displaySmall));

  AppHeader _createResponseTitleArea(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState chosenState,
    TextStyle? displaySmall,
  ) =>
      AppHeader(
          firstWidget: _displayResponseTitleAndNumber(state, displaySmall),
          thirdWidget: _displayActivityDate(chosenState, displaySmall));

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayEmtyState(TextStyle? displaySmall) =>
      AppHeaderText(textLabel: 'Response (0)', textStyle: displaySmall);

  AppHeaderText _displayResponseTitleAndNumber(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    TextStyle? displaySmall,
  ) =>
      AppHeaderText(
          textLabel:
              'Responses (${_findLengthOfReleventTrainingResponse(state)})',
          textStyle: displaySmall);

  AppHeaderText _displayActivityDate(
    ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState chosenState,
    TextStyle? displaySmall,
  ) =>
      AppHeaderText(
          textLabel: _findAndCorrectAppDateFormat(chosenState),
          textStyle: displaySmall);

  /// METHODS ==========================================================================================================
  /// Find Methods -----------------------------------------------------------------------------------------------------
  int _findLengthOfReleventTrainingResponse(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
  ) =>
      state.trainingOfferResponseDynamicWithDistanceList.length;

  String _findAndCorrectAppDateFormat(
    ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState chosenState,
  ) =>
      _appDateFormat.monthAndDayWithDayName
          .format(_findCreatedDateOfRelevantTrainingOfferResponse(chosenState));

  DateTime _findCreatedDateOfRelevantTrainingOfferResponse(
    ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState chosenState,
  ) =>
      chosenState.chosenTrainingOfferDynamicList.last.createdAt;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkNoResponse(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
  ) =>
      state.trainingOfferResponseDynamicWithDistanceList.isEmpty;
}
