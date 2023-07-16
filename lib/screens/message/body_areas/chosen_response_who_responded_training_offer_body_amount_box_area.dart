import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenResponseWhoRespondedTrainingOfferBodyAmountBoxArea
    extends StatelessWidget {
  final AppFunctions _appFunctions = AppFunctions();
  final AppVisualConstants _appVisualConstants = AppVisualConstants();
  final ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
      chosenResponseAmongThoseWhoRespondedTrainingOfferCubit;
  final double screenWidth;

  ChosenResponseWhoRespondedTrainingOfferBodyAmountBoxArea({
    required this.chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _createActivityAmountBoxes(screenWidth),
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
    double screenWidth,
  ) =>
      AppHeader(
          firstWidget: _createCreationBoxArea(screenWidth),
          thirdWidget: _createAttendanceBoxArea(screenWidth));

  DisplayerBoxOfActivityAmount _createCreationBoxArea(
    double screenWidth,
  ) =>
      DisplayerBoxOfActivityAmount(
          screenWidth: screenWidth, widget: _displayCreationBox());

  DisplayerBoxOfActivityAmount _createAttendanceBoxArea(
    double screenWidth,
  ) =>
      DisplayerBoxOfActivityAmount(
          screenWidth: screenWidth, widget: _displayAttendanceBox());

  /// BLOCS ============================================================================================================
  BlocBuilder<ConsistedActivityDynamicWithDistanceByUserBloc,
          ConsistedActivityDynamicWithDistanceByUserState>
      _bringNumberOfActivityCreation() => BlocBuilder<
              ConsistedActivityDynamicWithDistanceByUserBloc,
              ConsistedActivityDynamicWithDistanceByUserState>(
            builder: (context, creationBoxState) {
              switch (creationBoxState.status) {
                case Status.initial:
                  return _displayBoxSkelton();
                case Status.loading:
                  return _displayBoxSkelton();
                case Status.success:
                  return _displayCreationNumber(context, creationBoxState);
                case Status.failure:
                  return StateError(error: creationBoxState.error);
              }
            },
          );

  BlocBuilder<ConsistedActivityDynamicWithDistanceByUserBloc,
          ConsistedActivityDynamicWithDistanceByUserState>
      _bringNumberOfActivityAttendance() => BlocBuilder<
              ConsistedActivityDynamicWithDistanceByUserBloc,
              ConsistedActivityDynamicWithDistanceByUserState>(
            builder: (context, attandanceBoxState) {
              switch (attandanceBoxState.status) {
                case Status.initial:
                  return _displayBoxSkelton();
                case Status.loading:
                  return _displayBoxSkelton();
                case Status.success:
                  return _displayAttendanceNumber(context, attandanceBoxState);
                case Status.failure:
                  return StateError(error: attandanceBoxState.error);
              }
            },
          );

  /// DISPLAY ==========================================================================================================
  ColumnOfActivityAmountBox _displayCreationBox() => ColumnOfActivityAmountBox(
        children: [
          NameOfActivityAmountBox(boxLabel: 'Creation'),
          _bringNumberOfActivityCreation(),
          const CustomAppSizedBox()
        ],
      );

  ColumnOfActivityAmountBox _displayAttendanceBox() =>
      ColumnOfActivityAmountBox(
        children: [
          NameOfActivityAmountBox(boxLabel: 'Attendance'),
          _bringNumberOfActivityAttendance(),
          const CustomAppSizedBox()
        ],
      );

  NumberOfActivityAmountBox _displayCreationNumber(
    BuildContext context,
    ConsistedActivityDynamicWithDistanceByUserState creationBoxState,
  ) =>
      NumberOfActivityAmountBox(
          numberLabel: _findCreationNumber(context, creationBoxState));

  NumberOfActivityAmountBox _displayAttendanceNumber(
    BuildContext context,
    ConsistedActivityDynamicWithDistanceByUserState attandanceBoxState,
  ) =>
      NumberOfActivityAmountBox(
          numberLabel: _findAttendanceNumber(context, attandanceBoxState));

  /// METHODS ==========================================================================================================
  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findCreationNumber(
    BuildContext context,
    ConsistedActivityDynamicWithDistanceByUserState creationBoxState,
  ) =>
      _appFunctions.calculateNumberOfActivityCreatedByIndividualUser(
          creationBoxState.consistedActivityDynamicWithDistanceList,
          _findUserId(context));

  String _findAttendanceNumber(
    BuildContext context,
    ConsistedActivityDynamicWithDistanceByUserState attandanceBoxState,
  ) =>
      _appFunctions.calculateNumberOfActivityAttendedByIndividualUser(
          attandanceBoxState.consistedActivityDynamicWithDistanceList,
          _findUserId(context));

  int? _findUserId(
    BuildContext context,
  ) =>
      context
          .read<ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit>()
          .state
          .chosenTrainingOfferResponseDynamicWithDistanceList
          .last
          .traineeDynamic
          .uId;
}
