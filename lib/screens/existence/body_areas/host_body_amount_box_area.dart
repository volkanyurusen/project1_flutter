import 'package:flutter/material.dart';

import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class HostBodyAmountBoxArea extends StatelessWidget {
  final AppFunctions _appFunctions = AppFunctions();
  final AppVisualConstants _appVisualConstants = AppVisualConstants();
  final ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit;
  final double screenWidth;

  HostBodyAmountBoxArea({
    required this.chosenHostWhoCreatedActivityCubit,
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _createActivityAmountBoxes(
            chosenHostWhoCreatedActivityCubit, screenWidth),
        const CustomAppSizedBox(),
      ],
    );
  }

  /// SKELTON ==========================================================================================================
  SkeltonContainer _displayBoxSkelton() => SkeltonContainer(
        height: 40,
        width: 30,
        borderRadius: _appVisualConstants.borderRadiusSmallCircular,
      );

  /// CREATE ===========================================================================================================
  AppHeader _createActivityAmountBoxes(
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit,
    double screenWidth,
  ) =>
      AppHeader(
          firstWidget: _createCreationBoxArea(
              screenWidth, chosenHostWhoCreatedActivityCubit),
          thirdWidget: _createAttendanceBoxArea(
              screenWidth, chosenHostWhoCreatedActivityCubit));

  DisplayerBoxOfActivityAmount _createCreationBoxArea(
    double screenWidth,
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit,
  ) =>
      DisplayerBoxOfActivityAmount(
          screenWidth: screenWidth,
          widget: _displayCreationBox(chosenHostWhoCreatedActivityCubit));

  DisplayerBoxOfActivityAmount _createAttendanceBoxArea(
    double screenWidth,
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit,
  ) =>
      DisplayerBoxOfActivityAmount(
          screenWidth: screenWidth,
          widget: _displayAttendanceBox(chosenHostWhoCreatedActivityCubit));

  /// BLOCS ============================================================================================================
  BlocBuilder<ConsistedActivityDynamicWithDistanceByUserBloc,
          ConsistedActivityDynamicWithDistanceByUserState>
      _bringNumberOfActivityCreation(
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit,
  ) =>
          BlocBuilder<ConsistedActivityDynamicWithDistanceByUserBloc,
              ConsistedActivityDynamicWithDistanceByUserState>(
            builder: (context, creationBoxState) {
              switch (creationBoxState.status) {
                case Status.initial:
                  return _displayBoxSkelton();
                case Status.loading:
                  return _displayBoxSkelton();
                case Status.success:
                  return _displayCreationNumber(
                      creationBoxState, chosenHostWhoCreatedActivityCubit);
                case Status.failure:
                  return StateError(error: creationBoxState.error);
              }
            },
          );

  BlocBuilder<ConsistedActivityDynamicWithDistanceByUserBloc,
          ConsistedActivityDynamicWithDistanceByUserState>
      _bringNumberOfActivityAttendance(
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit,
  ) =>
          BlocBuilder<ConsistedActivityDynamicWithDistanceByUserBloc,
              ConsistedActivityDynamicWithDistanceByUserState>(
            builder: (context, attandanceBoxState) {
              switch (attandanceBoxState.status) {
                case Status.initial:
                  return _displayBoxSkelton();
                case Status.loading:
                  return _displayBoxSkelton();
                case Status.success:
                  return _displayAttendanceNumber(
                      attandanceBoxState, chosenHostWhoCreatedActivityCubit);
                case Status.failure:
                  return StateError(error: attandanceBoxState.error);
              }
            },
          );

  /// DISPLAY ==========================================================================================================
  ColumnOfActivityAmountBox _displayCreationBox(
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit,
  ) =>
      ColumnOfActivityAmountBox(children: [
        NameOfActivityAmountBox(boxLabel: 'Creation'),
        _bringNumberOfActivityCreation(chosenHostWhoCreatedActivityCubit),
        const CustomAppSizedBox()
      ]);

  ColumnOfActivityAmountBox _displayAttendanceBox(
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit,
  ) =>
      ColumnOfActivityAmountBox(children: [
        NameOfActivityAmountBox(boxLabel: 'Attendance'),
        _bringNumberOfActivityAttendance(chosenHostWhoCreatedActivityCubit),
        const CustomAppSizedBox()
      ]);

  NumberOfActivityAmountBox _displayCreationNumber(
    ConsistedActivityDynamicWithDistanceByUserState creationBoxState,
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit,
  ) =>
      NumberOfActivityAmountBox(
          numberLabel: _findCreationNumber(
              creationBoxState, chosenHostWhoCreatedActivityCubit));

  NumberOfActivityAmountBox _displayAttendanceNumber(
          ConsistedActivityDynamicWithDistanceByUserState attandanceBoxState,
          ChosenHostWhoCreatedActivityCubit
              chosenHostWhoCreatedActivityCubit) =>
      NumberOfActivityAmountBox(
          numberLabel: _findAttendanceNumber(
              attandanceBoxState, chosenHostWhoCreatedActivityCubit));

  /// METHODS ==========================================================================================================
  String _findCreationNumber(
    ConsistedActivityDynamicWithDistanceByUserState creationBoxState,
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit,
  ) =>
      _appFunctions.calculateNumberOfActivityCreatedByIndividualUser(
          creationBoxState.consistedActivityDynamicWithDistanceList,
          _findUserId(chosenHostWhoCreatedActivityCubit));

  String _findAttendanceNumber(
    ConsistedActivityDynamicWithDistanceByUserState attandanceBoxState,
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit,
  ) =>
      _appFunctions.calculateNumberOfActivityAttendedByIndividualUser(
          attandanceBoxState.consistedActivityDynamicWithDistanceList,
          _findUserId(chosenHostWhoCreatedActivityCubit));

  int? _findUserId(
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit,
  ) =>
      chosenHostWhoCreatedActivityCubit.state.chosenConsistedActivityDynamicWithDistance.last
          .createdActivityDynamic.host.uId;
}
