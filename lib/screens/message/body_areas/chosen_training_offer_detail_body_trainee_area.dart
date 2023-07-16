import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenTrainingOfferDetailBodyTraineeArea extends StatelessWidget {
  const ChosenTrainingOfferDetailBodyTraineeArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall!;

    return Column(
      children: [
        _buildTraineeAreaAfterBringingTraineeNumberFromDB(
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
  BlocBuilder<TrainingOfferResponseDynamicWithDistanceByTrainingOfferBloc,
          TrainingOfferResponseDynamicWithDistanceByTrainingOfferState>
      _buildTraineeAreaAfterBringingTraineeNumberFromDB(
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
                // case Status.loading:
                //   return _createSkeltonArea(screenWidth);
                case StatusWithoutLoading.success:
                  if (isTraineeListEmpty(state)) {
                    return _createEmptyStateArea(displaySmall);
                  } else {
                    return _createTraineeArea(state, displaySmall);
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

  AppHeader _createTraineeArea(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    TextStyle? displaySmall,
  ) =>
      AppHeader(
          firstWidget: _displayTraineeTitleAndNumber(state, displaySmall));

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayEmptyState(
    TextStyle? displaySmall,
  ) =>
      AppHeaderText(textLabel: 'Trainee (0)', textStyle: displaySmall);

  AppHeaderText _displayTraineeTitleAndNumber(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
    TextStyle? displaySmall,
  ) =>
      AppHeaderText(
        textLabel: 'Trainees (${_findTraineeNumbers(state)})',
        textStyle: displaySmall,
      );

  /// METHODS ==========================================================================================================
  /// Check Method -----------------------------------------------------------------------------------------------------
  bool isTraineeListEmpty(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
  ) =>
      state.trainingOfferResponseDynamicWithDistanceList.isEmpty;

  /// Other Method -----------------------------------------------------------------------------------------------------
  int _findTraineeNumbers(
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState state,
  ) =>
      state.trainingOfferResponseDynamicWithDistanceList
          .where((element) =>
              element.processDetailDynamic.processName == "Approved")
          .length;
}
