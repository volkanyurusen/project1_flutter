import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ActivityTemplateUpdatingPopUpBodyTemplateNameArea extends StatefulWidget {
  final CleanAllButtonOnActivityTemplateUpdatingPopUpCubit cleanActivityButton;
  final TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc
      textFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc;
  final double screenWidth;
  final TextStyle textfieldTextStyle;
  final TextStyle buttonTextStyle;
  final Color textColor;

  const ActivityTemplateUpdatingPopUpBodyTemplateNameArea({
    required this.cleanActivityButton,
    required this.textFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc,
    required this.screenWidth,
    required this.textfieldTextStyle,
    required this.buttonTextStyle,
    required this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  State<ActivityTemplateUpdatingPopUpBodyTemplateNameArea> createState() =>
      _ActivityTemplateUpdatingPopUpBodyTemplateNameAreaState();
}

class _ActivityTemplateUpdatingPopUpBodyTemplateNameAreaState
    extends State<ActivityTemplateUpdatingPopUpBodyTemplateNameArea> {
  final AppColors _appColors = AppColors();
  final AppTextConstants _appTextConstants = AppTextConstants();

  @override
  void initState() {
    super.initState();
    context
        .read<TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc>()
        .add(TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpSubmit(context
            .read<
                ChosenActivityTemplateAmongActivityTemplateDynamicOfUserOnUpdatingPopUpCubit>()
            .state
            .chosenActivityTemplateList
            .last
            .templateName));
  }

  @override
  Widget build(BuildContext context) {
    bool checkPreviousState = false;

    return CustomColumn(
      children: [
        _createTemplateNameTitle(),
        _createShowDialogButton(context, checkPreviousState),
      ],
    );
  }

  // TITLES ============================================================================================================
  CustomTitle _createTemplateNameTitle() =>
      const CustomTitle(spaceFromUpperWidget: 32, textLabel: 'Template Name');

  // CREATE ============================================================================================================
  GestureDetector _createShowDialogButton(
    BuildContext context,
    bool checkPreviousState,
  ) =>
      GestureDetector(
        child: _createTemplateNameArea(checkPreviousState),
        onTap: () {
          _openTemplateNameTextfieldDialog(context, checkPreviousState);
        },
      );

  // TEMPLATE NAME TEXT AREA ===========================================================================================
  // CREATE ============================================================================================================
  AppHeader _createTemplateNameArea(bool checkPreviousState) => AppHeader(
      firstWidget: _buildTemplateNameTextArea(),
      thirdWidget: Icon(Icons.edit, color: widget.textColor));

  // BUILD ============================================================================================================
  BlocBuilder<TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc,
          TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState>
      _buildTemplateNameTextArea() => BlocBuilder<
              TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc,
              TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState>(
            builder: (context, state) {
              _checkWhetherTemplateNameIsEmptyOnText(state, context);
              return _displayTemplateNameText(state);
            },
          );

  // DISPLAY ===========================================================================================================
  Expanded _displayTemplateNameText(
          TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState
              state) =>
      Expanded(
          child: AppHeaderText(
              textLabel: _findBirthyear(state),
              textStyle: widget.textfieldTextStyle));

  // METHODS ===========================================================================================================
  void _getInitialTemplateName(BuildContext context) {
    context
        .read<
            TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc>()
        .add(
            TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpSubmit(
                _findFirstTemplateName(context)));
  }

  // Check Methods -----------------------------------------------------------------------------------------------------
  void _checkWhetherTemplateNameIsEmptyOnText(
      TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState state,
      BuildContext context) {
    if (state.templateName == '') {
      _getInitialTemplateName(context);
    }
  }

  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findBirthyear(
          TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState
              state) =>
      state.templateName ?? '';

  // ===================================================================================================================
  // ===================================================================================================================
  // ===================================================================================================================
  // ===================================================================================================================
  // ===================================================================================================================
  // ===================================================================================================================
  // ===================================================================================================================

  // TEMPLATE NAME TEXTFIELD AREA ======================================================================================
  // TEXTFIELD =========================================================================================================
  void _openTemplateNameTextfieldDialog(
      BuildContext context, bool checkPreviousState) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (diaglogContext) =>
            _createTextDialog(context, checkPreviousState));
  }

  // CREATE ============================================================================================================
  ValidationDialog _createTextDialog(
    BuildContext context,
    bool checkPreviousState,
  ) =>
      ValidationDialog(
        child: CustomColumn(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTemplateNameTextField(checkPreviousState),
            _createBottomButtonArea(context, checkPreviousState),
          ],
        ),
      );

  // BUILD =============================================================================================================
  BlocBuilder<
          TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc,
          TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState>
      _buildTemplateNameTextField(
    bool checkPreviousState,
  ) =>
          BlocBuilder<
              TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc,
              TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState>(
            builder: (context, state) {
              _checkWhetherPreviousTemplateNameIsChosen(
                  checkPreviousState, context);
              checkPreviousState = true;
              return _displayTemplateNameTextField(context, state);
            },
          );

  // DISPLAY ===========================================================================================================
  NameTextField _displayTemplateNameTextField(
    BuildContext context,
    TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState state,
  ) =>
      NameTextField(
        limitOfTextLenght: 31,
        isTextValid: _checkTemplateNameIsValid(state),
        labelName: 'Template Name',
        errorMessage: _findCorrectErrorMessage(state),
        initialValue: _findInitialTemplateName(context, state),
        onChanged: (value) {
          _findNewTemplateName(context, value);
        },
      );

  // METHODS ===========================================================================================================
  void _getExistingTemplateName(BuildContext context) {
    context
        .read<
            TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc>()
        .add(
            TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpSubmit(
                _findTemplateName(context)));
  }

  void _updateTemplateName(BuildContext context, String value) => context
      .read<
          TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc>()
      .add(TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpSubmit(
          value));

  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findCorrectErrorMessage(
          TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState
              state) =>
      state.formSubmissionOnActivityTemplateUpdatingState.errorMessage;

  String _findInitialTemplateName(
    BuildContext context,
    TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState state,
  ) =>
      state.fieldText == ''
          ? _findFirstTemplateName(context)
          : _findText(state);

  void _findNewTemplateName(BuildContext context, String value) {
    if (value.isNotEmpty) {
      _updateTemplateName(context, value);
    }
  }

  String _findTemplateName(BuildContext context) => context
      .read<TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc>()
      .state
      .templateName!;

  // Check Methods -----------------------------------------------------------------------------------------------------
  void _checkWhetherPreviousTemplateNameIsChosen(
      bool checkPreviousState, BuildContext context) {
    if (checkPreviousState == false) {
      _getExistingTemplateName(context);
    }
  }

  // BUTTONS ===========================================================================================================
  // CREATE ============================================================================================================
  CustomRow _createBottomButtonArea(
    BuildContext context,
    bool checkPreviousState,
  ) =>
      CustomRow(
        mainAxisSize: MainAxisSize.max,
        children: [
          _displayCancelButton(context, checkPreviousState),
          _buildUpdatingButton(context, checkPreviousState),
        ],
      );

  // BUILD =============================================================================================================
  BlocBuilder<
          TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc,
          TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState>
      _buildUpdatingButton(
    BuildContext context,
    bool checkPreviousState,
  ) =>
          BlocBuilder<
              TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc,
              TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState>(
            builder: (context, state) {
              return _displayUpdatingButton(context, state, checkPreviousState);
            },
          );

  // DISPLAY ===========================================================================================================
  CustomElevatedButton _displayCancelButton(
    BuildContext context,
    bool checkPreviousState,
  ) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.cancel,
          textStyle: widget.buttonTextStyle,
          elevatedButtonWidth: _findButtonWidth,
          buttonColor: _appColors.buttonDarkColor,
          onPressed: () {
            _clickCancelButton(context, checkPreviousState);
          });

  CustomElevatedButton _displayUpdatingButton(
    BuildContext context,
    TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState state,
    bool checkPreviousState,
  ) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.update,
          textStyle: widget.buttonTextStyle,
          elevatedButtonWidth: _findButtonWidth,
          buttonColor: _appColors.secondary,
          onPressed: _checkWhetherTemplateNameIsCorrect(state)
              ? () {
                  _clickUpdateButton(context, state, checkPreviousState);
                }
              : null);

  // METHODS ===========================================================================================================
  void _clickCancelButton(
    BuildContext dialogContext,
    bool checkPreviousState,
  ) {
    _closePopUp(dialogContext);
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        widget
            .textFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc
            .add(
                TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpSubmit(
                    _findPreviousTemplateName(dialogContext)));
        checkPreviousState = false;
      },
    );
  }

  void _clickUpdateButton(
    BuildContext dialogContext,
    TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState state,
    bool checkPreviousState,
  ) {
    checkPreviousState = false;
    _closePopUp(dialogContext);
    dialogContext
        .read<TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc>()
        .add(TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpSubmit(
            _findText(state)));
  }

  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherTemplateNameIsCorrect(
          TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState
              state) =>
      _checkTemplateNameIsValid(state) ||
      _checkTemplateNameEnteredCorrectly(state);

  bool _checkTemplateNameEnteredCorrectly(
          TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState
              state) =>
      state.formSubmissionOnActivityTemplateUpdatingState.submissionSuccess ==
      true;

  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findPreviousTemplateName(BuildContext dialogContext) => dialogContext
      .read<TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc>()
      .state
      .templateName!;

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkTemplateNameIsValid(
          TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState
              state) =>
      state.formSubmissionOnActivityTemplateUpdatingState.isValid != false;

  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findText(
          TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState
              state) =>
      state.fieldText!;

  String _findFirstTemplateName(BuildContext context) => context
      .read<
          ChosenActivityTemplateAmongActivityTemplateDynamicOfUserOnUpdatingPopUpCubit>()
      .state
      .chosenActivityTemplateList
      .last
      .templateName;

  double get _findButtonWidth => widget.screenWidth * 0.90 * 0.34;

  // Screen Methods ----------------------------------------------------------------------------------------------------
  void _closePopUp(BuildContext dialogContext) {
    Navigator.of(dialogContext).pop();
  }
}
