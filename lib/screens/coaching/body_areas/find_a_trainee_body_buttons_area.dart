import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import '../zscreens.dart';

class FindATraineeBodyButtonsArea extends StatelessWidget {
  final AppTextConstants _appTextConstants = AppTextConstants();
  final AppFeedbacks _appFeedbacks = AppFeedbacks();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final double screenWidth;

  FindATraineeBodyButtonsArea({required this.screenWidth, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TrainingRequestDynamicWithDistanceByUserBloc
        trainingRequestDynamicWithDistanceByUserBloc =
        context.read<TrainingRequestDynamicWithDistanceByUserBloc>();
    final ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc
        activityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc =
        context.read<
            ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc>();
    final ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit
        activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit =
        context.read<
            ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit>();
    int appUserId = _appNumberConstants.appUserId;
    TextStyle? headlineSmall = context.textTheme.headlineSmall!;
    Color buttonColor = Theme.of(context).colorScheme.secondary;
    Color backgroundColor = Theme.of(context).colorScheme.background;

    return _createBottomButtonsArea(
        context,
        activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit,
        trainingRequestDynamicWithDistanceByUserBloc,
        activityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc,
        headlineSmall,
        buttonColor,
        backgroundColor,
        appUserId);
  }

  // CREATE ============================================================================================================
  CustomColumn _createBottomButtonsArea(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit
        activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit,
    TrainingRequestDynamicWithDistanceByUserBloc
        trainingRequestDynamicWithDistanceByUserBloc,
    ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc
        activityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc,
    TextStyle headlineSmall,
    Color buttonColor,
    Color backgroundColor,
    int appUserId,
  ) {
    return CustomColumn(
      children: [
        const CustomAppSizedBox(),
        _createBottomRowForButtons(
            context,
            activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit,
            trainingRequestDynamicWithDistanceByUserBloc,
            activityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc,
            headlineSmall,
            buttonColor,
            backgroundColor,
            appUserId),
        const CustomAppSizedBox(),
      ],
    );
  }

  MaxSizeCustomRow _createBottomRowForButtons(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit
        activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit,
    TrainingRequestDynamicWithDistanceByUserBloc
        trainingRequestDynamicWithDistanceByUserBloc,
    ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc
        activityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc,
    TextStyle headlineSmall,
    Color buttonColor,
    Color backgroundColor,
    int appUserId,
  ) =>
      MaxSizeCustomRow(
        children: [
          _createCleanAll(context, headlineSmall),
          _displayFindATraineeButton(
              context,
              activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit,
              trainingRequestDynamicWithDistanceByUserBloc,
              activityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc,
              buttonColor,
              backgroundColor,
              appUserId),
        ],
      );

  /// CREATE ===========================================================================================================
  GestureDetector _createCleanAll(BuildContext context, textStyleOfTitle) =>
      GestureDetector(
          child: _displayCleanAllDetails(textStyleOfTitle),
          onTap: () {
            _cleanAllButton(context);
          });

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayCleanAllDetails(textStyleOfTitle) =>
      AppHeaderText(textLabel: 'Clean All', textStyle: textStyleOfTitle);

  /// METHOD ===========================================================================================================
  void _cleanAllButton(BuildContext context) =>
      BlocProvider.of<CleanAllButtonOnFindATraineeScreenCubit>(context,
              listen: false)
          .pressCleanAllButtonOnFindATraineeScreen();

  /// FIND A TRAINEE BUTTON ============================================================================================
  /// DISPLAY ==========================================================================================================
  /// This function cheNotcks  a minimum of one option is chosen in all areas. If one of the options isn't chosen
  /// in an area, it warns the user by showing [_createShowDialogAboutSelection], and informing her/him that he/she has
  /// to choose at least one option in that area. If at least one option in each area has been chosen, the next page
  /// according to the user's choices by using [BLOCBUALANDAYARATILACAK] is prepared.
  ChoiceContainer _displayFindATraineeButton(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit
        activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit,
    TrainingRequestDynamicWithDistanceByUserBloc
        trainingRequestDynamicWithDistanceByUserBloc,
    ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc
        activityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc,
    Color buttonColor,
    Color backgroundColor,
    int appUserId,
  ) =>
      ChoiceContainer(
          containerText: _appTextConstants.findATrainee,
          buttonColor: buttonColor,
          buttonBorderColor: buttonColor,
          labelColor: backgroundColor,
          onTap: () => _pressFindATraineeButton(
              context,
              activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit,
              trainingRequestDynamicWithDistanceByUserBloc,
              activityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc,
              appUserId));

  /// METHOD ===========================================================================================================
  void _pressFindATraineeButton(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit
        activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit,
    TrainingRequestDynamicWithDistanceByUserBloc
        trainingRequestDynamicWithDistanceByUserBloc,
    ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc
        activityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc,
    int appUserId,
  ) {
    if (_checkActivityTypeIsNotChosen(context)) {
      _displayDialogAboutDeficientActivityType(context);
    } else if (_checkActivityNameIsNotChosen(context)) {
      _displayDialogAboutActivityName(context);
    } else {
      if (checkActivityNameIsChosen(context,
          activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit)) {
        if (checkChosenActivityNameBelongsToChosenActivityType(
            context,
            activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit,
            activityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc)) {
          _checkAnyLocationHasBeenChosenThenInitiateBringingRequestProcess(
              context,
              trainingRequestDynamicWithDistanceByUserBloc,
              appUserId,
              activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit);
        } else {
          _displayDialogAboutActivityName(context);
        }
      }
    }
  }

  // LOCATION UPDATING =================================================================================================
  // METHODS ===========================================================================================================
  void _checkAnyLocationHasBeenChosenThenInitiateBringingRequestProcess(
      BuildContext context,
      TrainingRequestDynamicWithDistanceByUserBloc
          trainingRequestDynamicWithDistanceByUserBloc,
      int appUserId,
      ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit
          activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit) {
    _checkWhetherLocationIsNotChosen(context)
        ? _createLocationUpdatingDialog(context)
        : _initiateBringingRequestProcess(
            trainingRequestDynamicWithDistanceByUserBloc,
            appUserId,
            activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit,
            context);
  }

  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherLocationIsNotChosen(BuildContext context) => context
      .read<ChosenLocationDetailDynamicButtonOnCreateActivityScreenCubit>()
      .state
      .chosenLocationDetailDynamicList
      .isEmpty;

  // LOCATION UPDATING DIALOG ==========================================================================================
  // CREATE ============================================================================================================
  Future<dynamic> _createLocationUpdatingDialog(BuildContext context) =>
      showDialog(
          context: context,
          builder: (context) {
            return _displayLocationUpdatingPopUp();
          });

  // DISPLAY ===========================================================================================================
  LocationUpdating _displayLocationUpdatingPopUp() => const LocationUpdating();

  /// METHODS ==========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkActivityTypeIsNotChosen(BuildContext context) => context
      .read<ActivityTypeDynamicButtonOnFindATraineeScreenBloc>()
      .state
      .chosenActivityTypeDynamicList
      .isEmpty;

  bool _checkActivityNameIsNotChosen(BuildContext context) => context
      .read<
          ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit>()
      .state
      .chosenActivityTitleList
      .isEmpty;

  bool checkActivityNameIsChosen(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit
        activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit,
  ) =>
      activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit
          .state.chosenActivityTitleList.isNotEmpty;

  bool checkChosenActivityNameBelongsToChosenActivityType(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit
        activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit,
    ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc
        activityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc,
  ) =>
      _getAListFromActivityTitlesByChosenActivityTypeName(
              activityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc)
          .contains(_findChosenActivityTitle(
              activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit));

  /// Get Methods ------------------------------------------------------------------------------------------------------
  List<String> _getAListFromActivityTitlesByChosenActivityTypeName(
          ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc
              activityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc) =>
      activityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc
          .state.activityNameDynamicList
          .map((e) => e.activityTitle)
          .toList();

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findChosenActivityTitle(
          ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit
              activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit) =>
      activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit
          .state.chosenActivityTitleList.last;

  /// Display Methods --------------------------------------------------------------------------------------------------
  void _displayDialogAboutDeficientActivityType(BuildContext context) =>
      _createShowDialogAboutSelection(
          context, _appFeedbacks.feedbackAboutMissingOneActivityTypeChoice);

  void _displayDialogAboutActivityName(BuildContext context) =>
      _createShowDialogAboutSelection(
          context, _appFeedbacks.feedbackAboutMissingOneActivityNameChoice);

  /// INITIATE PROCESS =================================================================================================
  /// METHODS ==========================================================================================================
  void _initiateBringingRequestProcess(
      TrainingRequestDynamicWithDistanceByUserBloc
          trainingRequestDynamicWithDistanceByUserBloc,
      int appUserId,
      ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit
          activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit,
      BuildContext context) {
    _cleanTrainingRequestList(trainingRequestDynamicWithDistanceByUserBloc);
    _bringTrainingRequestListOfChosenActivity(
        trainingRequestDynamicWithDistanceByUserBloc,
        appUserId,
        activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit);
    _bringTrainingRequestResponseByUserAndChosenActivity(context,
        activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit);
    goToResultFindATraineeScreen(context);
  }

  /// GENERAL METHODS ==================================================================================================
  /// This function is showing Dialog about missing selection. [alertLabel] is information about the subject of the
  /// alert. [_createShowDialogAboutSelection] funcition returns [SelectionAlertDialog] widget which is local
  /// widget. In case the widget needs somewhere in app, it will be moved to general widget file.
  Future<dynamic> _createShowDialogAboutSelection(
    BuildContext context,
    String alertLabel,
  ) =>
      showDialog(
          context: context,
          builder: (_) => SelectionAlertDialog(alertLabel: alertLabel));

  /// Database Methods -------------------------------------------------------------------------------------------------
  void _cleanTrainingRequestList(
      TrainingRequestDynamicWithDistanceByUserBloc
          trainingRequestDynamicWithDistanceByUserBloc) {
    trainingRequestDynamicWithDistanceByUserBloc
        .add(CleanTrainingRequestDynamicWithDistanceByUser());
  }

  void _bringTrainingRequestListOfChosenActivity(
      TrainingRequestDynamicWithDistanceByUserBloc
          trainingRequestDynamicWithDistanceByUserBloc,
      int appUserId,
      ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit
          activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit) {
    trainingRequestDynamicWithDistanceByUserBloc.add(
        LoadTrainingRequestDynamicWithDistanceByUserEvent(
            userId: appUserId,
            activityTitle: _findChosenActivityTitle(
                activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit)));
  }

  void _bringTrainingRequestResponseByUserAndChosenActivity(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit
        activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit,
  ) {
    context
        .read<
            TrainingRequestResponseDynamicWithDistanceByChosenAttributesBloc>()
        .add(LoadTrainingRequestResponseDynamicWithDistanceByChosenAttributesEvent(
            activityTitle: _findChosenActivityTitle(
                activityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit),
            coachUserId: _appNumberConstants.appUserId));
  }

  /// Go Other Page Methods --------------------------------------------------------------------------------------------
  void goToResultFindATraineeScreen(BuildContext context) =>
      Navigator.of(context).pushNamed(ScreenOfResultFindATrainee.routeName);
}
