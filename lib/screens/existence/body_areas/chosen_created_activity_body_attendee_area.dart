import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenCreatedActivityBodyAttendeeArea extends StatelessWidget {
  final ChosenActivityAmongCreatedActivityDynamicCreatedByUserState chosenState;
  final double screenWidth;

  const ChosenCreatedActivityBodyAttendeeArea({
    required this.chosenState,
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall!;

    return Column(
      children: [
        _buildAttendeeAreaAfterBringingAttendeeNumberFromDB(
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

  /// BLOC =============================================================================================================
  BlocBuilder<
          ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessBloc,
          ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState>
      _buildAttendeeAreaAfterBringingAttendeeNumberFromDB(
    double screenWidth,
    TextStyle? displaySmall,
  ) =>
          BlocBuilder<
              ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessBloc,
              ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState>(
            builder: (context, state) {
              switch (state.status) {
                case StatusWithoutLoading.initial:
                  return _createSkeltonArea(screenWidth);
                case StatusWithoutLoading.success:
                  if (isAttendeeListEmpty(state)) {
                    return _createEmptyStateArea(displaySmall);
                  } else {
                    return _createAttendeeArea(state, displaySmall);
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

  AppHeader _createAttendeeArea(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState
        state,
    TextStyle? displaySmall,
  ) =>
      AppHeader(
          firstWidget: _displayAttendeeTitleAndNumber(state, displaySmall));

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayEmptyState(
    TextStyle? displaySmall,
  ) =>
      AppHeaderText(textLabel: 'Attendee (0)', textStyle: displaySmall);

  AppHeaderText _displayAttendeeTitleAndNumber(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState
        state,
    TextStyle? displaySmall,
  ) =>
      AppHeaderText(
        textLabel: 'Attendees (${_findAttendeeNumbers(state)})',
        textStyle: displaySmall,
      );

  /// METHODS ==========================================================================================================
  /// Check Method -----------------------------------------------------------------------------------------------------
  bool isAttendeeListEmpty(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState
        state,
  ) =>
      state.consistedActivityDynamicWithDistanceList.isEmpty;

  /// Other Method -----------------------------------------------------------------------------------------------------
  int _findAttendeeNumbers(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState
        state,
  ) =>
      state.consistedActivityDynamicWithDistanceList.length;
}
