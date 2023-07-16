import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

class PersonalDetailsEditingPopUpAboutYourselfArea extends StatefulWidget {
  final TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpBloc
      textFieldOfAboutYourselfOnPersonalDetailEditingPopUpBloc;
  final double screenWidth;
  final TextStyle textfieldTextStyle;
  final TextStyle buttonTextStyle;
  final Color textColor;

  const PersonalDetailsEditingPopUpAboutYourselfArea({
    required this.textFieldOfAboutYourselfOnPersonalDetailEditingPopUpBloc,
    required this.screenWidth,
    required this.textfieldTextStyle,
    required this.buttonTextStyle,
    required this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  State<PersonalDetailsEditingPopUpAboutYourselfArea> createState() =>
      _PersonalDetailsEditingPopUpAboutYourselfAreaState();
}

class _PersonalDetailsEditingPopUpAboutYourselfAreaState
    extends State<PersonalDetailsEditingPopUpAboutYourselfArea> {
  final AppColors _appColors = AppColors();
  final AppTextConstants _appTextConstants = AppTextConstants();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();

  @override
  void initState() {
    super.initState();
    context.read<TextOfAboutYourselfOnPersonalDetailEditingPopUpBloc>().add(
        TextOfAboutYourselfOnPersonalDetailEditingPopUpSubmit(
            context.read<UserBloc>().state.userList.last.aboutUser));
  }

  @override
  Widget build(BuildContext context) {
    bool checkPreviousState = false;

    return CustomColumn(
      children: [
        _createAboutYourselfTitle(),
        _createShowDialogButton(context, checkPreviousState),
        const CustomAppSizedBox(height: 30),
      ],
    );
  }

  /// TITLES ===========================================================================================================
  CustomTitle _createAboutYourselfTitle() =>
      const CustomTitle(spaceFromUpperWidget: 32, textLabel: 'AboutYourself');

  /// CREATE ===========================================================================================================
  GestureDetector _createShowDialogButton(
      BuildContext context, bool checkPreviousState) {
    return GestureDetector(
      child: _createAboutYourselfTextArea(checkPreviousState),
      onTap: () {
        _openAboutYourselfTextfieldDialog(context, checkPreviousState);
      },
    );
  }

  /// ABOUT YOURSELF TEXT AREA =========================================================================================
  /// CREATE ===========================================================================================================
  AppHeader _createAboutYourselfTextArea(bool checkPreviousState) => AppHeader(
        firstWidget: _buildAboutYourselfTextArea(),
        // thirdWidget: Icon(Icons.edit, color: widget.textColor),
      );

  /// BUILD ============================================================================================================
  BlocBuilder<TextOfAboutYourselfOnPersonalDetailEditingPopUpBloc,
          TextOfAboutYourselfOnPersonalDetailEditingPopUpState>
      _buildAboutYourselfTextArea() {
    return BlocBuilder<TextOfAboutYourselfOnPersonalDetailEditingPopUpBloc,
        TextOfAboutYourselfOnPersonalDetailEditingPopUpState>(
      builder: (context, state) {
        _checkWhetherAboutYourselfIsEmptyOnText(state, context);
        return _displayAboutYourselfText(state);
      },
    );
  }

  /// DISPLAY ==========================================================================================================
  Expanded _displayAboutYourselfText(
      TextOfAboutYourselfOnPersonalDetailEditingPopUpState state) {
    return Expanded(
      child: AppHeaderText(
        textLabel: _findAboutYourselfText(state),
        textStyle: widget.textfieldTextStyle,
      ),
    );
  }

  /// METHODS ==========================================================================================================
  void _getInitialAboutYourself(BuildContext context) {
    context
        .read<TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpBloc>()
        .add(TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpSubmit(
            _findChosenAboutYourself(context)));
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  void _checkWhetherAboutYourselfIsEmptyOnText(
      TextOfAboutYourselfOnPersonalDetailEditingPopUpState state,
      BuildContext context) {
    if (state.aboutYourself == '') {
      _getInitialAboutYourself(context);
    }
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findAboutYourselfText(
          TextOfAboutYourselfOnPersonalDetailEditingPopUpState state) =>
      state.aboutYourself ?? '';

  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================

  /// AboutYourself TEXTFIELD AREA ==========================================================================================
  /// TEXTFIELD ========================================================================================================
  void _openAboutYourselfTextfieldDialog(
      BuildContext context, bool checkPreviousState) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (diaglogContext) =>
          _createTextDialog(context, checkPreviousState),
    );
  }

  /// CREATE ===========================================================================================================
  PopUpBody _createTextDialog(
    BuildContext context,
    bool checkPreviousState,
  ) =>
      PopUpBody(
        height: context.height * _appNumberConstants.kAboutYourselfDialogRatio,
        children: [
          const CustomAppSizedBox(),
          _buildAboutYourselfTextField(checkPreviousState),
          const Expanded(child: SizedBox()),
          _createBottomButtonArea(context, checkPreviousState),
          const CustomAppSizedBox(),
        ],
      );

  /// BUILD ============================================================================================================
  BlocBuilder<TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpBloc,
          TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpState>
      _buildAboutYourselfTextField(
    bool checkPreviousState,
  ) =>
          BlocBuilder<TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpBloc,
              TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpState>(
            builder: (context, state) {
              _checkWhetherPreviousAboutYourselfIsChosen(
                  checkPreviousState, context);
              checkPreviousState = true;
              return _displayAboutYourselfTextField(context, state);
            },
          );

  /// DISPLAY ==========================================================================================================
  NameTextField _displayAboutYourselfTextField(
    BuildContext context,
    TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpState state,
  ) =>
      NameTextField(
          limitOfTextLenght: _appNumberConstants.kAboutYourselfLenghtLimit,
          isTextValid: _checkAboutYourselfIsValid(state),
          labelName: 'AboutYourself',
          errorMessage: _findCorrectErrorMessage(state),
          initialValue: _findInitialAboutYourself(context, state),
          onChanged: (value) {
            _findNewAboutYourself(context, value);
          });

  /// METHODS ==========================================================================================================
  void _getExistingAboutYourself(BuildContext context) {
    context
        .read<TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpBloc>()
        .add(TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpSubmit(
            _findAboutYourself(context)));
  }

  void _updateAboutYourself(BuildContext context, String value) => context
      .read<TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpBloc>()
      .add(TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpSubmit(value));

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findCorrectErrorMessage(
          TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpState state) =>
      state.formSubmissionOnAboutYourselfEditingState.errorMessage;

  String _findInitialAboutYourself(BuildContext context,
          TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpState state) =>
      state.fieldText == ''
          ? _findChosenAboutYourself(context)
          : _findText(state);

  /// XXXXXXX this if condition can be deleted if there is any issue occurs XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  void _findNewAboutYourself(BuildContext context, String value) {
    if (value.isNotEmpty) {
      _updateAboutYourself(context, value);
    }
  }

  String _findAboutYourself(BuildContext context) => context
      .read<TextOfAboutYourselfOnPersonalDetailEditingPopUpBloc>()
      .state
      .aboutYourself!;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  void _checkWhetherPreviousAboutYourselfIsChosen(
      bool checkPreviousState, BuildContext context) {
    if (checkPreviousState == false) {
      _getExistingAboutYourself(context);
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
          _buildUpdatingButton(context, checkPreviousState),
        ],
      );

  /// BUILD ============================================================================================================
  BlocBuilder<TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpBloc,
          TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpState>
      _buildUpdatingButton(
    BuildContext context,
    bool checkPreviousState,
  ) =>
          BlocBuilder<TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpBloc,
              TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpState>(
            builder: (context, state) {
              return _displayUpdatingButton(state, context, checkPreviousState);
            },
          );

  /// DISPLAY ==========================================================================================================
  CustomElevatedButton _displayCancelButton(
    BuildContext context,
    bool checkPreviousState,
  ) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.cancel,
          textStyle: widget.buttonTextStyle,
          elevatedButtonWidth: _findButtonWidth,
          buttonColor: _appColors.buttonDarkColor,
          onPressed: () => _clickCancelButton(context, checkPreviousState));

  CustomElevatedButton _displayUpdatingButton(
          TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpState state,
          BuildContext context,
          bool checkPreviousState) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.update,
          textStyle: widget.buttonTextStyle,
          elevatedButtonWidth: _findButtonWidth,
          buttonColor: _appColors.secondary,
          onPressed: _checkWhetherAboutYourselfIsCorrect(state)
              ? () => _clickUpdateButton(context, state, checkPreviousState)
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
        widget.textFieldOfAboutYourselfOnPersonalDetailEditingPopUpBloc.add(
            TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpSubmit(
                _findPreviousAboutYourself(dialogContext)));
        checkPreviousState = false;
      },
    );
  }

  void _clickUpdateButton(
    BuildContext dialogContext,
    TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpState state,
    bool checkPreviousState,
  ) {
    checkPreviousState = false;
    _closePopUp(dialogContext);
    dialogContext
        .read<TextOfAboutYourselfOnPersonalDetailEditingPopUpBloc>()
        .add(TextOfAboutYourselfOnPersonalDetailEditingPopUpSubmit(
            _findText(state)));
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findPreviousAboutYourself(BuildContext dialogContext) => dialogContext
      .read<TextOfAboutYourselfOnPersonalDetailEditingPopUpBloc>()
      .state
      .aboutYourself!;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherAboutYourselfIsCorrect(
          TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpState state) =>
      _checkAboutYourselfIsValid(state) ||
      _checkAboutYourselfEnteredCorrectly(state);

  bool _checkAboutYourselfEnteredCorrectly(
          TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpState state) =>
      state.formSubmissionOnAboutYourselfEditingState.submissionSuccess == true;

  /// METHODS ==========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkAboutYourselfIsValid(
          TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpState state) =>
      state.formSubmissionOnAboutYourselfEditingState.isValid != false;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findText(
          TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpState state) =>
      state.fieldText!;

  String _findChosenAboutYourself(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.aboutUser;

  double get _findButtonWidth => widget.screenWidth * 0.90 * 0.34;

  /// Screen Methods ---------------------------------------------------------------------------------------------------
  void _closePopUp(BuildContext dialogContext) {
    Navigator.of(dialogContext).pop();
  }
}
