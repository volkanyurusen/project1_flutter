import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

class PersonalDetailsEditingPopUpUsernameArea extends StatefulWidget {
  final TextFieldOfUsernameOnPersonalDetailEditingPopUpBloc
      textFieldOfUsernameOnPersonalDetailEditingPopUpBloc;
  final double screenWidth;
  final TextStyle textfieldTextStyle;
  final TextStyle buttonTextStyle;
  final Color textColor;

  const PersonalDetailsEditingPopUpUsernameArea({
    required this.textFieldOfUsernameOnPersonalDetailEditingPopUpBloc,
    required this.screenWidth,
    required this.textfieldTextStyle,
    required this.buttonTextStyle,
    required this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  State<PersonalDetailsEditingPopUpUsernameArea> createState() =>
      _PersonalDetailsEditingPopUpUsernameAreaState();
}

class _PersonalDetailsEditingPopUpUsernameAreaState
    extends State<PersonalDetailsEditingPopUpUsernameArea> {
  final AppColors _appColors = AppColors();
  final AppTextConstants _appTextConstants = AppTextConstants();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();

  @override
  void initState() {
    super.initState();
    context.read<TextOfUsernameOnPersonalDetailEditingPopUpBloc>().add(
        TextOfUsernameOnPersonalDetailEditingPopUpSubmit(
            context.read<UserBloc>().state.userList.last.username));
    context.read<TextFieldOfUsernameOnPersonalDetailEditingPopUpBloc>().add(
        TextFieldOfUsernameOnPersonalDetailEditingPopUpSubmit(
            context.read<UserBloc>().state.userList.last.username));
  }

  @override
  Widget build(BuildContext context) {
    bool checkPreviousState = false;

    return CustomColumn(
      children: [
        _createUsernameTitle(),
        _createShowDialogButton(context, checkPreviousState),
      ],
    );
  }

  /// TITLES ===========================================================================================================
  CustomTitle _createUsernameTitle() =>
      const CustomTitle(spaceFromUpperWidget: 32, textLabel: 'Username');

  /// CREATE ===========================================================================================================
  GestureDetector _createShowDialogButton(
      BuildContext context, bool checkPreviousState) {
    return GestureDetector(
      child: _createUsernameTextArea(checkPreviousState),
      onTap: () {
        _openUsernameTextfieldDialog(context, checkPreviousState);
      },
    );
  }

  /// BIRTHYEAR TEXT AREA ==============================================================================================
  /// CREATE ===========================================================================================================
  AppHeader _createUsernameTextArea(bool checkPreviousState) => AppHeader(
        firstWidget: _buildUsernameTextArea(),
        // thirdWidget: Icon(Icons.edit, color: widget.textColor),
      );

  /// BUILD ============================================================================================================
  BlocBuilder<TextOfUsernameOnPersonalDetailEditingPopUpBloc,
          TextOfUsernameOnPersonalDetailEditingPopUpState>
      _buildUsernameTextArea() {
    return BlocBuilder<TextOfUsernameOnPersonalDetailEditingPopUpBloc,
        TextOfUsernameOnPersonalDetailEditingPopUpState>(
      builder: (context, state) {
        _checkWhetherUsernameIsEmptyOnText(state, context);
        return _displayUsernameText(state);
      },
    );
  }

  /// DISPLAY ==========================================================================================================
  Expanded _displayUsernameText(
      TextOfUsernameOnPersonalDetailEditingPopUpState state) {
    return Expanded(
      child: AppHeaderText(
        textLabel: _findUsernameText(state),
        textStyle: widget.textfieldTextStyle,
      ),
    );
  }

  /// METHODS ==========================================================================================================
  void _getInitialUsername(BuildContext context) {
    context.read<TextFieldOfUsernameOnPersonalDetailEditingPopUpBloc>().add(
        TextFieldOfUsernameOnPersonalDetailEditingPopUpSubmit(
            _findChosenUsername(context)));
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  void _checkWhetherUsernameIsEmptyOnText(
      TextOfUsernameOnPersonalDetailEditingPopUpState state,
      BuildContext context) {
    if (state.username == '') {
      _getInitialUsername(context);
    }
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findUsernameText(
          TextOfUsernameOnPersonalDetailEditingPopUpState state) =>
      state.username ?? '';

  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================

  /// USERNAME TEXTFIELD AREA ==========================================================================================
  /// TEXTFIELD ========================================================================================================
  void _openUsernameTextfieldDialog(
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
        height: context.height * _appNumberConstants.kUsernameDialogRatio,
        children: [
          const CustomAppSizedBox(),
          _buildUsernameTextField(checkPreviousState),
          const Expanded(child: SizedBox()),
          _createBottomButtonArea(context, checkPreviousState),
          const CustomAppSizedBox(height: 18),
        ],
      );

  /// BUILD ============================================================================================================
  BlocBuilder<TextFieldOfUsernameOnPersonalDetailEditingPopUpBloc,
          TextFieldOfUsernameOnPersonalDetailEditingPopUpState>
      _buildUsernameTextField(
    bool checkPreviousState,
  ) =>
          BlocBuilder<TextFieldOfUsernameOnPersonalDetailEditingPopUpBloc,
              TextFieldOfUsernameOnPersonalDetailEditingPopUpState>(
            builder: (context, state) {
              _checkWhetherPreviousUsernameIsChosen(
                  checkPreviousState, context);
              checkPreviousState = true;
              return _displayUsernameTextField(context, state);
            },
          );

  /// DISPLAY ==========================================================================================================
  NameTextField _displayUsernameTextField(
    BuildContext context,
    TextFieldOfUsernameOnPersonalDetailEditingPopUpState state,
  ) =>
      NameTextField(
          limitOfTextLenght: _appNumberConstants.kUsernameLenghtLimit,
          isTextValid: _checkUsernameIsValid(state),
          labelName: 'Username',
          errorMessage: _findCorrectErrorMessage(state),
          initialValue: _findInitialUsername(context, state),
          onChanged: (value) {
            _findNewUsername(context, value);
          });

  /// METHODS ==========================================================================================================
  void _getExistingUsername(BuildContext context) {
    context.read<TextFieldOfUsernameOnPersonalDetailEditingPopUpBloc>().add(
        TextFieldOfUsernameOnPersonalDetailEditingPopUpSubmit(
            _findUsername(context)));
  }

  void _updateUsername(BuildContext context, String value) => context
      .read<TextFieldOfUsernameOnPersonalDetailEditingPopUpBloc>()
      .add(TextFieldOfUsernameOnPersonalDetailEditingPopUpSubmit(value));

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findCorrectErrorMessage(
          TextFieldOfUsernameOnPersonalDetailEditingPopUpState state) =>
      state.formSubmissionOnUsernameEditingState.errorMessage;

  String _findInitialUsername(BuildContext context,
          TextFieldOfUsernameOnPersonalDetailEditingPopUpState state) =>
      state.fieldText == '' ? _findChosenUsername(context) : _findText(state);

  /// XXXXXXX this if condition can be deleted if there is any issue occurs XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  void _findNewUsername(BuildContext context, String value) {
    if (value.isNotEmpty) {
      _updateUsername(context, value);
    }
  }

  String _findUsername(BuildContext context) => context
      .read<TextOfUsernameOnPersonalDetailEditingPopUpBloc>()
      .state
      .username!;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  void _checkWhetherPreviousUsernameIsChosen(
      bool checkPreviousState, BuildContext context) {
    if (checkPreviousState == false) {
      _getExistingUsername(context);
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
  BlocBuilder<TextFieldOfUsernameOnPersonalDetailEditingPopUpBloc,
          TextFieldOfUsernameOnPersonalDetailEditingPopUpState>
      _buildUpdatingButton(
    BuildContext context,
    bool checkPreviousState,
  ) =>
          BlocBuilder<TextFieldOfUsernameOnPersonalDetailEditingPopUpBloc,
              TextFieldOfUsernameOnPersonalDetailEditingPopUpState>(
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
          TextFieldOfUsernameOnPersonalDetailEditingPopUpState state,
          BuildContext context,
          bool checkPreviousState) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.update,
          textStyle: widget.buttonTextStyle,
          elevatedButtonWidth: _findButtonWidth,
          buttonColor: _appColors.secondary,
          onPressed: _checkWhetherUsernameIsCorrect(state)
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
        widget.textFieldOfUsernameOnPersonalDetailEditingPopUpBloc.add(
            TextFieldOfUsernameOnPersonalDetailEditingPopUpSubmit(
                _findPreviousUsername(dialogContext)));
        checkPreviousState = false;
      },
    );
  }

  void _clickUpdateButton(
    BuildContext dialogContext,
    TextFieldOfUsernameOnPersonalDetailEditingPopUpState state,
    bool checkPreviousState,
  ) {
    checkPreviousState = false;
    _closePopUp(dialogContext);
    dialogContext.read<TextOfUsernameOnPersonalDetailEditingPopUpBloc>().add(
        TextOfUsernameOnPersonalDetailEditingPopUpSubmit(_findText(state)));
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findPreviousUsername(BuildContext dialogContext) => dialogContext
      .read<TextOfUsernameOnPersonalDetailEditingPopUpBloc>()
      .state
      .username!;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherUsernameIsCorrect(
          TextFieldOfUsernameOnPersonalDetailEditingPopUpState state) =>
      _checkUsernameIsValid(state) || _checkUsernameEnteredCorrectly(state);

  bool _checkUsernameEnteredCorrectly(
          TextFieldOfUsernameOnPersonalDetailEditingPopUpState state) =>
      state.formSubmissionOnUsernameEditingState.submissionSuccess == true;

  /// METHODS ==========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkUsernameIsValid(
          TextFieldOfUsernameOnPersonalDetailEditingPopUpState state) =>
      state.formSubmissionOnUsernameEditingState.isValid != false;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findText(
          TextFieldOfUsernameOnPersonalDetailEditingPopUpState state) =>
      state.fieldText!;

  String _findChosenUsername(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.username;

  double get _findButtonWidth => widget.screenWidth * 0.90 * 0.34;

  /// Screen Methods ---------------------------------------------------------------------------------------------------
  void _closePopUp(BuildContext dialogContext) {
    Navigator.of(dialogContext).pop();
  }
}
