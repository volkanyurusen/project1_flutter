import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenActivityDetailBodyAttendeeArea extends StatelessWidget {
  const ChosenActivityDetailBodyAttendeeArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle? displaySmall  = Theme.of(context).textTheme.displaySmall !;

    return Column(
      children: [
        _buildAttendeeAreaAfterBringingAttendeeNumberFromDB(
            screenWidth, displaySmall ),
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
  BlocBuilder<ConsistedActivityDynamicWithDistanceByCreatedActivityBloc,
          ConsistedActivityDynamicWithDistanceByCreatedActivityState>
      _buildAttendeeAreaAfterBringingAttendeeNumberFromDB(
    double screenWidth,
    TextStyle? displaySmall ,
  ) =>
          BlocBuilder<ConsistedActivityDynamicWithDistanceByCreatedActivityBloc,
              ConsistedActivityDynamicWithDistanceByCreatedActivityState>(
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return _createSkeltonArea(screenWidth);
                case Status.loading:
                  return _createSkeltonArea(screenWidth);
                case Status.success:
                  if (isAttendeeListEmpty(state)) {
                    return _createEmptyStateArea(displaySmall );
                  } else {
                    return _createAttendeeArea(state, displaySmall );
                  }
                case Status.failure:
                  return StateError(error: state.error);
              }
            },
          );

  /// CREATE ===========================================================================================================
  AppHeader _createEmptyStateArea(
    TextStyle? displaySmall ,
  ) =>
      AppHeader(firstWidget: _displayEmptyState(displaySmall ));

  AppHeader _createAttendeeArea(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
    TextStyle? displaySmall ,
  ) =>
      AppHeader(firstWidget: _displayAttendeeTitleAndNumber(state, displaySmall ));

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayEmptyState(
    TextStyle? displaySmall ,
  ) =>
      AppHeaderText(textLabel: 'Attendee (0)', textStyle: displaySmall );

  AppHeaderText _displayAttendeeTitleAndNumber(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
    TextStyle? displaySmall ,
  ) =>
      AppHeaderText(
        textLabel: 'Attendees (${_findAttendeeNumbers(state)})',
        textStyle: displaySmall ,
      );

  /// METHODS ==========================================================================================================
  /// Check Method -----------------------------------------------------------------------------------------------------
  bool isAttendeeListEmpty(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
  ) =>
      state.consistedActivityDynamicWithDistanceList.isEmpty;

  /// Other Method -----------------------------------------------------------------------------------------------------
  int _findAttendeeNumbers(
    ConsistedActivityDynamicWithDistanceByCreatedActivityState state,
  ) =>
      state.consistedActivityDynamicWithDistanceList
          .where((element) =>
              element.processDetailDynamic.processName == "Approved")
          .length;
}
