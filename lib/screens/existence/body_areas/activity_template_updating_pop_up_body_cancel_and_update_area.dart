import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/widgets/widget.dart';

class ActivityTemplateUpdatingPopUpBodyCancelAndUpdateArea
    extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppTextConstants _appTextConstants = AppTextConstants();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppFeedbacks _appFeedbacks = AppFeedbacks();
  final AppTimeConstants _appTimeConstants = AppTimeConstants();

  final ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc;
  final TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc
      textFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc;
  final double screenWidth;

  ActivityTemplateUpdatingPopUpBodyCancelAndUpdateArea({
    required this.activityTemplateDynamicByUserBloc,
    required this.textFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc,
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? headlineSmall = context.textTheme.headlineSmall!;
    Color backgroundColor = Theme.of(context).colorScheme.background;

    return _createButtonArea(context, headlineSmall, backgroundColor);
  }

  // CREATE ============================================================================================================
  CustomColumn _createButtonArea(
      BuildContext context, TextStyle headlineSmall, Color backgroundColor) {
    return CustomColumn(
      children: [
        _createBottomRowForButtons(context, activityTemplateDynamicByUserBloc,
            headlineSmall, backgroundColor),
        const CustomAppSizedBox(),
      ],
    );
  }

  CustomRow _createBottomRowForButtons(
    BuildContext context,
    ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc,
    TextStyle headlineSmall,
    Color backgroundColor,
  ) =>
      CustomRow(
        mainAxisSize: MainAxisSize.max,
        children: [
          _displayCancelButton(context, headlineSmall, backgroundColor),
          _displayUpdateButton(context, activityTemplateDynamicByUserBloc,
              headlineSmall, backgroundColor),
        ],
      );

  // CANCEL BUTTON =====================================================================================================
  // DISPLAY ===========================================================================================================
  CustomElevatedButton _displayCancelButton(
    BuildContext context,
    TextStyle headlineSmall,
    Color backgroundColor,
  ) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.cancel,
          textStyle: headlineSmall.copyWith(color: backgroundColor),
          elevatedButtonWidth: screenWidth * 0.90 * 0.34,
          buttonColor: _appColors.buttonDarkColor,
          onPressed: () {
            _clickCancelButton(context);
          });

  // METHODS ===========================================================================================================
  // Cancel Button -----------------------------------------------------------------------------------------------------
  void _clickCancelButton(BuildContext context) {
    if (_checkTemplateNameFilledUp(context)) {
      _cleanTemplateName(context);
    }
    if (_checkActivityTypeIsChosen(context)) {
      _cleanActivityTypeButton(context);
    }
    if (_checkActivityNameIsChosen(context)) {
      _cleanActivityNameButton(context);
    }
    if (_checkTimePeriodIsChosen(context)) {
      _cleanTimePeriodButton(context);
    }
    _closePopUp(context);
  }

  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkTemplateNameFilledUp(
    BuildContext context,
  ) =>
      context
          .read<TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc>()
          .state
          .templateName !=
      '';

  bool _checkActivityTypeIsChosen(BuildContext context) => context
      .read<ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpBloc>()
      .state
      .chosenActivityTypeDynamicList
      .isNotEmpty;

  bool _checkActivityNameIsChosen(BuildContext context) => context
      .read<
          ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpCubit>()
      .state
      .chosenActivityTitleList
      .isNotEmpty;

  bool _checkTimePeriodIsChosen(BuildContext context) => context
      .read<TimePeriodDynamicButtonOnActivityTemplateUpdatingPopUpCubit>()
      .state
      .chosenTimePeriodNameList
      .isNotEmpty;

  // Clean method ------------------------------------------------------------------------------------------------------
  void _cleanTemplateName(BuildContext context) {
    context
        .read<TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc>()
        .add(
            (TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpClear()));
    textFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc.add(
        TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpClear());
  }

  void _cleanActivityTypeButton(BuildContext context) {
    context
        .read<ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpBloc>()
        .add(CleanActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUp());
  }

  void _cleanActivityNameButton(BuildContext context) {
    context
        .read<
            ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpCubit>()
        .cleanActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUp();
  }

  void _cleanTimePeriodButton(BuildContext context) {
    context
        .read<TimePeriodDynamicButtonOnActivityTemplateUpdatingPopUpCubit>()
        .cleanTimePeriodDynamicButtonOnActivityTemplateUpdatingPopUp();
  }

  // UPDATE BUTTON =====================================================================================================
  // DISPLAY ===========================================================================================================
  CustomElevatedButton _displayUpdateButton(
    BuildContext context,
    ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc,
    TextStyle headlineSmall,
    Color backgroundColor,
  ) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.update,
          textStyle: headlineSmall.copyWith(color: backgroundColor),
          elevatedButtonWidth: screenWidth * 0.90 * 0.34,
          buttonColor: _appColors.secondary,
          onPressed: () {
            _clickUpdateButton(context);
          });

  // METHODS ===========================================================================================================
  void _clickUpdateButton(BuildContext context) {
    if (_checkTemplateNameNotFilledUp(context)) {
      _displayDialogAboutDeficientTemplateName(context);
    } else if (_checkActivityTypeIsNotChosen(context)) {
      _displayDialogAboutDeficientActivityType(context);
    } else if (_checkActivityNameIsNotChosen(context)) {
      _displayDialogAboutActivityName(context);
    } else {
      if (_checkActivityTypeIsChosen(context)) {
        if (_checkWhetherChosenActivityNameBelongsToActivityType(context)) {
          if (_checkWhetherChosenActivityExistsInTemplate(context)) {
            _displayExistenceAlertDialog(context);
          } else {
            _initiateUpdatingProcess(
                context, activityTemplateDynamicByUserBloc);
          }
        } else {
          _wrongChoice(context);
          _displayDialogAboutActivityName(context);
        }
      }
    }
  }

  void _wrongChoice(BuildContext context) {
    if (kDebugMode) {
      print(
          '''ActivityNameDynamicByActivityTypeDynamicList: ${context.read<ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpBloc>().state.activityNameDynamicList.map((e) => e.activityTitle).toList()} and chosenActivityTitleList is: ${context.read<ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpCubit>().state.chosenActivityTitleList[0]} ARE NOT EQUAL''');
    }
  }

  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkTemplateNameNotFilledUp(BuildContext context) =>
      context
          .read<TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc>()
          .state
          .templateName ==
      '';

  bool _checkActivityTypeIsNotChosen(BuildContext context) => context
      .read<ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpBloc>()
      .state
      .chosenActivityTypeDynamicList
      .isEmpty;

  bool _checkActivityNameIsNotChosen(BuildContext context) => context
      .read<
          ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpCubit>()
      .state
      .chosenActivityTitleList
      .isEmpty;

  bool _checkWhetherChosenActivityNameBelongsToActivityType(
    BuildContext context,
  ) =>
      context
          .read<
              ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpBloc>()
          .state
          .activityNameDynamicList
          .map((e) => e.activityTitle)
          .toList()
          .contains(context
              .read<
                  ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpCubit>()
              .state
              .chosenActivityTitleList[0]);

  bool _checkWhetherChosenActivityExistsInTemplate(BuildContext context) =>
      context
          .read<ActivityTemplateDynamicByUserBloc>()
          .state
          .activityTemplateDynamicList
          .where((element) =>
              element.activityNameDynamic.activityTitle ==
              _chosenActivityTitle(context))
          .toList()
          .isNotEmpty;

  // Dialog Methods ----------------------------------------------------------------------------------------------------
  Future<dynamic> _displayDialogAboutDeficientTemplateName(
          BuildContext context) =>
      _createShowDialogAboutSelection(
          context, _appFeedbacks.feedbackAboutEmptyTemplateName);

  Future<dynamic> _displayDialogAboutDeficientActivityType(
          BuildContext context) =>
      _createShowDialogAboutSelection(
          context, _appFeedbacks.feedbackAboutMissingOneActivityTypeChoice);

  Future<dynamic> _displayDialogAboutActivityName(BuildContext context) =>
      _createShowDialogAboutSelection(
          context, _appFeedbacks.feedbackAboutMissingOneActivityNameChoice);

  // DISPLAY ===========================================================================================================
  void _displayExistenceAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const InformationOfExistenceAlertDialog(detail: 'activity');
        });
  }

  // UPDATING METHODS ==================================================================================================
  void _initiateUpdatingProcess(
    BuildContext context,
    ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc,
  ) {
    _bringChosenActivityDetailFromDB(context);
    _displayTemplateUpdatingDialog(context, activityTemplateDynamicByUserBloc);
  }

  // DISPLAY ===========================================================================================================
  Future<dynamic> _displayTemplateUpdatingDialog(
          BuildContext context,
          ActivityTemplateDynamicByUserBloc
              activityTemplateDynamicByUserBloc) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return _listenActivityDetailBroughtFromDB(
                activityTemplateDynamicByUserBloc);
          });

  // LISTEN ============================================================================================================
  BlocListener<ActivityNameDynamicByChosenAttributesBloc,
          ActivityNameDynamicByChosenAttributesState>
      _listenActivityDetailBroughtFromDB(
          ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc) {
    return BlocListener<ActivityNameDynamicByChosenAttributesBloc,
        ActivityNameDynamicByChosenAttributesState>(
      listenWhen: (previous, current) =>
          _checkWhetherTemplateUpdatingSuccessfully(current),
      listener: (context, state) {
        _updateTemplateIntoDBCleanAllFieldAndCloseAddingPopUp(
            context, activityTemplateDynamicByUserBloc);
      },
      child: _buildChosenActivityDetailBroughtFromDB(),
    );
  }

  // METHODS ===========================================================================================================
  void _updateTemplateIntoDBCleanAllFieldAndCloseAddingPopUp(
    BuildContext context,
    ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc,
  ) {
    ActivityTemplate activityTemplate =
        _createActivityTemplateInstance(context);
    _updateNewActivityTemplateIntoDB(context, activityTemplate);
    _changeActivityTemplateDynamicByUserState(
        activityTemplateDynamicByUserBloc);
    _bringActivityTemplateDynamicByUserFromDB(
        activityTemplateDynamicByUserBloc);
    _cleanAllButton(context);
  }

  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherTemplateUpdatingSuccessfully(
          ActivityNameDynamicByChosenAttributesState current) =>
      current.status == Status.success;

  // Clean Methods -----------------------------------------------------------------------------------------------------
  void _cleanAllButton(BuildContext context) {
    _cleanActivityTypeButton(context);
    _cleanActivityNameButton(context);
    _cleanTimePeriodButton(context);
  }

  // BUILD =============================================================================================================
  BlocBuilder<ActivityNameDynamicByChosenAttributesBloc,
          ActivityNameDynamicByChosenAttributesState>
      _buildChosenActivityDetailBroughtFromDB() {
    return BlocBuilder<ActivityNameDynamicByChosenAttributesBloc,
        ActivityNameDynamicByChosenAttributesState>(
      builder: (context, state) {
        switch (state.status) {
          case Status.initial:
            return DBProcessLoader();
          case Status.loading:
            return DBProcessLoader();
          case Status.success:
            Future.delayed(_appTimeConstants.timeOutDuration, () {
              _closeUpdatingPopUp(context);
            });
            return const LoadSuccessfullyAlertDialog(
                content: 'The chosen template has been updated');
          case Status.failure:
            return StateError(error: state.error);
        }
      },
    );
  }

  // Find Mehtods ------------------------------------------------------------------------------------------------------
  int _findActivityTemplateId(BuildContext context) => context
      .read<
          ChosenActivityTemplateAmongActivityTemplateDynamicOfUserOnUpdatingPopUpCubit>()
      .state
      .chosenActivityTemplateList
      .last
      .activityTemplateId!;

  int get _findUserId => _appNumberConstants.appUserId;

  int _findActivityNameId(BuildContext context) => context
      .read<ActivityNameDynamicByChosenAttributesBloc>()
      .state
      .activityNameDynamicList
      .last
      .activityNameId!;

  String _findTemplateName(BuildContext context) => context
      .read<TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc>()
      .state
      .templateName!;

  // Get Methods -------------------------------------------------------------------------------------------------------
  int getActivityNameId(BuildContext context) => context
      .read<ActivityNameDynamicBloc>()
      .state
      .activityNameDynamicList
      .where(
          (element) => element.activityTitle == _chosenActivityTitle(context))
      .first
      .activityNameId!;

  // Chosen Methods ----------------------------------------------------------------------------------------------------
  String _chosenActivityTitle(BuildContext context) => context
      .read<
          ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpCubit>()
      .state
      .chosenActivityTitleList
      .last;

  // SHOW DIALOGS ======================================================================================================
  // This function is showing Dialog about missing selection. [alertLabel] is information about the subject of the
  // alert. [_createShowDialogAboutSelection] funcition returns [SelectionAlertDialog] widget which is local
  // widget. In case the widget needs somewhere in app, it will be moved to general widget file.
  Future<dynamic> _createShowDialogAboutSelection(
    BuildContext context,
    String alertLabel,
  ) =>
      showDialog(
          context: context,
          builder: (_) => SelectionAlertDialog(alertLabel: alertLabel));

  // State Changing Methods --------------------------------------------------------------------------------------------
  void _changeActivityTemplateDynamicByUserState(
      ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc) {
    activityTemplateDynamicByUserBloc
        .add(RecallActivityTemplateDynamicByUserEvent());
  }

  // Database Methods --------------------------------------------------------------------------------------------------
  void _bringChosenActivityDetailFromDB(BuildContext context) {
    context.read<ActivityNameDynamicByChosenAttributesBloc>().add(
        LoadActivityNameDynamicByChosenAttributesEvent(
            activityNameId: getActivityNameId(context)));
  }

  void _updateNewActivityTemplateIntoDB(
      BuildContext context, ActivityTemplate activityTemplate) {
    context
        .read<ActivityTemplateBloc>()
        .add(UpdateActivityTemplateEvent(activityTemplate: activityTemplate));
  }

  void _bringActivityTemplateDynamicByUserFromDB(
      ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc) {
    activityTemplateDynamicByUserBloc
        .add(LoadActivityTemplateDynamicByUserEvent(uId: _findUserId));
  }

  // Create Model Instance ---------------------------------------------------------------------------------------------
  ActivityTemplate _createActivityTemplateInstance(BuildContext context) {
    final ActivityTemplate activityTemplate = ActivityTemplate(
      activityTemplateId: _findActivityTemplateId(context),
      userId: _findUserId,
      activityNameId: _findActivityNameId(context),
      templateName: _findTemplateName(context),
      updatedAt: DateTime.now(),
    );
    return activityTemplate;
  }

  // Screen Method -----------------------------------------------------------------------------------------------------
  void _closeUpdatingPopUp(BuildContext context) {
    int pageCount = 0;
    Navigator.of(context).popUntil((_) => pageCount++ >= 2);
  }

  void _closePopUp(BuildContext context) => Navigator.of(context).pop();
}
