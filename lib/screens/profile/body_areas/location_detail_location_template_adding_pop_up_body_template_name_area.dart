import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/blocs/text_of_location_template_name_on_location_detail_location_template_adding_pop_up/text_of_location_template_name_on_location_detail_location_template_adding_pop_up_bloc.dart';
import 'package:my_project/widgets/widget.dart';

class LocationDetailLocationTemplateAddingPopUpBodyTemplateNameArea
    extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppTextConstants _appTextConstants = AppTextConstants();

  final TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc
      textFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc;
  final double screenWidth;
  final TextStyle textfieldTextStyle;
  final TextStyle buttonTextStyle;
  final Color textColor;

  LocationDetailLocationTemplateAddingPopUpBodyTemplateNameArea({
    required this.textFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc,
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
  BlocBuilder<
          TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc,
          TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState>
      _buildTemplateNameTextArea() => BlocBuilder<
              TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc,
              TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState>(
            builder: (context, state) => _displayTemplateNameText(state),
          );

  /// DISPLAY ==========================================================================================================
  Expanded _displayTemplateNameText(
          TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState
              state) =>
      Expanded(
        child: AppHeaderText(
            textLabel: _findOpeningText(state), textStyle: textfieldTextStyle),
      );

  /// METHODS ==========================================================================================================
  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findOpeningText(
          TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState
              state) =>
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
  BlocBuilder<
          TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc,
          TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState>
      _buildTemplateNameTextField(bool checkPreviousState) => BlocBuilder<
              TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc,
              TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState>(
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
    TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState
        state,
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
            TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc>()
        .add(
            TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpSubmit(
                _findTemplateName(context)));
  }

  void _updateTemplateName(BuildContext context, String value) => context
      .read<
          TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc>()
      .add(
          TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpSubmit(
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
          TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState
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
  BlocBuilder<
          TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc,
          TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState>
      _buildAddingButton(
    BuildContext context,
    bool checkPreviousState,
  ) =>
          BlocBuilder<
              TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc,
              TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState>(
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
    TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState
        state,
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
        textFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc
            .add(
                TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpSubmit(
                    _findPreviousTemplateName(dialogContext)));
        checkPreviousState = false;
      },
    );
  }

  void _clickAddButton(
    BuildContext dialogContext,
    TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState
        state,
    bool checkPreviousState,
  ) {
    checkPreviousState = false;
    _closePopUp(dialogContext);
    dialogContext
        .read<
            TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc>()
        .add(
            TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpSubmit(
                _findText(state)));
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherTemplateNameIsCorrect(
          TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState
              state) =>
      _checkTemplateNameIsValid(state) ||
      _checkTemplateNameEnteredCorrectly(state);

  bool _checkTemplateNameEnteredCorrectly(
          TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState
              state) =>
      state.formSubmissionOnLocationTemplateAddingState.submissionSuccess ==
      true;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findPreviousTemplateName(BuildContext dialogContext) => dialogContext
      .read<
          TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc>()
      .state
      .templateName!;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findTemplateName(BuildContext context) => context
      .read<
          TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc>()
      .state
      .templateName!;

  /// METHODS ==========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkTemplateNameIsValid(
          TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState
              state) =>
      state.formSubmissionOnLocationTemplateAddingState.isValid != false;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findText(
          TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState
              state) =>
      state.fieldText!;

  double get _findButtonWidth => screenWidth * 0.90 * 0.34;

  /// Screen Methods ---------------------------------------------------------------------------------------------------
  void _closePopUp(BuildContext dialogContext) {
    Navigator.of(dialogContext).pop();
  }
}
