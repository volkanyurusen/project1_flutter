import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class LocationTemplateUpdatingPopUpBodyLatitudeLongitudeArea
    extends StatefulWidget {
  final TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc
      textfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc;
  final double screenWidth;
  final TextStyle textfieldTextStyle;
  final TextStyle buttonTextStyle;
  final Color textColor;

  const LocationTemplateUpdatingPopUpBodyLatitudeLongitudeArea({
    required this.textfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc,
    required this.screenWidth,
    required this.textfieldTextStyle,
    required this.buttonTextStyle,
    required this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  State<LocationTemplateUpdatingPopUpBodyLatitudeLongitudeArea> createState() =>
      _LocationTemplateUpdatingPopUpBodyLatitudeLongitudeAreaState();
}

class _LocationTemplateUpdatingPopUpBodyLatitudeLongitudeAreaState
    extends State<LocationTemplateUpdatingPopUpBodyLatitudeLongitudeArea> {
  final AppColors _appColors = AppColors();
  final AppTextConstants _appTextConstants = AppTextConstants();

  @override
  void initState() {
    super.initState();
    context
        .read<TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc>()
        .add(TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpSubmit(
            '${context.read<ChosenLocationTemplateAmongLocationTemplateDynamicOfUserOnUpdatingPopUpCubit>().state.chosenLocationTemplateDynamicList.last.locationDetailDynamic.lat.toString()}, ${context.read<ChosenLocationTemplateAmongLocationTemplateDynamicOfUserOnUpdatingPopUpCubit>().state.chosenLocationTemplateDynamicList.last.locationDetailDynamic.lon.toString()}'));
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

  // LATITUDE LONGITUDE TEXT AREA ======================================================================================
  // CREATE ============================================================================================================
  AppHeader _createTemplateNameArea() => AppHeader(
      firstWidget: _buildTemplateNameTextArea(),
      thirdWidget: Icon(Icons.edit, color: widget.textColor));

  // BUILD =============================================================================================================
  BlocBuilder<TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc,
          TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState>
      _buildTemplateNameTextArea() => BlocBuilder<
                  TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc,
                  TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState>(
              builder: (context, state) {
            _checkWhetherTemplateNameIsEmptyOnText(context, state);
            return _displayTemplateNameText(state);
          });

  // DISPLAY ===========================================================================================================
  Expanded _displayTemplateNameText(
    TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState state,
  ) =>
      Expanded(
          child: AppHeaderText(
              textLabel: _findOpeningText(state),
              textStyle: widget.textfieldTextStyle));

  // METHODS ===========================================================================================================
  void _getInitialTemplateName(BuildContext context) {
    context
        .read<TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc>()
        .add(TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpSubmit(
            _findFirstTemplateName(context)));
  }

  // Check Methods -----------------------------------------------------------------------------------------------------
  void _checkWhetherTemplateNameIsEmptyOnText(
    BuildContext context,
    TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState state,
  ) {
    if (state.templateName == '') {
      _getInitialTemplateName(context);
    }
  }

  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findOpeningText(
          TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState state) =>
      state.templateName ?? '';

  // ===================================================================================================================
  // ===================================================================================================================
  // ===================================================================================================================
  // ===================================================================================================================
  // ===================================================================================================================
  // ===================================================================================================================
  // ===================================================================================================================

  // LATITUDE LONGITUDE TEXTFIELD AREA =================================================================================
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
  BlocBuilder<TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc,
          TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState>
      _buildTemplateNameTextField(
    bool checkPreviousState,
  ) =>
          BlocBuilder<
              TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc,
              TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState>(
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
    TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState state,
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
        .read<TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc>()
        .add(TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpSubmit(
            _findTemplateName(context)));
  }

  void _updateTemplateName(BuildContext context, String value) => context
      .read<TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc>()
      .add(TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpSubmit(
          value));

  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findCorrectErrorMessage(
          TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState
              state) =>
      state.formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState
          .errorMessage;

  String _findInitialTemplateName(
    BuildContext context,
    TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState state,
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
      .read<TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc>()
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
  BlocBuilder<TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc,
          TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState>
      _buildUpdatingButton(
    BuildContext context,
    bool checkPreviousState,
  ) =>
          BlocBuilder<
              TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc,
              TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState>(
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
    TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState state,
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
        widget.textfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc
            .add(
                TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpSubmit(
                    _findPreviousTemplateName(dialogContext)));
        checkPreviousState = false;
      },
    );
  }

  void _clickAddButton(
    BuildContext dialogContext,
    TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState state,
    bool checkPreviousState,
  ) {
    checkPreviousState = false;
    _closePopUp(dialogContext);
    dialogContext
        .read<TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc>()
        .add(TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpSubmit(
            _findText(state)));
  }

  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherTemplateNameIsCorrect(
          TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState
              state) =>
      _checkTemplateNameIsValid(state) ||
      _checkTemplateNameEnteredCorrectly(state);

  bool _checkTemplateNameEnteredCorrectly(
          TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState
              state) =>
      state.formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState
          .submissionSuccess ==
      true;

  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findPreviousTemplateName(BuildContext dialogContext) => dialogContext
      .read<TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc>()
      .state
      .templateName!;

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkTemplateNameIsValid(
          TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState
              state) =>
      state.formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState
          .isValid !=
      false;

  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findText(
          TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState
              state) =>
      state.fieldText!;

  String _findFirstTemplateName(BuildContext context) =>
      '${context.read<ChosenLocationTemplateAmongLocationTemplateDynamicOfUserOnUpdatingPopUpCubit>().state.chosenLocationTemplateDynamicList.last.locationDetailDynamic.lat.toString()}, ${context.read<ChosenLocationTemplateAmongLocationTemplateDynamicOfUserOnUpdatingPopUpCubit>().state.chosenLocationTemplateDynamicList.last.locationDetailDynamic.lon.toString()}';

  double get _findButtonWidth => widget.screenWidth * 0.90 * 0.34;

  // Screen Methods ----------------------------------------------------------------------------------------------------
  void _closePopUp(BuildContext dialogContext) {
    Navigator.of(dialogContext).pop();
  }
}
