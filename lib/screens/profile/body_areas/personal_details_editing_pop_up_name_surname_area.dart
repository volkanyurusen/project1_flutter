import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

class PersonalDetailsEditingPopUpNameSurnameArea extends StatefulWidget {
  final TextFieldOfNameSurnameOnPersonalDetailEditingPopUpBloc
      textFieldOfNameSurnameOnPersonalDetailEditingPopUpBloc;
  final double screenWidth;
  final TextStyle textfieldTextStyle;
  final TextStyle buttonTextStyle;
  final Color textColor;

  const PersonalDetailsEditingPopUpNameSurnameArea({
    required this.textFieldOfNameSurnameOnPersonalDetailEditingPopUpBloc,
    required this.screenWidth,
    required this.textfieldTextStyle,
    required this.buttonTextStyle,
    required this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  State<PersonalDetailsEditingPopUpNameSurnameArea> createState() =>
      _PersonalDetailsEditingPopUpNameSurnameAreaState();
}

class _PersonalDetailsEditingPopUpNameSurnameAreaState
    extends State<PersonalDetailsEditingPopUpNameSurnameArea> {
  final AppColors _appColors = AppColors();
  final AppTextConstants _appTextConstants = AppTextConstants();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();

  @override
  void initState() {
    super.initState();
    context.read<TextOfNameSurnameOnPersonalDetailEditingPopUpBloc>().add(
        TextOfNameSurnameOnPersonalDetailEditingPopUpSubmit(
            context.read<UserBloc>().state.userList.last.nameSurname));
    context.read<TextFieldOfNameSurnameOnPersonalDetailEditingPopUpBloc>().add(
        TextFieldOfNameSurnameOnPersonalDetailEditingPopUpSubmit(
            context.read<UserBloc>().state.userList.last.nameSurname));
  }

  @override
  Widget build(BuildContext context) {
    bool checkPreviousState = false;

    return CustomColumn(
      children: [
        _createNameSurnameTitle(),
        _createShowDialogButton(context, checkPreviousState),
      ],
    );
  }

  /// TITLES ===========================================================================================================
  CustomTitle _createNameSurnameTitle() =>
      const CustomTitle(spaceFromUpperWidget: 32, textLabel: 'Name Surname');

  /// CREATE ===========================================================================================================
  GestureDetector _createShowDialogButton(
      BuildContext context, bool checkPreviousState) {
    return GestureDetector(
      child: _createNameSurnameTextArea(checkPreviousState),
      onTap: () {
        _openNameSurnameTextfieldDialog(context, checkPreviousState);
      },
    );
  }

  /// BIRTHYEAR TEXT AREA ==============================================================================================
  /// CREATE ===========================================================================================================
  AppHeader _createNameSurnameTextArea(bool checkPreviousState) => AppHeader(
        firstWidget: _buildNameSurnameTextArea(),
        // thirdWidget: Icon(Icons.edit, color: widget.textColor),
      );

  /// BUILD ============================================================================================================
  BlocBuilder<TextOfNameSurnameOnPersonalDetailEditingPopUpBloc,
          TextOfNameSurnameOnPersonalDetailEditingPopUpState>
      _buildNameSurnameTextArea() {
    return BlocBuilder<TextOfNameSurnameOnPersonalDetailEditingPopUpBloc,
        TextOfNameSurnameOnPersonalDetailEditingPopUpState>(
      builder: (context, state) {
        final userState = context.watch<UserBloc>().state;
        if (userState.status == Status.success) {
          _checkWhetherNameSurnameIsEmptyOnText(state, context);
          return _displayNameSurnameText(state);
        }
        _checkWhetherNameSurnameIsEmptyOnText(state, context);
        return _displayNameSurnameText(state);
      },
    );
  }

  /// DISPLAY ==========================================================================================================
  Expanded _displayNameSurnameText(
      TextOfNameSurnameOnPersonalDetailEditingPopUpState state) {
    return Expanded(
      child: AppHeaderText(
        textLabel: _findNameSurname(state),
        textStyle: widget.textfieldTextStyle,
      ),
    );
  }

  /// METHODS ==========================================================================================================
  void _getInitialNameSurname(BuildContext context) {
    context.read<TextFieldOfNameSurnameOnPersonalDetailEditingPopUpBloc>().add(
        TextFieldOfNameSurnameOnPersonalDetailEditingPopUpSubmit(
            _findChosenNameSurname(context)));
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  void _checkWhetherNameSurnameIsEmptyOnText(
      TextOfNameSurnameOnPersonalDetailEditingPopUpState state,
      BuildContext context) {
    if (state.nameSurname == '') {
      _getInitialNameSurname(context);
    }
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findNameSurname(
          TextOfNameSurnameOnPersonalDetailEditingPopUpState state) =>
      state.nameSurname ?? '';

  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================

  /// NAME SURNAME TEXTFIELD AREA ======================================================================================
  /// TEXTFIELD ========================================================================================================
  void _openNameSurnameTextfieldDialog(
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
        height: context.height * _appNumberConstants.kNameSurnameDialogRatio,
        children: [
          const CustomAppSizedBox(),
          _buildNameSurnameTextField(checkPreviousState),
          const Expanded(child: SizedBox()),
          _createBottomButtonArea(context, checkPreviousState),
          const CustomAppSizedBox(height: 18),
        ],
      );

  /// BUILD ============================================================================================================
  BlocBuilder<TextFieldOfNameSurnameOnPersonalDetailEditingPopUpBloc,
          TextFieldOfNameSurnameOnPersonalDetailEditingPopUpState>
      _buildNameSurnameTextField(
    bool checkPreviousState,
  ) =>
          BlocBuilder<TextFieldOfNameSurnameOnPersonalDetailEditingPopUpBloc,
              TextFieldOfNameSurnameOnPersonalDetailEditingPopUpState>(
            builder: (context, state) {
              _checkWhetherPreviousNameSurnameIsChosen(
                  checkPreviousState, context);
              checkPreviousState = true;
              return _displayNameSurnameTextField(context, state);
            },
          );

  /// DISPLAY ==========================================================================================================
  NameTextField _displayNameSurnameTextField(
    BuildContext context,
    TextFieldOfNameSurnameOnPersonalDetailEditingPopUpState state,
  ) =>
      NameTextField(
          limitOfTextLenght: _appNumberConstants.kMainWordLenghtLimit,
          isTextValid: _checkNameSurnameIsValid(state),
          labelName: 'Name Surname',
          errorMessage: _findCorrectErrorMessage(state),
          initialValue: _findInitialNameSurname(context, state),
          onChanged: (value) {
            _findNewNameSurname(context, value);
          });

  /// METHODS ==========================================================================================================
  void _getExistingNameSurname(BuildContext context) {
    context.read<TextFieldOfNameSurnameOnPersonalDetailEditingPopUpBloc>().add(
        TextFieldOfNameSurnameOnPersonalDetailEditingPopUpSubmit(
            _findExistingNameSurname(context)));
  }

  void _updateNameSurname(BuildContext context, String value) => context
      .read<TextFieldOfNameSurnameOnPersonalDetailEditingPopUpBloc>()
      .add(TextFieldOfNameSurnameOnPersonalDetailEditingPopUpSubmit(value));

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findCorrectErrorMessage(
          TextFieldOfNameSurnameOnPersonalDetailEditingPopUpState state) =>
      state.formSubmissionOnNameSurnameEditingState.errorMessage;

  String _findInitialNameSurname(BuildContext context,
          TextFieldOfNameSurnameOnPersonalDetailEditingPopUpState state) =>
      state.fieldText == ''
          ? _findChosenNameSurname(context)
          : _findText(state);

  /// XXXXXXX this if condition can be deleted if there is any issue occurs XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  void _findNewNameSurname(BuildContext context, String value) {
    if (value.isNotEmpty) {
      _updateNameSurname(context, value);
    }
  }

  String _findExistingNameSurname(BuildContext context) => context
      .read<TextOfNameSurnameOnPersonalDetailEditingPopUpBloc>()
      .state
      .nameSurname!;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  void _checkWhetherPreviousNameSurnameIsChosen(
      bool checkPreviousState, BuildContext context) {
    if (checkPreviousState == false) {
      _getExistingNameSurname(context);
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
  BlocBuilder<TextFieldOfNameSurnameOnPersonalDetailEditingPopUpBloc,
          TextFieldOfNameSurnameOnPersonalDetailEditingPopUpState>
      _buildUpdatingButton(
    BuildContext context,
    bool checkPreviousState,
  ) =>
          BlocBuilder<TextFieldOfNameSurnameOnPersonalDetailEditingPopUpBloc,
              TextFieldOfNameSurnameOnPersonalDetailEditingPopUpState>(
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
          TextFieldOfNameSurnameOnPersonalDetailEditingPopUpState state,
          BuildContext context,
          bool checkPreviousState) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.update,
          textStyle: widget.buttonTextStyle,
          elevatedButtonWidth: _findButtonWidth,
          buttonColor: _appColors.secondary,
          onPressed: _checkWhetherNameSurnameIsCorrect(state)
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
        widget.textFieldOfNameSurnameOnPersonalDetailEditingPopUpBloc.add(
            TextFieldOfNameSurnameOnPersonalDetailEditingPopUpSubmit(
                _findPreviousNameSurname(dialogContext)));
        checkPreviousState = false;
      },
    );
  }

  void _clickUpdateButton(
    BuildContext dialogContext,
    TextFieldOfNameSurnameOnPersonalDetailEditingPopUpState state,
    bool checkPreviousState,
  ) {
    checkPreviousState = false;
    _closePopUp(dialogContext);
    dialogContext.read<TextOfNameSurnameOnPersonalDetailEditingPopUpBloc>().add(
        TextOfNameSurnameOnPersonalDetailEditingPopUpSubmit(_findText(state)));
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findPreviousNameSurname(BuildContext dialogContext) => dialogContext
      .read<TextOfNameSurnameOnPersonalDetailEditingPopUpBloc>()
      .state
      .nameSurname!;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherNameSurnameIsCorrect(
          TextFieldOfNameSurnameOnPersonalDetailEditingPopUpState state) =>
      _checkNameSurnameIsValid(state) ||
      _checkNameSurnameEnteredCorrectly(state);

  bool _checkNameSurnameEnteredCorrectly(
          TextFieldOfNameSurnameOnPersonalDetailEditingPopUpState state) =>
      state.formSubmissionOnNameSurnameEditingState.submissionSuccess == true;

  /// METHODS ==========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkNameSurnameIsValid(
          TextFieldOfNameSurnameOnPersonalDetailEditingPopUpState state) =>
      state.formSubmissionOnNameSurnameEditingState.isValid != false;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findText(
          TextFieldOfNameSurnameOnPersonalDetailEditingPopUpState state) =>
      state.fieldText!;

  String _findChosenNameSurname(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.nameSurname;

  double get _findButtonWidth => widget.screenWidth * 0.90 * 0.34;

  /// Screen Methods ---------------------------------------------------------------------------------------------------
  void _closePopUp(BuildContext dialogContext) {
    Navigator.of(dialogContext).pop();
  }
}
