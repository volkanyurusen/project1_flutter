import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/screens/profile/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class CoachingTypeDetailsTypeNamelAndChangeButtonArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final TextStyle? titleLarge;

  CoachingTypeDetailsTypeNamelAndChangeButtonArea({this.titleLarge, super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle? headline2Bold = Theme.of(context).textTheme.displayMedium!;

    return _buildCoachingTypeNameAndChangeButton(headline2Bold);
  }

  /// BUILD ============================================================================================================
  BlocBuilder<CoachDynamicBloc, CoachDynamicState>
      _buildCoachingTypeNameAndChangeButton(TextStyle headline2Bold) {
    return BlocBuilder<CoachDynamicBloc, CoachDynamicState>(
        builder: (context, coachState) {
      switch (coachState.status) {
        case Status.initial:
          return SkeltonContainer(height: 24, width: 200);
        case Status.loading:
          return SkeltonContainer(height: 24, width: 200);
        case Status.success:
          return createCoachingTypeNameAndChangeButton(
              context, coachState, headline2Bold);
        case Status.failure:
          return StateError(error: coachState.error);
      }
    });
  }

  /// CREATE ===========================================================================================================
  AppHeader createCoachingTypeNameAndChangeButton(
    BuildContext context,
    CoachDynamicState coachState,
    TextStyle headline2Bold,
  ) {
    return AppHeader(
      firstWidget: _displayCoachingTypeName(coachState, headline2Bold),
      thirdWidget: _displayChangeButton(context),
    );
  }

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayCoachingTypeName(
          CoachDynamicState coachState, TextStyle headline2Bold) =>
      AppHeaderText(
          textLabel: coachState
              .coachDynamicList.last.coachingTypeDynamic.coachingTypeName,
          textStyle: headline2Bold);

  ChoiceContainer _displayChangeButton(
    BuildContext context,
  ) {
    return ChoiceContainer(
      containerText: 'Change',
      buttonColor: _appColors.secondary,
      buttonBorderColor: _appColors.secondary,
      onTap: () {
        _createShowDialog(context);
      },
    );
  }

  /// SHOW DIALOG ======================================================================================================
  /// CREATE ===========================================================================================================
  Future<dynamic> _createShowDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => _createCancelContinueAlertDialog(context));

  AlertDialog _createCancelContinueAlertDialog(BuildContext context) =>
      AlertDialog(
        title: _displayAlertTitle(),
        content: _displayAlertContent(),
        actions: [
          _createCancelButton(context),
          _createContinueButton(context),
        ],
      );

  TextButton _createCancelButton(BuildContext context) => TextButton(
        child: _displayCancelButton(),
        onPressed: () {
          _closeTheScreen(context);
        },
      );

  TextButton _createContinueButton(BuildContext context) => TextButton(
        child: _displayContinueButton(),
        onPressed: () {
          _closeTheScreen(context);
          _goToScreenOfCoachinngTypes(context);
        },
      );

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayAlertTitle() =>
      AppHeaderText(textLabel: 'Change Coaching Type', textStyle: titleLarge);

  AppHeaderText _displayAlertContent() => AppHeaderText(
      textLabel:
          'You are about changing coaching type. Would you like to continue?',
      textStyle: titleLarge);

  AppHeaderText _displayCancelButton() =>
      AppHeaderText(textLabel: 'Cancel', textStyle: titleLarge);

  AppHeaderText _displayContinueButton() =>
      AppHeaderText(textLabel: 'Continue', textStyle: titleLarge);

  /// METHODS ==========================================================================================================
  /// Screen Method ----------------------------------------------------------------------------------------------------
  void _closeTheScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _goToScreenOfCoachinngTypes(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenOfCoachingTypes.routeName);
  }
}
