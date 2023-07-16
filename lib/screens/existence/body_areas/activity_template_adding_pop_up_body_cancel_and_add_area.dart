import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/widgets/widget.dart';

class ActivityTemplateAddingPopUpBodyCancelAndAddArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppTextConstants _appTextConstants = AppTextConstants();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppFeedbacks _appFeedbacks = AppFeedbacks();
  final AppTimeConstants _appTimeConstants = AppTimeConstants();

  final ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc;
  final TextFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpBloc
      textFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpBloc;
  final double screenWidth;

  ActivityTemplateAddingPopUpBodyCancelAndAddArea({
    required this.activityTemplateDynamicByUserBloc,
    required this.textFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpBloc,
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? headlineSmall = context.textTheme.headlineSmall!;
    Color backgroundColor = Theme.of(context).colorScheme.background;

    return _createBottomButtonsArea(context, headlineSmall, backgroundColor);
  }

  // CREATE ============================================================================================================
  CustomColumn _createBottomButtonsArea(
    BuildContext context,
    TextStyle headlineSmall,
    Color backgroundColor,
  ) =>
      CustomColumn(
        children: [
          _createBottomRowForButtons(context, activityTemplateDynamicByUserBloc,
              headlineSmall, backgroundColor),
          const CustomAppSizedBox(),
        ],
      );

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
          _displayAddButton(context, activityTemplateDynamicByUserBloc,
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
  void _clickCancelButton(BuildContext context) {
    if (_checkTemplateNameFilledUp(context)) {
      _cleanTemplateName(context,
          textFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpBloc);
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
          .read<TextOfActivityTemplateNameOnActivityTemplateAddingPopUpBloc>()
          .state
          .templateName !=
      '';

  bool _checkActivityTypeIsChosen(BuildContext context) => context
      .read<ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpBloc>()
      .state
      .chosenActivityTypeDynamicList
      .isNotEmpty;

  bool _checkActivityNameIsChosen(BuildContext context) => context
      .read<
          ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpCubit>()
      .state
      .chosenActivityTitleList
      .isNotEmpty;

  bool _checkTimePeriodIsChosen(BuildContext context) => context
      .read<TimePeriodDynamicButtonOnActivityTemplateAddingPopUpCubit>()
      .state
      .chosenTimePeriodNameList
      .isNotEmpty;

  // Clear method ------------------------------------------------------------------------------------------------------
  void _cleanTemplateName(
      BuildContext context,
      TextFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpBloc
          textFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpBloc) {
    context
        .read<TextOfActivityTemplateNameOnActivityTemplateAddingPopUpBloc>()
        .add((TextOfActivityTemplateNameOnActivityTemplateAddingPopUpClear()));
    textFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpBloc.add(
        TextFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpClear());
  }

  void _cleanActivityTypeButton(BuildContext context) {
    context
        .read<ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpBloc>()
        .add(CleanActivityTypeDynamicButtonOnActivityTemplateAddingPopUp());
  }

  void _cleanActivityNameButton(BuildContext context) {
    context
        .read<
            ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpCubit>()
        .cleanActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUp();
  }

  void _cleanTimePeriodButton(BuildContext context) {
    context
        .read<TimePeriodDynamicButtonOnActivityTemplateAddingPopUpCubit>()
        .cleanTimePeriodDynamicButtonOnActivityTemplateAddingPopUp();
  }

  // ADD BUTTON ========================================================================================================
  // DISPLAY ===========================================================================================================
  CustomElevatedButton _displayAddButton(
    BuildContext context,
    ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc,
    TextStyle headlineSmall,
    Color backgroundColor,
  ) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.add,
          textStyle: headlineSmall.copyWith(color: backgroundColor),
          elevatedButtonWidth: screenWidth * 0.90 * 0.34,
          buttonColor: _appColors.secondary,
          onPressed: () {
            _clickAddButton(context, activityTemplateDynamicByUserBloc);
          });

  // METHODS ===========================================================================================================
  void _clickAddButton(
    BuildContext context,
    ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc,
  ) {
    if (_checkTemplateNameNotFilledUp(context)) {
      _displayDialogAboutDeficientTemplateName(context);
    } else if (_checkActivityTypeIsNotChosen(context)) {
      _displayDialogAboutDeficientActivityType(context);
    } else if (_checkActivityNameIsNotChosen(context)) {
      _displayDialogAboutActivityName(context);
    } else {
      if (_checkActivityNameIsChosen(context)) {
        if (_checkWhetherChosenActivityNameBelongsToActivityType(context)) {
          if (_checkWhetherChosenActivityExistsInTemplate(context)) {
            _displayExistenceAlertDialog(context);
          } else {
            _initiateAddingProcess(context, activityTemplateDynamicByUserBloc);
          }
        } else {
          //
          _wrongChoice(context);
          _displayDialogAboutActivityName(context);
        }
      }
    }
  }

  void _wrongChoice(BuildContext context) {
    if (kDebugMode) {
      print(
          '''ActivityNameDynamicByActivityTypeDynamicList: ${context.read<ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpBloc>().state.activityNameDynamicList.map((e) => e.activityTitle).toList()} and chosenActivityTitleList is: ${context.read<ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpCubit>().state.chosenActivityTitleList[0]} ARE NOT EQUAL''');
    }
  }

  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkTemplateNameNotFilledUp(BuildContext context) =>
      context
          .read<TextOfActivityTemplateNameOnActivityTemplateAddingPopUpBloc>()
          .state
          .templateName ==
      '';

  bool _checkActivityTypeIsNotChosen(BuildContext context) => context
      .read<ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpBloc>()
      .state
      .chosenActivityTypeDynamicList
      .isEmpty;

  bool _checkActivityNameIsNotChosen(BuildContext context) => context
      .read<
          ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpCubit>()
      .state
      .chosenActivityTitleList
      .isEmpty;

  bool _checkWhetherChosenActivityNameBelongsToActivityType(
          BuildContext context) =>
      context
          .read<
              ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpBloc>()
          .state
          .activityNameDynamicList
          .map((e) => e.activityTitle)
          .toList()
          .contains(context
              .read<
                  ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpCubit>()
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
        barrierDismissible: false,
        context: context,
        builder: (context) =>
            const InformationOfExistenceAlertDialog(detail: 'activity'));
  }

  // ADDING METHODS ====================================================================================================
  dynamic _initiateAddingProcess(
    BuildContext context,
    ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc,
  ) async {
    _bringChosenActivityDetailFromDB(context);
    _displayTemplateAddingDialog(context, activityTemplateDynamicByUserBloc);
  }

  // DISPLAY ===========================================================================================================
  Future<dynamic> _displayTemplateAddingDialog(
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
          _checkWhetherDetailsBroughtSuccessfully(current),
      listener: (context, state) {
        _addTemplateIntoDBCleanAllFieldAndCloseAddingPopUp(
            context, activityTemplateDynamicByUserBloc);
      },
      child: _buildChosenActivityDetailBroughtFromDB(),
    );
  }

  // METHODS ===========================================================================================================
  void _addTemplateIntoDBCleanAllFieldAndCloseAddingPopUp(
    BuildContext context,
    ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc,
  ) {
    ActivityTemplate activityTemplate =
        _createActivityTemplateInstance(context);
    _addNewActivityTemplateIntoDB(context, activityTemplate);
    _changeActivityTemplateDynamicByUserState(
        activityTemplateDynamicByUserBloc);
    _bringActivityTemplateDynamicByUserFromDB(
        activityTemplateDynamicByUserBloc);
    _cleanAllButton(context);
  }

  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherDetailsBroughtSuccessfully(
          ActivityNameDynamicByChosenAttributesState current) =>
      current.status == Status.success;

  // Clean Methods -----------------------------------------------------------------------------------------------------
  void _cleanAllButton(BuildContext context) {
    _cleanTemplateName(context,
        textFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpBloc);
    _cleanActivityTypeButton(context);
    _cleanActivityNameButton(context);
    _cleanTimePeriodButton(context);
  }

  // BUILD =============================================================================================================
  BlocBuilder<ActivityNameDynamicByChosenAttributesBloc,
          ActivityNameDynamicByChosenAttributesState>
      _buildChosenActivityDetailBroughtFromDB() => BlocBuilder<
              ActivityNameDynamicByChosenAttributesBloc,
              ActivityNameDynamicByChosenAttributesState>(
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return DBProcessLoader();
                case Status.loading:
                  return DBProcessLoader();
                case Status.success:
                  Future.delayed(_appTimeConstants.timeOutDuration, () {
                    _closeAddingPopUp(context);
                  });
                  return const LoadSuccessfullyAlertDialog();
                case Status.failure:
                  return StateError(error: state.error);
              }
            },
          );

  // Find Mehtods ------------------------------------------------------------------------------------------------------
  int _findActivityNameId(BuildContext context) => context
      .read<ActivityNameDynamicByChosenAttributesBloc>()
      .state
      .activityNameDynamicList
      .last
      .activityNameId!;

  String _findTemplateName(BuildContext context) => context
      .read<TextOfActivityTemplateNameOnActivityTemplateAddingPopUpBloc>()
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
          ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpCubit>()
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

  void _addNewActivityTemplateIntoDB(
      BuildContext context, ActivityTemplate activityTemplate) {
    context
        .read<ActivityTemplateBloc>()
        .add(AddActivityTemplateEvent(activityTemplate: activityTemplate));
  }

  void _bringActivityTemplateDynamicByUserFromDB(
      ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc) {
    activityTemplateDynamicByUserBloc.add(
        LoadActivityTemplateDynamicByUserEvent(
            uId: _appNumberConstants.appUserId));
  }

  // Create Model Instance ---------------------------------------------------------------------------------------------
  ActivityTemplate _createActivityTemplateInstance(BuildContext context) {
    final ActivityTemplate activityTemplate = ActivityTemplate(
        userId: _appNumberConstants.appUserId,
        activityNameId: _findActivityNameId(context),
        templateName: _findTemplateName(context));
    return activityTemplate;
  }

  // Screen Method -----------------------------------------------------------------------------------------------------
  void _closePopUp(BuildContext context) => Navigator.of(context).pop();

  void _closeAddingPopUp(BuildContext context) {
    int pageCount = 0;
    Navigator.of(context).popUntil((_) => pageCount++ >= 2);
  }
}
