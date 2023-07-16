import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

class CoachingDetailsEditingPopUpPerLessonPriceArea extends StatefulWidget {
  final TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpBloc
      textFieldOfPerLessonPriceOnCoachingDetailEditingPopUpBloc;
  final double screenWidth;
  final TextStyle textfieldTextStyle;
  final TextStyle buttonTextStyle;
  final Color textColor;

  const CoachingDetailsEditingPopUpPerLessonPriceArea({
    required this.textFieldOfPerLessonPriceOnCoachingDetailEditingPopUpBloc,
    required this.screenWidth,
    required this.textfieldTextStyle,
    required this.buttonTextStyle,
    required this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  State<CoachingDetailsEditingPopUpPerLessonPriceArea> createState() =>
      _CoachingDetailsEditingPopUpPerLessonPriceAreaState();
}

class _CoachingDetailsEditingPopUpPerLessonPriceAreaState
    extends State<CoachingDetailsEditingPopUpPerLessonPriceArea> {
  final AppColors _appColors = AppColors();
  final AppTextConstants _appTextConstants = AppTextConstants();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppFunctions _appFunctions = AppFunctions();

  @override
  void initState() {
    super.initState();
    context.read<TextOfPerLessonPriceOnCoachingDetailEditingPopUpBloc>().add(
        TextOfPerLessonPriceOnCoachingDetailEditingPopUpSubmit(context
            .read<CoachBloc>()
            .state
            .coachList
            .last
            .perLessonPrice
            .toString()));
    context
        .read<TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpBloc>()
        .add(TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpSubmit(
            context.read<CoachBloc>().state.coachList.last.perLessonPrice));
  }

  @override
  Widget build(BuildContext context) {
    bool checkPreviousState = false;

    return CustomColumn(
      children: [
        _createPerLessonPriceTitle(),
        _createShowDialogButton(context, checkPreviousState),
        const CustomAppSizedBox(height: 30),
      ],
    );
  }

  /// TITLES ===========================================================================================================
  CustomTitle _createPerLessonPriceTitle() => const CustomTitle(
      spaceFromUpperWidget: 32, textLabel: 'Price (per lesson)');

  /// CREATE ===========================================================================================================
  GestureDetector _createShowDialogButton(
    BuildContext context,
    bool checkPreviousState,
  ) =>
      GestureDetector(
        child: _createPerLessonPriceTextArea(checkPreviousState),
        onTap: () {
          _openPerLessonPriceTextfieldDialog(context, checkPreviousState);
        },
      );

  /// PRICE TEXT AREA ==================================================================================================
  /// CREATE ===========================================================================================================
  AppHeader _createPerLessonPriceTextArea(bool checkPreviousState) => AppHeader(
        firstWidget: _buildPerLessonPriceTextArea(),
        // thirdWidget: Icon(Icons.edit, color: widget.textColor),
      );

  /// BUILD ============================================================================================================
  BlocBuilder<TextOfPerLessonPriceOnCoachingDetailEditingPopUpBloc,
          TextOfPerLessonPriceOnCoachingDetailEditingPopUpState>
      _buildPerLessonPriceTextArea() {
    return BlocBuilder<TextOfPerLessonPriceOnCoachingDetailEditingPopUpBloc,
        TextOfPerLessonPriceOnCoachingDetailEditingPopUpState>(
      builder: (context, state) {
        _checkWhetherPerLessonPriceIsEmptyOnText(context, state);
        return _displayPerLessonPriceText(state);
      },
    );
  }

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayPerLessonPriceText(
      TextOfPerLessonPriceOnCoachingDetailEditingPopUpState state) {
    return AppHeaderText(
        textLabel: _findPerLessonPrice(state),
        textStyle: widget.textfieldTextStyle);
  }

  /// METHODS ==========================================================================================================
  void _getInitialPerLessonPrice(BuildContext context) {
    context
        .read<TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpBloc>()
        .add(TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpSubmit(
            int.parse(_findFirstPerLessonPrice(context))));
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  void _checkWhetherPerLessonPriceIsEmptyOnText(BuildContext context,
      TextOfPerLessonPriceOnCoachingDetailEditingPopUpState state) {
    if (state.perLessonPrice == '') {
      _getInitialPerLessonPrice(context);
    }
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findPerLessonPrice(
          TextOfPerLessonPriceOnCoachingDetailEditingPopUpState state) =>
      _appFunctions.showString(lenght: 16, state.perLessonPrice ?? '');

  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================

  /// Price TEXTFIELD AREA =========================================================================================
  /// TEXTFIELD ========================================================================================================
  void _openPerLessonPriceTextfieldDialog(
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
        height: context.height * _appNumberConstants.kPerLessonPriceDialogRatio,
        children: [
          const CustomAppSizedBox(),
          _buildPerLessonPriceTextField(checkPreviousState),
          const Expanded(child: SizedBox()),
          _createBottomButtonArea(context, checkPreviousState),
          const CustomAppSizedBox(),
        ],
      );

  /// BUILD ============================================================================================================
  BlocBuilder<TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpBloc,
          TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpState>
      _buildPerLessonPriceTextField(
    bool checkPreviousState,
  ) =>
          BlocBuilder<TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpBloc,
              TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpState>(
            builder: (context, state) {
              _checkWhetherPreviousPerLessonPriceIsChosen(
                  checkPreviousState, context);
              checkPreviousState = true;
              return _displayPerLessonPriceTextField(context, state);
            },
          );

  /// DISPLAY ==========================================================================================================
  NameTextField _displayPerLessonPriceTextField(
    BuildContext context,
    TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpState state,
  ) =>
      NameTextField(
          limitOfTextLenght: _appNumberConstants.kPerLessonPriceMaxDigitLimit,
          isTextValid: _checkPerLessonPriceIsValid(state),
          labelName: 'Price',
          keyboardType: TextInputType.number,
          errorMessage: _findCorrectErrorMessage(state),
          initialValue: _findInitialPerLessonPrice(context, state),
          onChanged: (value) {
            _findNewPerLessonPrice(context, value);
          },
          inputFormatters: [
            LengthLimitingTextInputFormatter(4),
            FilteringTextInputFormatter.digitsOnly,
          ]);

  /// METHODS ==========================================================================================================
  void _getExistingPerLessonPrice(BuildContext context) {
    context
        .read<TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpBloc>()
        .add(TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpSubmit(
            int.parse(_findExistingPerLessonPrice(context))));
  }

  void _updatePerLessonPrice(BuildContext context, String value) => context
      .read<TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpBloc>()
      .add(TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpSubmit(
          int.parse(value)));

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findCorrectErrorMessage(
          TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpState state) =>
      state.formSubmissionOnPerLessonPriceEditingState.errorMessage;

  String _findInitialPerLessonPrice(BuildContext context,
          TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpState state) =>
      state.fieldText == ''
          ? _findFirstPerLessonPrice(context)
          : _findText(state);

  void _findNewPerLessonPrice(BuildContext context, String value) {
    if (value.isNotEmpty) {
      _updatePerLessonPrice(context, value);
    }
  }

  String _findExistingPerLessonPrice(BuildContext context) => context
      .read<TextOfPerLessonPriceOnCoachingDetailEditingPopUpBloc>()
      .state
      .perLessonPrice!;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  void _checkWhetherPreviousPerLessonPriceIsChosen(
      bool checkPreviousState, BuildContext context) {
    if (checkPreviousState == false) {
      _getExistingPerLessonPrice(context);
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
  BlocBuilder<TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpBloc,
          TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpState>
      _buildUpdatingButton(
    BuildContext context,
    bool checkPreviousState,
  ) =>
          BlocBuilder<TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpBloc,
              TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpState>(
            builder: (context, state) {
              return _displayUpdatingButton(context, state, checkPreviousState);
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
    BuildContext context,
    TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpState state,
    bool checkPreviousState,
  ) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.update,
          textStyle: widget.buttonTextStyle,
          elevatedButtonWidth: _findButtonWidth,
          buttonColor: _appColors.secondary,
          onPressed: _checkWhetherPerLessonPriceIsCorrect(state)
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
        widget.textFieldOfPerLessonPriceOnCoachingDetailEditingPopUpBloc.add(
            TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpSubmit(
                int.parse(_findPreviousPerLessonPrice(dialogContext))));
        checkPreviousState = false;
      },
    );
  }

  void _clickUpdateButton(
    BuildContext dialogContext,
    TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpState state,
    bool checkPreviousState,
  ) {
    checkPreviousState = false;
    _closePopUp(dialogContext);
    dialogContext
        .read<TextOfPerLessonPriceOnCoachingDetailEditingPopUpBloc>()
        .add(TextOfPerLessonPriceOnCoachingDetailEditingPopUpSubmit(
            _findText(state)));
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findPreviousPerLessonPrice(BuildContext dialogContext) =>
      dialogContext
          .read<TextOfPerLessonPriceOnCoachingDetailEditingPopUpBloc>()
          .state
          .perLessonPrice!;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherPerLessonPriceIsCorrect(
          TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpState state) =>
      _checkPerLessonPriceIsValid(state) || _checkPriceEnteredCorrectly(state);

  bool _checkPriceEnteredCorrectly(
          TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpState state) =>
      state.formSubmissionOnPerLessonPriceEditingState.submissionSuccess ==
      true;

  /// METHODS ==========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkPerLessonPriceIsValid(
          TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpState state) =>
      state.formSubmissionOnPerLessonPriceEditingState.isValid != false;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findText(
          TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpState state) =>
      state.fieldText!;

  String _findFirstPerLessonPrice(BuildContext context) =>
      context.read<CoachBloc>().state.coachList.last.perLessonPrice.toString();

  double get _findButtonWidth => widget.screenWidth * 0.90 * 0.34;

  /// Screen Methods ---------------------------------------------------------------------------------------------------
  void _closePopUp(BuildContext dialogContext) {
    Navigator.of(dialogContext).pop();
  }
}
