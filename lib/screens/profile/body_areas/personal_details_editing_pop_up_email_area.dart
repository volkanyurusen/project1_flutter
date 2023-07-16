import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

class PersonalDetailsEditingPopUpEmailArea extends StatefulWidget {
  final TextFieldOfEmailOnPersonalDetailEditingPopUpBloc
      textFieldOfEmailOnPersonalDetailEditingPopUpBloc;
  final double screenWidth;
  final TextStyle textfieldTextStyle;
  final TextStyle buttonTextStyle;
  final Color textColor;

  const PersonalDetailsEditingPopUpEmailArea({
    required this.textFieldOfEmailOnPersonalDetailEditingPopUpBloc,
    required this.screenWidth,
    required this.textfieldTextStyle,
    required this.buttonTextStyle,
    required this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  State<PersonalDetailsEditingPopUpEmailArea> createState() =>
      _PersonalDetailsEditingPopUpEmailAreaState();
}

class _PersonalDetailsEditingPopUpEmailAreaState
    extends State<PersonalDetailsEditingPopUpEmailArea> {
  final AppColors _appColors = AppColors();
  final AppTextConstants _appTextConstants = AppTextConstants();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  // final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<TextOfEmailOnPersonalDetailEditingPopUpBloc>().add(
        TextOfEmailOnPersonalDetailEditingPopUpSubmit(
            context.read<UserBloc>().state.userList.last.email));
    context.read<TextFieldOfEmailOnPersonalDetailEditingPopUpBloc>().add(
        TextFieldOfEmailOnPersonalDetailEditingPopUpSubmit(
            context.read<UserBloc>().state.userList.last.email));
  }

  @override
  Widget build(BuildContext context) {
    bool checkPreviousState = false;

    return CustomColumn(
      children: [
        _createEmailTitle(),
        _createShowDialogButton(context, checkPreviousState),
      ],
    );
  }

  /// TITLES ===========================================================================================================
  CustomTitle _createEmailTitle() =>
      const CustomTitle(spaceFromUpperWidget: 32, textLabel: 'Email');

  /// CREATE ===========================================================================================================
  GestureDetector _createShowDialogButton(
      BuildContext context, bool checkPreviousState) {
    return GestureDetector(
      child: _createEmailTextArea(checkPreviousState),
      onTap: () {
        _openEmailTextfieldDialog(context, checkPreviousState);
      },
    );
  }

  /// EMAIL TEXT AREA ==================================================================================================
  /// CREATE ===========================================================================================================
  AppHeader _createEmailTextArea(bool checkPreviousState) => AppHeader(
        firstWidget: _buildEmailTextArea(),
        // thirdWidget: Icon(Icons.edit, color: widget.textColor),
      );

  /// BUILD ============================================================================================================
  BlocBuilder<TextOfEmailOnPersonalDetailEditingPopUpBloc,
      TextOfEmailOnPersonalDetailEditingPopUpState> _buildEmailTextArea() {
    return BlocBuilder<TextOfEmailOnPersonalDetailEditingPopUpBloc,
        TextOfEmailOnPersonalDetailEditingPopUpState>(
      builder: (context, state) {
        _checkWhetherEmailIsEmptyOnText(state, context);
        return _displayEmailText(state);
      },
    );
  }

  /// DISPLAY ==========================================================================================================
  Expanded _displayEmailText(
      TextOfEmailOnPersonalDetailEditingPopUpState state) {
    return Expanded(
      child: AppHeaderText(
        textLabel: _findEmailText(state),
        textStyle: widget.textfieldTextStyle,
      ),
    );
  }

  /// METHODS ==========================================================================================================
  void _getInitialEmail(BuildContext context) {
    context.read<TextFieldOfEmailOnPersonalDetailEditingPopUpBloc>().add(
        TextFieldOfEmailOnPersonalDetailEditingPopUpSubmit(
            _findChosenEmail(context)));
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  void _checkWhetherEmailIsEmptyOnText(
      TextOfEmailOnPersonalDetailEditingPopUpState state,
      BuildContext context) {
    if (state.email == '') {
      _getInitialEmail(context);
    }
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findEmailText(TextOfEmailOnPersonalDetailEditingPopUpState state) =>
      state.email ?? '';

  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================

  /// EMAIL TEXTFIELD AREA =============================================================================================
  /// TEXTFIELD ========================================================================================================
  void _openEmailTextfieldDialog(
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
        height: context.height * _appNumberConstants.kEmailDialogRatio,
        children: [
          const CustomAppSizedBox(),
          _buildEmailTextField(checkPreviousState),
          const Expanded(child: SizedBox()),
          _createBottomButtonArea(context, checkPreviousState),
          const CustomAppSizedBox(),
        ],
      );

  /// BUILD ============================================================================================================
  BlocBuilder<TextFieldOfEmailOnPersonalDetailEditingPopUpBloc,
      TextFieldOfEmailOnPersonalDetailEditingPopUpState> _buildEmailTextField(
    bool checkPreviousState,
  ) =>
      BlocBuilder<TextFieldOfEmailOnPersonalDetailEditingPopUpBloc,
          TextFieldOfEmailOnPersonalDetailEditingPopUpState>(
        builder: (context, state) {
          _checkWhetherPreviousEmailIsChosen(checkPreviousState, context);
          checkPreviousState = true;
          return _displayEmailTextField(context, state);
        },
      );

  /// DISPLAY ==========================================================================================================
  NameTextField _displayEmailTextField(
    BuildContext context,
    TextFieldOfEmailOnPersonalDetailEditingPopUpState state,
  ) =>
      // Form(
      //     key: _formKey,
      //     child: TextFormField(
      //       initialValue: _findInitialEmail(context, state),
      //       style: context.textTheme.displaySmall!.copyWith(
      //           fontWeight: FontWeight.normal,
      //           color: _appColors.textColor.withOpacity(1.00)),
      //       autofocus: true,
      //       inputFormatters: [
      //         LengthLimitingTextInputFormatter(
      //             _appNumberConstants.kEmailLenghtLimit)
      //       ],
      //       textInputAction: TextInputAction.done,
      //       keyboardType: TextInputType.text,
      //       maxLines: null,
      //       decoration: InputDecoration(
      //         focusedBorder: _checkEmailIsValid(state)
      //             ? AppOutlineInputBorder.success
      //             : AppOutlineInputBorder.error,
      //         enabledBorder: AppOutlineInputBorder.enabled,
      //         labelText: 'Email',
      //         labelStyle: context.textTheme.headlineMedium!.copyWith(
      //           fontWeight: FontWeight.normal,
      //           color: _appColors.textColor,
      //         ),
      //       ),
      //       onChanged: (value) {
      //         _findNewEmail(context, value);
      //       },
      //       validator: (val) => state.formSubmissionOnEmailEditingState.isValid
      //           ? null
      //           : _findCorrectErrorMessage(state),
      //     ));

      NameTextField(
        limitOfTextLenght: _appNumberConstants.kEmailLenghtLimit,
        isTextValid: _checkEmailIsValid(state),
        labelName: 'Email',
        errorMessage: _findCorrectErrorMessage(state),
        initialValue: _findInitialEmail(context, state),
        inputFormatters: [
          LengthLimitingTextInputFormatter(
              _appNumberConstants.kEmailLenghtLimit)
        ],
        onChanged: (value) {
          _findNewEmail(context, value);
        },
        // validator: (val) {
        //   state.formSubmissionOnEmailEditingState.isValid
        //       ? null
        //       : _findCorrectErrorMessage(state);
        // },
      );

  /// METHODS ==========================================================================================================
  void _getExistingEmail(BuildContext context) {
    context.read<TextFieldOfEmailOnPersonalDetailEditingPopUpBloc>().add(
        TextFieldOfEmailOnPersonalDetailEditingPopUpSubmit(
            _findEmail(context)));
  }

  void _updateEmail(BuildContext context, String value) => context
      .read<TextFieldOfEmailOnPersonalDetailEditingPopUpBloc>()
      .add(TextFieldOfEmailOnPersonalDetailEditingPopUpSubmit(value));

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findCorrectErrorMessage(
          TextFieldOfEmailOnPersonalDetailEditingPopUpState state) =>
      state.formSubmissionOnEmailEditingState.errorMessage;

  String _findInitialEmail(BuildContext context,
          TextFieldOfEmailOnPersonalDetailEditingPopUpState state) =>
      state.fieldText == '' ? _findChosenEmail(context) : _findText(state);

  /// XXXXXXX this if condition can be deleted if there is any issue occurs XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  void _findNewEmail(BuildContext context, String value) {
    if (value.isNotEmpty) {
      _updateEmail(context, value);
    }
  }

  String _findEmail(BuildContext context) =>
      context.read<TextOfEmailOnPersonalDetailEditingPopUpBloc>().state.email!;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  void _checkWhetherPreviousEmailIsChosen(
      bool checkPreviousState, BuildContext context) {
    if (checkPreviousState == false) {
      _getExistingEmail(context);
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
  BlocBuilder<TextFieldOfEmailOnPersonalDetailEditingPopUpBloc,
      TextFieldOfEmailOnPersonalDetailEditingPopUpState> _buildUpdatingButton(
    BuildContext context,
    bool checkPreviousState,
  ) =>
      BlocBuilder<TextFieldOfEmailOnPersonalDetailEditingPopUpBloc,
          TextFieldOfEmailOnPersonalDetailEditingPopUpState>(
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
          TextFieldOfEmailOnPersonalDetailEditingPopUpState state,
          BuildContext context,
          bool checkPreviousState) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.update,
          textStyle: widget.buttonTextStyle,
          elevatedButtonWidth: _findButtonWidth,
          buttonColor: _appColors.secondary,
          onPressed:
              // if (_formKey.currentState!.validate()) {
              //   print(state.toString());
              //   _clickUpdateButton(context, state, checkPreviousState);
              // }
              _checkWhetherEmailIsCorrect(state)
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
        widget.textFieldOfEmailOnPersonalDetailEditingPopUpBloc.add(
            TextFieldOfEmailOnPersonalDetailEditingPopUpSubmit(
                _findPreviousEmail(dialogContext)));
        checkPreviousState = false;
      },
    );
  }

  void _clickUpdateButton(
    BuildContext dialogContext,
    TextFieldOfEmailOnPersonalDetailEditingPopUpState state,
    bool checkPreviousState,
  ) {
    checkPreviousState = false;
    _closePopUp(dialogContext);
    dialogContext
        .read<TextOfEmailOnPersonalDetailEditingPopUpBloc>()
        .add(TextOfEmailOnPersonalDetailEditingPopUpSubmit(_findText(state)));
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findPreviousEmail(BuildContext dialogContext) => dialogContext
      .read<TextOfEmailOnPersonalDetailEditingPopUpBloc>()
      .state
      .email!;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherEmailIsCorrect(
          TextFieldOfEmailOnPersonalDetailEditingPopUpState state) =>
      _checkEmailIsValid(state) || _checkEmailEnteredCorrectly(state);

  bool _checkEmailEnteredCorrectly(
          TextFieldOfEmailOnPersonalDetailEditingPopUpState state) =>
      state.formSubmissionOnEmailEditingState.submissionSuccess == true;

  /// METHODS ==========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkEmailIsValid(
          TextFieldOfEmailOnPersonalDetailEditingPopUpState state) =>
      state.formSubmissionOnEmailEditingState.isValid != false;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findText(TextFieldOfEmailOnPersonalDetailEditingPopUpState state) =>
      state.fieldText!;

  String _findChosenEmail(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.email;

  double get _findButtonWidth => widget.screenWidth * 0.90 * 0.34;

  /// Screen Methods ---------------------------------------------------------------------------------------------------
  void _closePopUp(BuildContext dialogContext) {
    Navigator.of(dialogContext).pop();
  }
}
