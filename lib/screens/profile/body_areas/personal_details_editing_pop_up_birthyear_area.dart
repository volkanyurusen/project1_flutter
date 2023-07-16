import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

class PersonalDetailsEditingPopUpBirthYearArea extends StatefulWidget {
  final TextFieldOfBirthyearOnPersonalDetailEditingPopUpBloc
      textFieldOfBirthyearOnPersonalDetailEditingPopUpBloc;
  final double screenWidth;
  final TextStyle textfieldTextStyle;
  final TextStyle buttonTextStyle;
  final Color textColor;

  const PersonalDetailsEditingPopUpBirthYearArea({
    required this.textFieldOfBirthyearOnPersonalDetailEditingPopUpBloc,
    required this.screenWidth,
    required this.textfieldTextStyle,
    required this.buttonTextStyle,
    required this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  State<PersonalDetailsEditingPopUpBirthYearArea> createState() =>
      _PersonalDetailsEditingPopUpBirthYearAreaState();
}

class _PersonalDetailsEditingPopUpBirthYearAreaState
    extends State<PersonalDetailsEditingPopUpBirthYearArea> {
  final AppColors _appColors = AppColors();
  final AppTextConstants _appTextConstants = AppTextConstants();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppFunctions _appFunctions = AppFunctions();

  @override
  void initState() {
    super.initState();
    context.read<TextOfBirthyearOnPersonalDetailEditingPopUpBloc>().add(
        TextOfBirthyearOnPersonalDetailEditingPopUpSubmit(
            context.read<UserBloc>().state.userList.last.birthyear.toString()));
    context.read<TextFieldOfBirthyearOnPersonalDetailEditingPopUpBloc>().add(
        TextFieldOfBirthyearOnPersonalDetailEditingPopUpSubmit(
            context.read<UserBloc>().state.userList.last.birthyear));
  }

  @override
  Widget build(BuildContext context) {
    bool checkPreviousState = false;

    return CustomColumn(
      children: [
        _createBirthyearTitle(),
        _createShowDialogButton(context, checkPreviousState),
      ],
    );
  }

  /// TITLES ===========================================================================================================
  CustomTitle _createBirthyearTitle() =>
      const CustomTitle(spaceFromUpperWidget: 32, textLabel: 'Birthyear');

  /// CREATE ===========================================================================================================
  GestureDetector _createShowDialogButton(
    BuildContext context,
    bool checkPreviousState,
  ) =>
      GestureDetector(
        child: _createBirthyearTextArea(checkPreviousState),
        onTap: () {
          _openBirthyearTextfieldDialog(context, checkPreviousState);
        },
      );

  /// BIRTHYEAR TEXT AREA ==============================================================================================
  /// CREATE ===========================================================================================================
  AppHeader _createBirthyearTextArea(bool checkPreviousState) => AppHeader(
        firstWidget: _buildBirthyearTextArea(),
        // thirdWidget: Icon(Icons.edit, color: widget.textColor),
      );

  /// BUILD ============================================================================================================
  BlocBuilder<TextOfBirthyearOnPersonalDetailEditingPopUpBloc,
          TextOfBirthyearOnPersonalDetailEditingPopUpState>
      _buildBirthyearTextArea() {
    return BlocBuilder<TextOfBirthyearOnPersonalDetailEditingPopUpBloc,
        TextOfBirthyearOnPersonalDetailEditingPopUpState>(
      builder: (context, state) {
        _checkWhetherBirthyearIsEmptyOnText(context, state);
        return _displayBirthyearText(state);
      },
    );
  }

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayBirthyearText(
      TextOfBirthyearOnPersonalDetailEditingPopUpState state) {
    return AppHeaderText(
        textLabel: _findBirthyear(state), textStyle: widget.textfieldTextStyle);
  }

  /// METHODS ==========================================================================================================
  void _getInitialBirthyear(BuildContext context) {
    context.read<TextFieldOfBirthyearOnPersonalDetailEditingPopUpBloc>().add(
        TextFieldOfBirthyearOnPersonalDetailEditingPopUpSubmit(
            int.parse(_findFirstBirthyear(context))));
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  void _checkWhetherBirthyearIsEmptyOnText(BuildContext context,
      TextOfBirthyearOnPersonalDetailEditingPopUpState state) {
    if (state.birthyear == '') {
      _getInitialBirthyear(context);
    }
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findBirthyear(
          TextOfBirthyearOnPersonalDetailEditingPopUpState state) =>
      _appFunctions.showString(lenght: 16, state.birthyear ?? '');

  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================

  /// BIRTHYEAR TEXTFIELD AREA =========================================================================================
  /// TEXTFIELD ========================================================================================================
  void _openBirthyearTextfieldDialog(
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
        height: context.height * _appNumberConstants.kBirthyearDialogRatio,
        children: [
          const CustomAppSizedBox(),
          _buildBirtyearTextField(checkPreviousState),
          const Expanded(child: SizedBox()),
          _createBottomButtonArea(context, checkPreviousState),
          const CustomAppSizedBox(),
        ],
      );

  /// BUILD ============================================================================================================
  BlocBuilder<TextFieldOfBirthyearOnPersonalDetailEditingPopUpBloc,
          TextFieldOfBirthyearOnPersonalDetailEditingPopUpState>
      _buildBirtyearTextField(
    bool checkPreviousState,
  ) =>
          BlocBuilder<TextFieldOfBirthyearOnPersonalDetailEditingPopUpBloc,
              TextFieldOfBirthyearOnPersonalDetailEditingPopUpState>(
            builder: (context, state) {
              _checkWhetherPreviousBirthyearIsChosen(
                  checkPreviousState, context);
              checkPreviousState = true;
              return _displayBirthyearTextField(context, state);
            },
          );

  /// DISPLAY ==========================================================================================================
  NameTextField _displayBirthyearTextField(
    BuildContext context,
    TextFieldOfBirthyearOnPersonalDetailEditingPopUpState state,
  ) =>
      NameTextField(
          limitOfTextLenght: _appNumberConstants.kBirthyearDigitLimit,
          isTextValid: _checkBirthyearIsValid(state),
          labelName: 'Birthyear',
          keyboardType: TextInputType.number,
          errorMessage: _findCorrectErrorMessage(state),
          initialValue: _findInitialBirthyear(context, state),
          onChanged: (value) {
            _findNewBirthyear(context, value);
          },
          inputFormatters: [
            LengthLimitingTextInputFormatter(4),
            FilteringTextInputFormatter.digitsOnly,
          ]);

  /// METHODS ==========================================================================================================
  void _getExistingBirthyear(BuildContext context) {
    context.read<TextFieldOfBirthyearOnPersonalDetailEditingPopUpBloc>().add(
        TextFieldOfBirthyearOnPersonalDetailEditingPopUpSubmit(
            int.parse(_findExistingBirthyear(context))));
  }

  void _updateBirthyear(BuildContext context, String value) => context
      .read<TextFieldOfBirthyearOnPersonalDetailEditingPopUpBloc>()
      .add(TextFieldOfBirthyearOnPersonalDetailEditingPopUpSubmit(
          int.parse(value)));

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findCorrectErrorMessage(
          TextFieldOfBirthyearOnPersonalDetailEditingPopUpState state) =>
      state.formSubmissionOnBirthyearEditingState.errorMessage;

  String _findInitialBirthyear(BuildContext context,
          TextFieldOfBirthyearOnPersonalDetailEditingPopUpState state) =>
      state.fieldText == '' ? _findFirstBirthyear(context) : _findText(state);

  void _findNewBirthyear(BuildContext context, String value) {
    if (value.isNotEmpty) {
      _updateBirthyear(context, value);
    }
  }

  String _findExistingBirthyear(BuildContext context) => context
      .read<TextOfBirthyearOnPersonalDetailEditingPopUpBloc>()
      .state
      .birthyear!;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  void _checkWhetherPreviousBirthyearIsChosen(
      bool checkPreviousState, BuildContext context) {
    if (checkPreviousState == false) {
      _getExistingBirthyear(context);
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
  BlocBuilder<TextFieldOfBirthyearOnPersonalDetailEditingPopUpBloc,
          TextFieldOfBirthyearOnPersonalDetailEditingPopUpState>
      _buildUpdatingButton(
    BuildContext context,
    bool checkPreviousState,
  ) =>
          BlocBuilder<TextFieldOfBirthyearOnPersonalDetailEditingPopUpBloc,
              TextFieldOfBirthyearOnPersonalDetailEditingPopUpState>(
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
          onPressed: () {
            _clickCancelButton(context, checkPreviousState);
          });

  CustomElevatedButton _displayUpdatingButton(
    TextFieldOfBirthyearOnPersonalDetailEditingPopUpState state,
    BuildContext context,
    bool checkPreviousState,
  ) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.update,
          textStyle: widget.buttonTextStyle,
          elevatedButtonWidth: _findButtonWidth,
          buttonColor: _appColors.secondary,
          onPressed: _checkWhetherBirthyearIsCorrect(state)
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
        widget.textFieldOfBirthyearOnPersonalDetailEditingPopUpBloc.add(
            TextFieldOfBirthyearOnPersonalDetailEditingPopUpSubmit(
                int.parse(_findPreviousBirthyear(dialogContext))));
        checkPreviousState = false;
      },
    );
  }

  void _clickUpdateButton(
    BuildContext dialogContext,
    TextFieldOfBirthyearOnPersonalDetailEditingPopUpState state,
    bool checkPreviousState,
  ) {
    checkPreviousState = false;
    _closePopUp(dialogContext);
    dialogContext.read<TextOfBirthyearOnPersonalDetailEditingPopUpBloc>().add(
        TextOfBirthyearOnPersonalDetailEditingPopUpSubmit(_findText(state)));
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findPreviousBirthyear(BuildContext dialogContext) => dialogContext
      .read<TextOfBirthyearOnPersonalDetailEditingPopUpBloc>()
      .state
      .birthyear!;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherBirthyearIsCorrect(
          TextFieldOfBirthyearOnPersonalDetailEditingPopUpState state) =>
      _checkBirthyearIsValid(state) || _checkBirthyearEnteredCorrectly(state);

  bool _checkBirthyearEnteredCorrectly(
          TextFieldOfBirthyearOnPersonalDetailEditingPopUpState state) =>
      state.formSubmissionOnBirthyearEditingState.submissionSuccess == true;

  /// METHODS ==========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkBirthyearIsValid(
          TextFieldOfBirthyearOnPersonalDetailEditingPopUpState state) =>
      state.formSubmissionOnBirthyearEditingState.isValid != false;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findText(
          TextFieldOfBirthyearOnPersonalDetailEditingPopUpState state) =>
      state.fieldText!;

  String _findFirstBirthyear(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.birthyear.toString();

  double get _findButtonWidth => widget.screenWidth * 0.90 * 0.34;

  /// Screen Methods ---------------------------------------------------------------------------------------------------
  void _closePopUp(BuildContext dialogContext) {
    Navigator.of(dialogContext).pop();
  }
}
