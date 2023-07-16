import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import '../local_widgets/zlocal_widgets.dart';

class TrainingRequestResponseBodyTrainingRequestResponseTitleArea
    extends StatelessWidget {
  final AppDateFormat _appDateFormat = AppDateFormat();
  final ChosenTrainingRequestAmongTrainingRequestDynamicOfUserState chosenState;

  TrainingRequestResponseBodyTrainingRequestResponseTitleArea({
    required this.chosenState,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //
    // final double screenWidth = MediaQuery.of(context).size.width;
    // final TextStyle displaySmall = Theme.of(context).textTheme.displaySmall!;
    final double screenWidth = context.width;
    final TextStyle displaySmall = context.textTheme.displaySmall!;

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
  BlocBuilder<TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc,
          TrainingRequestResponseDynamicWithDistanceByTrainingRequestState>
      _bringResponseNumberAndCreateResponseTitleArea(
    ChosenTrainingRequestAmongTrainingRequestDynamicOfUserState chosenState,
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
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    ChosenTrainingRequestAmongTrainingRequestDynamicOfUserState chosenState,
    TextStyle? displaySmall,
  ) =>
      AppHeader(
          firstWidget: _displayResponseTitleAndNumber(state, displaySmall),
          thirdWidget: _displayActivityDate(chosenState, displaySmall));

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayEmtyState(TextStyle? displaySmall) =>
      AppHeaderText(textLabel: 'Response (0)', textStyle: displaySmall);

  AppHeaderText _displayResponseTitleAndNumber(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
    TextStyle? displaySmall,
  ) =>
      AppHeaderText(
          textLabel:
              'Responses (${_findLengthOfReleventTrainingResponse(state)})',
          textStyle: displaySmall);

  AppHeaderText _displayActivityDate(
    ChosenTrainingRequestAmongTrainingRequestDynamicOfUserState chosenState,
    TextStyle? displaySmall,
  ) =>
      AppHeaderText(
          textLabel: _findAndCorrectAppDateFormat(chosenState),
          textStyle: displaySmall);

  /// METHODS ==========================================================================================================
  /// Find Methods -----------------------------------------------------------------------------------------------------
  int _findLengthOfReleventTrainingResponse(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
  ) =>
      state.trainingRequestResponseDynamicWithDistanceList.length;

  String _findAndCorrectAppDateFormat(
    ChosenTrainingRequestAmongTrainingRequestDynamicOfUserState chosenState,
  ) =>
      _appDateFormat.monthAndDayWithDayName.format(
          _findCreatedDateOfRelevantTrainingRequestResponse(chosenState));

  DateTime _findCreatedDateOfRelevantTrainingRequestResponse(
    ChosenTrainingRequestAmongTrainingRequestDynamicOfUserState chosenState,
  ) =>
      chosenState.chosenTrainingRequestDynamicList.last.createdAt;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkNoResponse(
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestState state,
  ) =>
      state.trainingRequestResponseDynamicWithDistanceList.isEmpty;
}
