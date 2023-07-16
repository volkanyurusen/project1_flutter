import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

class PersonalDetailsEditingPopUpAddressArea extends StatefulWidget {
  final TextFieldOfAddressOnPersonalDetailEditingPopUpBloc
      textFieldOfAddressOnPersonalDetailEditingPopUpBloc;
  final double screenWidth;
  final TextStyle textfieldTextStyle;
  final TextStyle buttonTextStyle;
  final Color textColor;

  const PersonalDetailsEditingPopUpAddressArea({
    required this.textFieldOfAddressOnPersonalDetailEditingPopUpBloc,
    required this.screenWidth,
    required this.textfieldTextStyle,
    required this.buttonTextStyle,
    required this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  State<PersonalDetailsEditingPopUpAddressArea> createState() =>
      _PersonalDetailsEditingPopUpAddressAreaState();
}

class _PersonalDetailsEditingPopUpAddressAreaState
    extends State<PersonalDetailsEditingPopUpAddressArea> {
  final AppColors _appColors = AppColors();
  final AppTextConstants _appTextConstants = AppTextConstants();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();

  @override
  void initState() {
    super.initState();
    context.read<TextOfAddressOnPersonalDetailEditingPopUpBloc>().add(
        TextOfAddressOnPersonalDetailEditingPopUpSubmit(
            context.read<UserBloc>().state.userList.last.address));
    context.read<TextFieldOfAddressOnPersonalDetailEditingPopUpBloc>().add(
        TextFieldOfAddressOnPersonalDetailEditingPopUpSubmit(
            context.read<UserBloc>().state.userList.last.address));
  }

  @override
  Widget build(BuildContext context) {
    bool checkPreviousState = false;

    return CustomColumn(
      children: [
        _createAddressTitle(),
        _createShowDialogButton(context, checkPreviousState),
      ],
    );
  }

  /// TITLES ===========================================================================================================
  CustomTitle _createAddressTitle() =>
      const CustomTitle(spaceFromUpperWidget: 32, textLabel: 'Address');

  /// CREATE ===========================================================================================================
  GestureDetector _createShowDialogButton(
      BuildContext context, bool checkPreviousState) {
    return GestureDetector(
      child: _createAddressTextArea(checkPreviousState),
      onTap: () {
        _openAddressTextfieldDialog(context, checkPreviousState);
      },
    );
  }

  /// ADDRESS TEXT AREA ================================================================================================
  /// CREATE ===========================================================================================================
  AppHeader _createAddressTextArea(bool checkPreviousState) => AppHeader(
        firstWidget: _buildAddressTextArea(),
        // thirdWidget: Icon(Icons.edit, color: widget.textColor),
      );

  /// BUILD ============================================================================================================
  BlocBuilder<TextOfAddressOnPersonalDetailEditingPopUpBloc,
      TextOfAddressOnPersonalDetailEditingPopUpState> _buildAddressTextArea() {
    return BlocBuilder<TextOfAddressOnPersonalDetailEditingPopUpBloc,
        TextOfAddressOnPersonalDetailEditingPopUpState>(
      builder: (context, state) {
        _checkWhetherAddressIsEmptyOnText(state, context);
        return _displayAddressText(state);
      },
    );
  }

  /// DISPLAY ==========================================================================================================
  Expanded _displayAddressText(
      TextOfAddressOnPersonalDetailEditingPopUpState state) {
    return Expanded(
      child: AppHeaderText(
        textLabel: _findAddressText(state),
        textStyle: widget.textfieldTextStyle,
      ),
    );
  }

  /// METHODS ==========================================================================================================
  void _getInitialAddress(BuildContext context) {
    context.read<TextFieldOfAddressOnPersonalDetailEditingPopUpBloc>().add(
        TextFieldOfAddressOnPersonalDetailEditingPopUpSubmit(
            _findChosenAddress(context)));
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  void _checkWhetherAddressIsEmptyOnText(
      TextOfAddressOnPersonalDetailEditingPopUpState state,
      BuildContext context) {
    if (state.address == '') {
      _getInitialAddress(context);
    }
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findAddressText(
          TextOfAddressOnPersonalDetailEditingPopUpState state) =>
      state.address ?? '';

  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================

  /// Address TEXTFIELD AREA ==========================================================================================
  /// TEXTFIELD ========================================================================================================
  void _openAddressTextfieldDialog(
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
        height: context.height * _appNumberConstants.kAddressDialogRatio,
        children: [
          const CustomAppSizedBox(),
          _buildAddressTextField(checkPreviousState),
          const Expanded(child: SizedBox()),
          _createBottomButtonArea(context, checkPreviousState),
          const CustomAppSizedBox(),
        ],
      );

  /// BUILD ============================================================================================================
  BlocBuilder<TextFieldOfAddressOnPersonalDetailEditingPopUpBloc,
          TextFieldOfAddressOnPersonalDetailEditingPopUpState>
      _buildAddressTextField(
    bool checkPreviousState,
  ) =>
          BlocBuilder<TextFieldOfAddressOnPersonalDetailEditingPopUpBloc,
              TextFieldOfAddressOnPersonalDetailEditingPopUpState>(
            builder: (context, state) {
              _checkWhetherPreviousAddressIsChosen(checkPreviousState, context);
              checkPreviousState = true;
              return _displayAddressTextField(context, state);
            },
          );

  /// DISPLAY ==========================================================================================================
  NameTextField _displayAddressTextField(
    BuildContext context,
    TextFieldOfAddressOnPersonalDetailEditingPopUpState state,
  ) =>
      NameTextField(
          limitOfTextLenght: _appNumberConstants.kAddressLenghtLimit,
          isTextValid: _checkAddressIsValid(state),
          labelName: 'Address',
          errorMessage: _findCorrectErrorMessage(state),
          initialValue: _findInitialAddress(context, state),
          onChanged: (value) {
            _findNewAddress(context, value);
          });

  /// METHODS ==========================================================================================================
  void _getExistingAddress(BuildContext context) {
    context.read<TextFieldOfAddressOnPersonalDetailEditingPopUpBloc>().add(
        TextFieldOfAddressOnPersonalDetailEditingPopUpSubmit(
            _findAddress(context)));
  }

  void _updateAddress(BuildContext context, String value) => context
      .read<TextFieldOfAddressOnPersonalDetailEditingPopUpBloc>()
      .add(TextFieldOfAddressOnPersonalDetailEditingPopUpSubmit(value));

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findCorrectErrorMessage(
          TextFieldOfAddressOnPersonalDetailEditingPopUpState state) =>
      state.formSubmissionOnAddressEditingState.errorMessage;

  String _findInitialAddress(BuildContext context,
          TextFieldOfAddressOnPersonalDetailEditingPopUpState state) =>
      state.fieldText == '' ? _findChosenAddress(context) : _findText(state);

  /// XXXXXXX this if condition can be deleted if there is any issue occurs XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  void _findNewAddress(BuildContext context, String value) {
    if (value.isNotEmpty) {
      _updateAddress(context, value);
    }
  }

  String _findAddress(BuildContext context) => context
      .read<TextOfAddressOnPersonalDetailEditingPopUpBloc>()
      .state
      .address!;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  void _checkWhetherPreviousAddressIsChosen(
      bool checkPreviousState, BuildContext context) {
    if (checkPreviousState == false) {
      _getExistingAddress(context);
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
  BlocBuilder<TextFieldOfAddressOnPersonalDetailEditingPopUpBloc,
      TextFieldOfAddressOnPersonalDetailEditingPopUpState> _buildUpdatingButton(
    BuildContext context,
    bool checkPreviousState,
  ) =>
      BlocBuilder<TextFieldOfAddressOnPersonalDetailEditingPopUpBloc,
          TextFieldOfAddressOnPersonalDetailEditingPopUpState>(
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
          TextFieldOfAddressOnPersonalDetailEditingPopUpState state,
          BuildContext context,
          bool checkPreviousState) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.update,
          textStyle: widget.buttonTextStyle,
          elevatedButtonWidth: _findButtonWidth,
          buttonColor: _appColors.secondary,
          onPressed: _checkWhetherAddressIsCorrect(state)
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
        widget.textFieldOfAddressOnPersonalDetailEditingPopUpBloc.add(
            TextFieldOfAddressOnPersonalDetailEditingPopUpSubmit(
                _findPreviousAddress(dialogContext)));
        checkPreviousState = false;
      },
    );
  }

  void _clickUpdateButton(
    BuildContext dialogContext,
    TextFieldOfAddressOnPersonalDetailEditingPopUpState state,
    bool checkPreviousState,
  ) {
    checkPreviousState = false;
    _closePopUp(dialogContext);
    dialogContext
        .read<TextOfAddressOnPersonalDetailEditingPopUpBloc>()
        .add(TextOfAddressOnPersonalDetailEditingPopUpSubmit(_findText(state)));
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findPreviousAddress(BuildContext dialogContext) => dialogContext
      .read<TextOfAddressOnPersonalDetailEditingPopUpBloc>()
      .state
      .address!;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherAddressIsCorrect(
          TextFieldOfAddressOnPersonalDetailEditingPopUpState state) =>
      _checkAddressIsValid(state) || _checkAddressEnteredCorrectly(state);

  bool _checkAddressEnteredCorrectly(
          TextFieldOfAddressOnPersonalDetailEditingPopUpState state) =>
      state.formSubmissionOnAddressEditingState.submissionSuccess == true;

  /// METHODS ==========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkAddressIsValid(
          TextFieldOfAddressOnPersonalDetailEditingPopUpState state) =>
      state.formSubmissionOnAddressEditingState.isValid != false;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findText(TextFieldOfAddressOnPersonalDetailEditingPopUpState state) =>
      state.fieldText!;

  String _findChosenAddress(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.address;

  double get _findButtonWidth => widget.screenWidth * 0.90 * 0.34;

  /// Screen Methods ---------------------------------------------------------------------------------------------------
  void _closePopUp(BuildContext dialogContext) {
    Navigator.of(dialogContext).pop();
  }
}
