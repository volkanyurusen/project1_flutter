import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class LocationTemplateUpdatingPopUpBodyTemplateNameArea extends StatefulWidget {
  final TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc
      textFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc;
  final double screenWidth;
  final TextStyle textfieldTextStyle;
  final TextStyle buttonTextStyle;
  final Color textColor;

  const LocationTemplateUpdatingPopUpBodyTemplateNameArea({
    required this.textFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc,
    required this.screenWidth,
    required this.textfieldTextStyle,
    required this.buttonTextStyle,
    required this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  State<LocationTemplateUpdatingPopUpBodyTemplateNameArea> createState() =>
      _LocationTemplateUpdatingPopUpBodyTemplateNameAreaState();
}

class _LocationTemplateUpdatingPopUpBodyTemplateNameAreaState
    extends State<LocationTemplateUpdatingPopUpBodyTemplateNameArea> {
  final AppColors _appColors = AppColors();
  final AppTextConstants _appTextConstants = AppTextConstants();

  @override
  void initState() {
    super.initState();
    context
        .read<TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc>()
        .add(TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpSubmit(context
            .read<
                ChosenLocationTemplateAmongLocationTemplateDynamicOfUserOnUpdatingPopUpCubit>()
            .state
            .chosenLocationTemplateDynamicList
            .last
            .locationTemplateName));
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

  // TITLES ===========================================================================================================
  CustomTitle _createTemplateNameTitle() =>
      const CustomTitle(spaceFromUpperWidget: 32, textLabel: 'Template Name');

  // CREATE ============================================================================================================
  GestureDetector _createShowDialogButton(
    BuildContext context,
    bool checkPreviousState,
  ) =>
      GestureDetector(
          child: _createTemplateNameArea(),
          onTap: () {
            _openTemplateNameTextfieldDialog(context, checkPreviousState);
          });

  // TEMPLATE NAME TEXT AREA ===========================================================================================
  // CREATE ============================================================================================================
  AppHeader _createTemplateNameArea() => AppHeader(
      firstWidget: _buildTemplateNameTextArea(),
      thirdWidget: Icon(Icons.edit, color: widget.textColor));

  // BUILD =============================================================================================================
  BlocBuilder<TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc,
          TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState>
      _buildTemplateNameTextArea() => BlocBuilder<
                  TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc,
                  TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState>(
              builder: (context, state) {
            _checkWhetherTemplateNameIsEmptyOnText(context, state);
            return _displayTemplateNameText(state);
          });

  // DISPLAY ===========================================================================================================
  Expanded _displayTemplateNameText(
    TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState state,
  ) =>
      Expanded(
          child: AppHeaderText(
              textLabel: _findOpeningText(state),
              textStyle: widget.textfieldTextStyle));

  // METHODS ===========================================================================================================
  void _getInitialTemplateName(BuildContext context) {
    context
        .read<
            TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc>()
        .add(
            TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpSubmit(
                _findFirstTemplateName(context)));
  }

  // Check Methods -----------------------------------------------------------------------------------------------------
  void _checkWhetherTemplateNameIsEmptyOnText(
    BuildContext context,
    TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState state,
  ) {
    if (state.templateName == '') {
      _getInitialTemplateName(context);
    }
  }

  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findOpeningText(
          TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState
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
    BuildContext context,
    bool checkPreviousState,
  ) {
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
          TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc,
          TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState>
      _buildTemplateNameTextField(
    bool checkPreviousState,
  ) =>
          BlocBuilder<
              TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc,
              TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState>(
            builder: (context, state) {
              _checkWhetherPreviousTemplateNameIsChosen(
                  context, checkPreviousState);
              checkPreviousState = true;
              return _displayTemplateNameTextField(context, state);
            },
          );

  // DISPLAY ===========================================================================================================
  NameTextField _displayTemplateNameTextField(
    BuildContext context,
    TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState state,
  ) =>
      NameTextField(
          limitOfTextLenght: 31,
          isTextValid: _checkTemplateNameIsValid(state),
          labelName: 'Template Name',
          errorMessage: _findCorrectErrorMessage(state),
          initialValue: _findInitialTemplateName(context, state),
          onChanged: (value) {
            _findNewTemplateName(context, value);
          });

  // METHODS ===========================================================================================================
  void _getExistingTemplateName(BuildContext context) {
    context
        .read<
            TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc>()
        .add(
            TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpSubmit(
                _findTemplateName(context)));
  }

  void _updateTemplateName(BuildContext context, String value) => context
      .read<
          TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc>()
      .add(TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpSubmit(
          value));

  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findCorrectErrorMessage(
          TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState
              state) =>
      state.formSubmissionOnLocationTemplateUpdatingState.errorMessage;

  String _findInitialTemplateName(
    BuildContext context,
    TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState state,
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
      .read<TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc>()
      .state
      .templateName!;

  // Check Methods -----------------------------------------------------------------------------------------------------
  void _checkWhetherPreviousTemplateNameIsChosen(
      BuildContext context, bool checkPreviousState) {
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
          TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc,
          TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState>
      _buildUpdatingButton(
    BuildContext context,
    bool checkPreviousState,
  ) =>
          BlocBuilder<
              TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc,
              TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState>(
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
    TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState state,
    bool checkPreviousState,
  ) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.save,
          textStyle: widget.buttonTextStyle,
          elevatedButtonWidth: _findButtonWidth,
          buttonColor: _appColors.secondary,
          onPressed: _checkWhetherTemplateNameIsCorrect(state)
              ? () {
                  _clickAddButton(context, state, checkPreviousState);
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
            .textFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc
            .add(
                TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpSubmit(
                    _findPreviousTemplateName(dialogContext)));
        checkPreviousState = false;
      },
    );
  }

  void _clickAddButton(
    BuildContext dialogContext,
    TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState state,
    bool checkPreviousState,
  ) {
    checkPreviousState = false;
    _closePopUp(dialogContext);
    dialogContext
        .read<TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc>()
        .add(TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpSubmit(
            _findText(state)));
  }

  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherTemplateNameIsCorrect(
          TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState
              state) =>
      _checkTemplateNameIsValid(state) ||
      _checkTemplateNameEnteredCorrectly(state);

  bool _checkTemplateNameEnteredCorrectly(
          TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState
              state) =>
      state.formSubmissionOnLocationTemplateUpdatingState.submissionSuccess ==
      true;

  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findPreviousTemplateName(BuildContext dialogContext) => dialogContext
      .read<TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc>()
      .state
      .templateName!;

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkTemplateNameIsValid(
          TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState
              state) =>
      state.formSubmissionOnLocationTemplateUpdatingState.isValid != false;

  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findText(
          TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState
              state) =>
      state.fieldText!;

  String _findFirstTemplateName(BuildContext context) => context
      .read<
          ChosenLocationTemplateAmongLocationTemplateDynamicOfUserOnUpdatingPopUpCubit>()
      .state
      .chosenLocationTemplateDynamicList
      .last
      .locationTemplateName;

  double get _findButtonWidth => widget.screenWidth * 0.90 * 0.34;

  // Screen Methods ----------------------------------------------------------------------------------------------------
  void _closePopUp(BuildContext dialogContext) {
    Navigator.of(dialogContext).pop();
  }
}
