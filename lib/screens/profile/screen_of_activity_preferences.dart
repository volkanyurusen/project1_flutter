import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/profile/pop_ups/zpop_ups.dart';
import 'package:my_project/widgets/widget.dart';

import 'bodies/zbodies.dart';
import 'local_widgets/zlocal_widget.dart';

class ScreenOfActivityPreferences extends StatelessWidget {
  static const String routeName = 'screen_of_activity_preferences';

  final AppColors _appColors = AppColors();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppTimeConstants _appTimeConstants = AppTimeConstants();

  ScreenOfActivityPreferences({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = context.width;
    final Color lightTextColor = _appColors.textColor.withOpacity(0.75);
    final TextStyle textButtonStyle =
        TextStyle(fontWeight: FontWeight.bold, color: _appColors.primary);
    const smallTextStyle =
        TextStyle(fontWeight: FontWeight.normal, fontSize: 14);

    return Scaffold(
        appBar: _createAppBar(
            context, smallTextStyle, textButtonStyle, lightTextColor),
        body: ActivityPreferencesBody(screenWidth: screenWidth));
  }

  /// APP BAR ==========================================================================================================
  /// CREATE ===========================================================================================================
  ProfilePageAppBar _createAppBar(
    BuildContext context,
    TextStyle smallTextStyle,
    TextStyle textButtonStyle,
    Color lightTextColor,
  ) =>
      ProfilePageAppBar(
        titleText: 'Activity Preferences',
        icon: _createEditButton(
            lightTextColor, context, smallTextStyle, textButtonStyle),
      );

  /// EDIT BUTTON ======================================================================================================
  /// CREATE ===========================================================================================================
  IconButton _createEditButton(
    Color lightTextColor,
    BuildContext context,
    TextStyle smallTextStyle,
    TextStyle textButtonStyle,
  ) =>
      IconButton(
          icon: Icon(Icons.edit, color: lightTextColor),
          splashRadius: 20,
          onPressed: () {
            _clickEditButton(context, smallTextStyle, textButtonStyle);
          });

  /// METHODS ==========================================================================================================
  void _clickEditButton(BuildContext context, TextStyle smallTextStyle,
      TextStyle textButtonStyle) {
    _checkWhetherHostPreferencesBroughtFromDB(context)
        ? _createDialogAboutHostPreferencesIsNotBroughtDB(
            context, smallTextStyle, textButtonStyle)
        : _createEditPopUpDialog(context);
  }

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherHostPreferencesBroughtFromDB(BuildContext context) =>
      context.read<CreatedActivityDynamicByHostBloc>().state.status ==
      StatusWithoutLoading.initial;

  // DIALOG ===========================================================================================================
  // CREATE ===========================================================================================================
  Future<dynamic> _createDialogAboutHostPreferencesIsNotBroughtDB(
    BuildContext context,
    TextStyle smallTextStyle,
    TextStyle textButtonStyle,
  ) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) =>
              _createAlerDialog(context, smallTextStyle, textButtonStyle));

  // ALERT DIALOG ======================================================================================================
  // CREATE ============================================================================================================
  AlertDialog _createAlerDialog(
    BuildContext context,
    TextStyle smallTextStyle,
    TextStyle textButtonStyle,
  ) =>
      AlertDialog(
        title: _createTitleText(context),
        content: _createContentText(context, smallTextStyle),
        actions: [
          _createOkButton(context, textButtonStyle),
        ],
      );

  // TITLE TEXT ========================================================================================================
  // CREATE ============================================================================================================
  AppHeaderText _createTitleText(
    BuildContext context,
  ) =>
      const AppHeaderText(textLabel: 'Information');

  // CONTENT TEXT ======================================================================================================
  // CREATE ============================================================================================================
  AppHeaderText _createContentText(
    BuildContext context,
    TextStyle smallTextStyle,
  ) =>
      AppHeaderText(
          textLabel:
              'The chosen activities you chose before have not been yet brought by database',
          textStyle: smallTextStyle);

  // OK BUTTON =========================================================================================================
  // CREATE ============================================================================================================
  TextButton _createOkButton(
    BuildContext context,
    TextStyle textButtonStyle,
  ) =>
      TextButton(
          child:
              AppHeaderText(textLabel: 'Refresh', textStyle: textButtonStyle),
          onPressed: () {
            _clickOkButton(context);
          });

  // METHODS ===========================================================================================================
  void _clickOkButton(BuildContext context) {
    _bringCreatedActivityDynamicByHost(context);
    _showDialog(context);
  }

  Future<dynamic> _showDialog(BuildContext context) => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return _buildActivityPreferencesByHostChoices();
      });

  // BUILD ===========================================================================================================
  BlocBuilder<CreatedActivityDynamicByHostBloc,
          CreatedActivityDynamicByHostState>
      _buildActivityPreferencesByHostChoices() => BlocBuilder<
              CreatedActivityDynamicByHostBloc,
              CreatedActivityDynamicByHostState>(
            builder: (context, hostState) {
              switch (hostState.status) {
                case StatusWithoutLoading.initial:
                  return const StateLoading();
                case StatusWithoutLoading.success:
                  return _initiateSuccessfulEndingProcess(context, hostState);
                case StatusWithoutLoading.failure:
                  return StateError(error: hostState.error);
              }
            },
          );

  // END METHODS =======================================================================================================
  LoadSuccessfullyAlertDialog _initiateSuccessfulEndingProcess(
    BuildContext context,
    CreatedActivityDynamicByHostState hostState,
  ) {
    _closeTheScreenWithDelaying(context);
    var loadSuccessfullyAlertDialog = LoadSuccessfullyAlertDialog(
        content: _checkWhetherAnyActivityHasBeenChosenBefore(hostState)
            ? "You haven't yet chosen any activity. Please choose at least one."
            : 'The process which you chose has been completed without any mistake');
    return loadSuccessfullyAlertDialog;
  }

  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherAnyActivityHasBeenChosenBefore(
    CreatedActivityDynamicByHostState hostState,
  ) =>
      hostState.createdActivityDynamicList.isEmpty;

  // METHODS ===========================================================================================================
  void _closeTheScreenWithDelaying(BuildContext context) {
    Future.delayed(_appTimeConstants.timeOutDuration, () {
      _closePopUp(context);
    });
  }

  /// EDIT POP UP DIALOG ===============================================================================================
  /// METHODS ==========================================================================================================
  Future<dynamic> _createEditPopUpDialog(BuildContext context) => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        _clearChosenActivityName(context);
        _cleanActivityNameButton(context);
        _assignActivityTitleListChosenByHostAsChosen(context);
        return ActivityPreferencesEditingPopUp();
      });

  // Clean Methods -----------------------------------------------------------------------------------------------------
  void _cleanActivityNameButton(BuildContext context) {
    return context
        .read<ActivityNameButtonCubit>()
        .cleanUserPreferredActivityTitle();
  }

  void _clearChosenActivityName(BuildContext context) {
    context
        .read<ChosenActivityNameInActivityPreferencesCubit>()
        .cleanUserPreferredActivityTitle();
  }

  // Assign Methods ----------------------------------------------------------------------------------------------------
  void _assignActivityTitleListChosenByHostAsChosen(BuildContext context) {
    context.read<ActivityNameButtonCubit>().addUserPreferredActivityTitle(
        _getActivityTitleListChosenByHost(context));
  }

  // Get Methods -------------------------------------------------------------------------------------------------------
  List<String> _getActivityTitleListChosenByHost(BuildContext context) =>
      context
          .read<CreatedActivityDynamicByHostBloc>()
          .state
          .createdActivityDynamicList
          .map((e) => e.activityNameDynamic.activityTitle)
          .toList();

  // Database Methods --------------------------------------------------------------------------------------------------
  void _bringCreatedActivityDynamicByHost(BuildContext context) {
    context.read<CreatedActivityDynamicByHostBloc>().add(
        LoadCreatedActivityDynamicByHostEvent(
            hostId: _appNumberConstants.appUserId));
  }

  // Screen Methods ----------------------------------------------------------------------------------------------------
  void _closePopUp(BuildContext context) {
    int pageCount = 0;
    Navigator.of(context).popUntil((_) => pageCount++ >= 2);
  }
}
