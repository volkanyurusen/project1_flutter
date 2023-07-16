import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenTrainingRequestDetailBodyCoachArea extends StatelessWidget {
  const ChosenTrainingRequestDetailBodyCoachArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall!;

    return Column(
      children: [
        _buildCoachAreaAfterBringingCoachNumberFromDB(
            screenWidth, displaySmall),
        const CustomAppSizedBox(height: 9),
        CustomAppDivider(),
      ],
    );
  }

  /// SKELTON ==========================================================================================================
  AppHeader _createSkeltonArea(double screenWidth) =>
      AppHeader(firstWidget: _displaySkeltonContainer(screenWidth));

  SkeltonContainer _displaySkeltonContainer(double screenWidth) =>
      SkeltonContainer(height: 24, width: screenWidth * 0.35);

  /// BLOC ===========================================================================================================
  BlocBuilder<TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc,
          TrainingRequestResponseDynamicWithDistanceByTrainingRequestState>
      _buildCoachAreaAfterBringingCoachNumberFromDB(
    double screenWidth,
    TextStyle? displaySmall,
  ) =>
          BlocBuilder<
              TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc,
              TrainingRequestResponseDynamicWithDistanceByTrainingRequestState>(
            builder: (context, state) {
              switch (state.status) {
                case StatusWithoutLoading.initial:
                  return _createSkeltonArea(screenWidth);
                case StatusWithoutLoading.success:
                  if (isCoachListEmpty(state)) {
                    return _createEmptyStateArea(displaySmall);
                  } else {
                    return _createCoachArea(state, displaySmall);
                  }
                case StatusWithoutLoading.failure:
                  return StateError(error: state.error);
              }
            },
          );

  /// CREATE ===========================================================================================================
  AppHeader _createEmptyStateArea(
    TextStyle? displaySmall,
  ) =>
      AppHeader(firstWidget: _displayEmptyState(displaySmall));

  AppHeader _createCoachArea(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    TextStyle? displaySmall,
  ) =>
      AppHeader(firstWidget: _displayCoachTitleAndNumber(state, displaySmall));

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayEmptyState(
    TextStyle? displaySmall,
  ) =>
      AppHeaderText(textLabel: 'Coach (0)', textStyle: displaySmall);

  AppHeaderText _displayCoachTitleAndNumber(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    TextStyle? displaySmall,
  ) =>
      AppHeaderText(
        textLabel: 'Coaches (${_findCoachNumbers(state)})',
        textStyle: displaySmall,
      );

  /// METHODS ==========================================================================================================
  /// Check Method -----------------------------------------------------------------------------------------------------
  bool isCoachListEmpty(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
  ) =>
      state.trainingRequestResponseDynamicWithDistanceList.isEmpty;

  /// Other Method -----------------------------------------------------------------------------------------------------
  int _findCoachNumbers(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
  ) =>
      state.trainingRequestResponseDynamicWithDistanceList
          .where((element) =>
              element.processDetailDynamic.processName == "Approved")
          .length;
}
