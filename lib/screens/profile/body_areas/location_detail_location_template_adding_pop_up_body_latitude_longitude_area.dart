import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/blocs/text_of_latitude_longitude_on_location_detail_location_template_adding_pop_up/text_of_latitude_longitude_on_location_detail_location_template_adding_pop_up_bloc.dart';
import 'package:my_project/logic/blocs/textfield_of_latitude_longitude_on_location_detail_location_template_adding_pop_up/textfield_of_latitude_longitude_on_location_detail_location_template_adding_pop_up_bloc.dart';
import 'package:my_project/widgets/widget.dart';

class LocationDetailLocationTemplateAddingPopUpBodyLatitudeLongitudeArea
    extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppTextConstants _appTextConstants = AppTextConstants();

  final TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc
      textfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc;
  final double screenWidth;
  final TextStyle textfieldTextStyle;
  final TextStyle buttonTextStyle;
  final Color textColor;

  LocationDetailLocationTemplateAddingPopUpBodyLatitudeLongitudeArea({
    required this.textfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc,
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
  CustomTitle _createTemplateNameTitle() => const CustomTitle(
      spaceFromUpperWidget: 32, textLabel: 'Latitude, Longitude');

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

  /// BIRTHYEAR TEXT AREA ==============================================================================================
  /// CREATE ===========================================================================================================
  AppHeader _createTemplateNameArea() => AppHeader(
        firstWidget: _buildTemplateNameTextArea(),
        thirdWidget: Icon(Icons.edit, color: textColor),
      );

  /// BUILD ============================================================================================================
  BlocBuilder<
          TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc,
          TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState>
      _buildTemplateNameTextArea() => BlocBuilder<
              TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc,
              TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState>(
            builder: (context, state) => _displayTemplateNameText(state),
          );

  /// DISPLAY ==========================================================================================================
  Expanded _displayTemplateNameText(
          TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState
              state) =>
      Expanded(
        child: AppHeaderText(
            textLabel: _findOpeningText(state), textStyle: textfieldTextStyle),
      );

  /// METHODS ==========================================================================================================
  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findOpeningText(
          TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState
              state) =>
      state.templateName ?? 'Latitude, Longitude';

  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================

  /// BIRTHYEAR TEXTFIELD AREA =========================================================================================
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
          TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc,
          TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState>
      _buildTemplateNameTextField(bool checkPreviousState) => BlocBuilder<
              TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc,
              TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState>(
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
    TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState
        state,
  ) =>
      NameTextField(
        limitOfTextLenght: 31,
        isTextValid: _checkTemplateNameIsValid(state),
        labelName: 'Latitude, Longitude',
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
            TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc>()
        .add(
            TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpSubmit(
                _findTemplateName(context)));
  }

  void _updateTemplateName(BuildContext context, String value) => context
      .read<
          TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc>()
      .add(
          TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpSubmit(
              value));

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findCorrectErrorMessage(
          TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState
              state) =>
      state.formSubmissionOnLocationTemplateLatitudeLongitudeAddingState
          .errorMessage;

  void _findNewTemplateName(BuildContext context, String value) {
    if (value.isNotEmpty) {
      _updateTemplateName(context, value);
    }
  }

  // Check Methods ----------------------------------------------------------------------------------------------------
  void _checkWhetherPreviousTemplateNameIsChosen(
      BuildContext context, bool checkPreviousState) {
    if (checkPreviousState == false) {
      _getExistingTemplateName(context);
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
          TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc,
          TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState>
      _buildAddingButton(
    BuildContext context,
    bool checkPreviousState,
  ) =>
          BlocBuilder<
              TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc,
              TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState>(
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
    TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState
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
        textfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc
            .add(
                TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpSubmit(
                    _findPreviousTemplateName(dialogContext)));
        checkPreviousState = false;
      },
    );
  }

  void _clickAddButton(
    BuildContext dialogContext,
    TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState
        state,
    bool checkPreviousState,
  ) {
    checkPreviousState = false;
    _closePopUp(dialogContext);
    dialogContext
        .read<
            TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc>()
        .add(
            TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpSubmit(
                _findText(state)));
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherTemplateNameIsCorrect(
          TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState
              state) =>
      _checkTemplateNameIsValid(state) ||
      _checkTemplateNameEnteredCorrectly(state);

  bool _checkTemplateNameEnteredCorrectly(
          TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState
              state) =>
      state.formSubmissionOnLocationTemplateLatitudeLongitudeAddingState
          .submissionSuccess ==
      true;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findPreviousTemplateName(BuildContext dialogContext) => dialogContext
      .read<
          TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc>()
      .state
      .templateName!;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findTemplateName(BuildContext context) => context
      .read<
          TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc>()
      .state
      .templateName!;

  /// METHODS ==========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkTemplateNameIsValid(
          TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState
              state) =>
      state.formSubmissionOnLocationTemplateLatitudeLongitudeAddingState
          .isValid !=
      false;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findText(
          TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState
              state) =>
      state.fieldText!;

  double get _findButtonWidth => screenWidth * 0.90 * 0.34;

  /// Screen Methods ---------------------------------------------------------------------------------------------------
  void _closePopUp(BuildContext dialogContext) {
    Navigator.of(dialogContext).pop();
  }
}
