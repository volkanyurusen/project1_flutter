import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

class LocationTemplateAddingPopUpBodyTemplateNameArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppTextConstants _appTextConstants = AppTextConstants();

  final TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpBloc
      textFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpBloc;
  final double screenWidth;
  final TextStyle textfieldTextStyle;
  final TextStyle buttonTextStyle;
  final Color textColor;

  LocationTemplateAddingPopUpBodyTemplateNameArea({
    required this.textFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpBloc,
    required this.screenWidth,
    required this.textfieldTextStyle,
    required this.buttonTextStyle,
    required this.textColor,
    Key? key,
  }) : super(key: key);

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

  /// TITLES ==========================================================================================================
  CustomTitle _createTemplateNameTitle() =>
      const CustomTitle(spaceFromUpperWidget: 32, textLabel: 'Template Name');

  /// CREATE ===========================================================================================================
  GestureDetector _createShowDialogButton(
    BuildContext context,
    bool checkPreviousState,
  ) =>
      GestureDetector(
        child: _createTemplateNameArea(),
        onTap: () {
          _openTemplateNameTextfieldDialog(context, checkPreviousState);
        },
      );

  /// TEMPLATE NAME TEXT AREA ==========================================================================================
  /// CREATE ===========================================================================================================
  AppHeader _createTemplateNameArea() => AppHeader(
        firstWidget: _buildTemplateNameTextArea(),
        thirdWidget: Icon(Icons.edit, color: textColor),
      );

  /// BUILD ============================================================================================================
  BlocBuilder<TextOfLocationTemplateNameOnLocationTemplateAddingPopUpBloc,
          TextOfLocationTemplateNameOnLocationTemplateAddingPopUpState>
      _buildTemplateNameTextArea() => BlocBuilder<
              TextOfLocationTemplateNameOnLocationTemplateAddingPopUpBloc,
              TextOfLocationTemplateNameOnLocationTemplateAddingPopUpState>(
            builder: (context, state) => _displayTemplateNameText(state),
          );

  /// DISPLAY ==========================================================================================================
  Expanded _displayTemplateNameText(
          TextOfLocationTemplateNameOnLocationTemplateAddingPopUpState state) =>
      Expanded(
        child: AppHeaderText(
            textLabel: _findOpeningText(state), textStyle: textfieldTextStyle),
      );

  /// METHODS ==========================================================================================================
  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findOpeningText(
          TextOfLocationTemplateNameOnLocationTemplateAddingPopUpState state) =>
      state.templateName ?? 'Template name';

  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================

  /// TEMPLATE NAME TEXTFIELD AREA =====================================================================================
  /// TEXTFIELD ========================================================================================================
  void _openTemplateNameTextfieldDialog(
    BuildContext context,
    bool checkPreviousState,
  ) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (diaglogContext) =>
          _createTextDialog(context, checkPreviousState),
    );
  }

  /// CREATE ===========================================================================================================
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

  /// BUILD ============================================================================================================
  BlocBuilder<TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpBloc,
          TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpState>
      _buildTemplateNameTextField(bool checkPreviousState) => BlocBuilder<
              TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpBloc,
              TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpState>(
            builder: (context, state) {
              _checkWhetherPreviousTemplateNameIsChosen(
                  context, checkPreviousState);
              checkPreviousState = true;
              return _displayTemplateNameTextField(context, state);
            },
          );

  /// DISPLAY ==========================================================================================================
  NameTextField _displayTemplateNameTextField(
    BuildContext context,
    TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpState state,
  ) =>
      NameTextField(
        limitOfTextLenght: 31,
        isTextValid: _checkTemplateNameIsValid(state),
        labelName: 'Template Name',
        errorMessage: _findCorrectErrorMessage(state),
        initialValue: _findText(state),
        onChanged: (value) {
          _findNewTemplateName(context, value);
        },
      );

  /// METHODS ==========================================================================================================
  void _getExistingTemplateName(BuildContext context) {
    context
        .read<
            TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpBloc>()
        .add(TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpSubmit(
            _findTemplateName(context)));
  }

  void _updateTemplateName(BuildContext context, String value) => context
      .read<TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpBloc>()
      .add(TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpSubmit(
          value));

  // Check Methods ----------------------------------------------------------------------------------------------------
  void _checkWhetherPreviousTemplateNameIsChosen(
      BuildContext context, bool checkPreviousState) {
    if (checkPreviousState == false) {
      _getExistingTemplateName(context);
    }
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findCorrectErrorMessage(
          TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpState
              state) =>
      state.formSubmissionOnLocationTemplateAddingState.errorMessage;

  void _findNewTemplateName(BuildContext context, String value) {
    if (value.isNotEmpty) {
      _updateTemplateName(context, value);
    }
  }

  /// BUTTONS ==========================================================================================================
  /// CREATE ===========================================================================================================
  CustomRow _createBottomButtonArea(
    BuildContext context,
    bool checkPreviousState,
  ) =>
      CustomRow(
        mainAxisSize: MainAxisSize.max,
        children: [
          _displayCancelButton(context, checkPreviousState),
          _buildAddingButton(context, checkPreviousState),
        ],
      );

  /// BUILD ============================================================================================================
  BlocBuilder<TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpBloc,
          TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpState>
      _buildAddingButton(
    BuildContext context,
    bool checkPreviousState,
  ) =>
          BlocBuilder<
              TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpBloc,
              TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpState>(
            builder: (context, state) {
              return _displayAddingButton(context, state, checkPreviousState);
            },
          );

  /// DISPLAY ==========================================================================================================
  CustomElevatedButton _displayCancelButton(
    BuildContext context,
    bool checkPreviousState,
  ) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.cancel,
          textStyle: buttonTextStyle,
          elevatedButtonWidth: _findButtonWidth,
          buttonColor: _appColors.buttonDarkColor,
          onPressed: () => _clickCancelButton(context, checkPreviousState));

  CustomElevatedButton _displayAddingButton(
    BuildContext context,
    TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpState state,
    bool checkPreviousState,
  ) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.save,
          textStyle: buttonTextStyle,
          elevatedButtonWidth: _findButtonWidth,
          buttonColor: _appColors.secondary,
          onPressed: _checkWhetherTemplateNameIsCorrect(state)
              ? () => _clickAddButton(context, state, checkPreviousState)
              : null);

  /// METHODS ==========================================================================================================
  void _clickCancelButton(
    BuildContext dialogContext,
    bool checkPreviousState,
  ) {
    _closePopUp(dialogContext);
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        textFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpBloc.add(
            TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpSubmit(
                _findPreviousTemplateName(dialogContext)));
        checkPreviousState = false;
      },
    );
  }

  void _clickAddButton(
    BuildContext dialogContext,
    TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpState state,
    bool checkPreviousState,
  ) {
    checkPreviousState = false;
    _closePopUp(dialogContext);
    dialogContext
        .read<TextOfLocationTemplateNameOnLocationTemplateAddingPopUpBloc>()
        .add(TextOfLocationTemplateNameOnLocationTemplateAddingPopUpSubmit(
            _findText(state)));
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherTemplateNameIsCorrect(
          TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpState
              state) =>
      _checkTemplateNameIsValid(state) ||
      _checkTemplateNameEnteredCorrectly(state);

  bool _checkTemplateNameEnteredCorrectly(
          TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpState
              state) =>
      state.formSubmissionOnLocationTemplateAddingState.submissionSuccess ==
      true;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findPreviousTemplateName(BuildContext dialogContext) => dialogContext
      .read<TextOfLocationTemplateNameOnLocationTemplateAddingPopUpBloc>()
      .state
      .templateName!;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findTemplateName(BuildContext context) => context
      .read<TextOfLocationTemplateNameOnLocationTemplateAddingPopUpBloc>()
      .state
      .templateName!;

  /// METHODS ==========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkTemplateNameIsValid(
          TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpState
              state) =>
      state.formSubmissionOnLocationTemplateAddingState.isValid != false;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findText(
          TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpState
              state) =>
      state.fieldText!;

  double get _findButtonWidth => screenWidth * 0.90 * 0.34;

  /// Screen Methods ---------------------------------------------------------------------------------------------------
  void _closePopUp(BuildContext dialogContext) {
    Navigator.of(dialogContext).pop();
  }
}
