import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

class CoachingDetailsEditingPopUpMinLessonArea extends StatefulWidget {
  final TextFieldOfMinLessonOnCoachingDetailEditingPopUpBloc
      textFieldOfMinLessonOnCoachingDetailEditingPopUpBloc;
  final double screenWidth;
  final TextStyle textfieldTextStyle;
  final TextStyle buttonTextStyle;
  final Color textColor;

  const CoachingDetailsEditingPopUpMinLessonArea({
    required this.textFieldOfMinLessonOnCoachingDetailEditingPopUpBloc,
    required this.screenWidth,
    required this.textfieldTextStyle,
    required this.buttonTextStyle,
    required this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  State<CoachingDetailsEditingPopUpMinLessonArea> createState() =>
      _CoachingDetailsEditingPopUpMinLessonAreaState();
}

class _CoachingDetailsEditingPopUpMinLessonAreaState
    extends State<CoachingDetailsEditingPopUpMinLessonArea> {
  final AppColors _appColors = AppColors();
  final AppTextConstants _appTextConstants = AppTextConstants();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppFunctions _appFunctions = AppFunctions();

  @override
  void initState() {
    super.initState();
    context.read<TextOfMinLessonOnCoachingDetailEditingPopUpBloc>().add(
        TextOfMinLessonOnCoachingDetailEditingPopUpSubmit(context
            .read<CoachBloc>()
            .state
            .coachList
            .last
            .minLesson
            .toString()));
    context.read<TextFieldOfMinLessonOnCoachingDetailEditingPopUpBloc>().add(
        TextFieldOfMinLessonOnCoachingDetailEditingPopUpSubmit(
            context.read<CoachBloc>().state.coachList.last.minLesson));
  }

  @override
  Widget build(BuildContext context) {
    bool checkPreviousState = false;

    return CustomColumn(
      children: [
        _createMinLessonTitle(),
        _createShowDialogButton(context, checkPreviousState),
      ],
    );
  }

  /// TITLES ===========================================================================================================
  CustomTitle _createMinLessonTitle() =>
      const CustomTitle(spaceFromUpperWidget: 32, textLabel: 'MinLesson');

  /// CREATE ===========================================================================================================
  GestureDetector _createShowDialogButton(
    BuildContext context,
    bool checkPreviousState,
  ) =>
      GestureDetector(
        child: _createMinLessonTextArea(checkPreviousState),
        onTap: () {
          _openMinLessonTextfieldDialog(context, checkPreviousState);
        },
      );

  /// MinLesson TEXT AREA ==============================================================================================
  /// CREATE ===========================================================================================================
  AppHeader _createMinLessonTextArea(bool checkPreviousState) => AppHeader(
        firstWidget: _buildMinLessonTextArea(),
        // thirdWidget: Icon(Icons.edit, color: widget.textColor),
      );

  /// BUILD ============================================================================================================
  BlocBuilder<TextOfMinLessonOnCoachingDetailEditingPopUpBloc,
          TextOfMinLessonOnCoachingDetailEditingPopUpState>
      _buildMinLessonTextArea() {
    return BlocBuilder<TextOfMinLessonOnCoachingDetailEditingPopUpBloc,
        TextOfMinLessonOnCoachingDetailEditingPopUpState>(
      builder: (context, state) {
        _checkWhetherMinLessonIsEmptyOnText(context, state);
        return _displayMinLessonText(state);
      },
    );
  }

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayMinLessonText(
      TextOfMinLessonOnCoachingDetailEditingPopUpState state) {
    return AppHeaderText(
        textLabel: _findMinLesson(state), textStyle: widget.textfieldTextStyle);
  }

  /// METHODS ==========================================================================================================
  void _getInitialMinLesson(BuildContext context) {
    context.read<TextFieldOfMinLessonOnCoachingDetailEditingPopUpBloc>().add(
        TextFieldOfMinLessonOnCoachingDetailEditingPopUpSubmit(
            int.parse(_findFirstMinLesson(context))));
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  void _checkWhetherMinLessonIsEmptyOnText(BuildContext context,
      TextOfMinLessonOnCoachingDetailEditingPopUpState state) {
    if (state.minLesson == '') {
      _getInitialMinLesson(context);
    }
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findMinLesson(
          TextOfMinLessonOnCoachingDetailEditingPopUpState state) =>
      _appFunctions.showString(lenght: 16, state.minLesson ?? '');

  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================

  /// MinLesson TEXTFIELD AREA =========================================================================================
  /// TEXTFIELD ========================================================================================================
  void _openMinLessonTextfieldDialog(
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
        height: context.height * _appNumberConstants.kMinLessonDialogRatio,
        children: [
          const CustomAppSizedBox(),
          _buildBirtyearTextField(checkPreviousState),
          const Expanded(child: SizedBox()),
          _createBottomButtonArea(context, checkPreviousState),
          const CustomAppSizedBox(),
        ],
      );

  /// BUILD ============================================================================================================
  BlocBuilder<TextFieldOfMinLessonOnCoachingDetailEditingPopUpBloc,
          TextFieldOfMinLessonOnCoachingDetailEditingPopUpState>
      _buildBirtyearTextField(
    bool checkPreviousState,
  ) =>
          BlocBuilder<TextFieldOfMinLessonOnCoachingDetailEditingPopUpBloc,
              TextFieldOfMinLessonOnCoachingDetailEditingPopUpState>(
            builder: (context, state) {
              _checkWhetherPreviousMinLessonIsChosen(
                  checkPreviousState, context);
              checkPreviousState = true;
              return _displayMinLessonTextField(context, state);
            },
          );

  /// DISPLAY ==========================================================================================================
  NameTextField _displayMinLessonTextField(
    BuildContext context,
    TextFieldOfMinLessonOnCoachingDetailEditingPopUpState state,
  ) =>
      NameTextField(
          limitOfTextLenght: _appNumberConstants.kMinLessonDigitLimit,
          isTextValid: _checkMinLessonIsValid(state),
          labelName: 'MinLesson',
          keyboardType: TextInputType.number,
          errorMessage: _findCorrectErrorMessage(state),
          initialValue: _findInitialMinLesson(context, state),
          onChanged: (value) {
            _findNewMinLesson(context, value);
          },
          inputFormatters: [
            LengthLimitingTextInputFormatter(2),
            FilteringTextInputFormatter.digitsOnly,
          ]);

  /// METHODS ==========================================================================================================
  void _getExistingMinLesson(BuildContext context) {
    context.read<TextFieldOfMinLessonOnCoachingDetailEditingPopUpBloc>().add(
        TextFieldOfMinLessonOnCoachingDetailEditingPopUpSubmit(
            int.parse(_findExistingMinLesson(context))));
  }

  void _updateMinLesson(BuildContext context, String value) => context
      .read<TextFieldOfMinLessonOnCoachingDetailEditingPopUpBloc>()
      .add(TextFieldOfMinLessonOnCoachingDetailEditingPopUpSubmit(
          int.parse(value)));

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findCorrectErrorMessage(
          TextFieldOfMinLessonOnCoachingDetailEditingPopUpState state) =>
      state.formSubmissionOnMinLessonEditingState.errorMessage;

  String _findInitialMinLesson(BuildContext context,
          TextFieldOfMinLessonOnCoachingDetailEditingPopUpState state) =>
      state.fieldText == '' ? _findFirstMinLesson(context) : _findText(state);

  void _findNewMinLesson(BuildContext context, String value) {
    if (value.isNotEmpty) {
      _updateMinLesson(context, value);
    }
  }

  String _findExistingMinLesson(BuildContext context) => context
      .read<TextOfMinLessonOnCoachingDetailEditingPopUpBloc>()
      .state
      .minLesson!;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  void _checkWhetherPreviousMinLessonIsChosen(
      bool checkPreviousState, BuildContext context) {
    if (checkPreviousState == false) {
      _getExistingMinLesson(context);
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
  BlocBuilder<TextFieldOfMinLessonOnCoachingDetailEditingPopUpBloc,
          TextFieldOfMinLessonOnCoachingDetailEditingPopUpState>
      _buildUpdatingButton(
    BuildContext context,
    bool checkPreviousState,
  ) =>
          BlocBuilder<TextFieldOfMinLessonOnCoachingDetailEditingPopUpBloc,
              TextFieldOfMinLessonOnCoachingDetailEditingPopUpState>(
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
    TextFieldOfMinLessonOnCoachingDetailEditingPopUpState state,
    BuildContext context,
    bool checkPreviousState,
  ) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.update,
          textStyle: widget.buttonTextStyle,
          elevatedButtonWidth: _findButtonWidth,
          buttonColor: _appColors.secondary,
          onPressed: _checkWhetherMinLessonIsCorrect(state)
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
        widget.textFieldOfMinLessonOnCoachingDetailEditingPopUpBloc.add(
            TextFieldOfMinLessonOnCoachingDetailEditingPopUpSubmit(
                int.parse(_findPreviousMinLesson(dialogContext))));
        checkPreviousState = false;
      },
    );
  }

  void _clickUpdateButton(
    BuildContext dialogContext,
    TextFieldOfMinLessonOnCoachingDetailEditingPopUpState state,
    bool checkPreviousState,
  ) {
    checkPreviousState = false;
    _closePopUp(dialogContext);
    dialogContext.read<TextOfMinLessonOnCoachingDetailEditingPopUpBloc>().add(
        TextOfMinLessonOnCoachingDetailEditingPopUpSubmit(_findText(state)));
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findPreviousMinLesson(BuildContext dialogContext) => dialogContext
      .read<TextOfMinLessonOnCoachingDetailEditingPopUpBloc>()
      .state
      .minLesson!;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherMinLessonIsCorrect(
          TextFieldOfMinLessonOnCoachingDetailEditingPopUpState state) =>
      _checkMinLessonIsValid(state) || _checkMinLessonEnteredCorrectly(state);

  bool _checkMinLessonEnteredCorrectly(
          TextFieldOfMinLessonOnCoachingDetailEditingPopUpState state) =>
      state.formSubmissionOnMinLessonEditingState.submissionSuccess == true;

  /// METHODS ==========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkMinLessonIsValid(
          TextFieldOfMinLessonOnCoachingDetailEditingPopUpState state) =>
      state.formSubmissionOnMinLessonEditingState.isValid != false;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findText(
          TextFieldOfMinLessonOnCoachingDetailEditingPopUpState state) =>
      state.fieldText!;

  String _findFirstMinLesson(BuildContext context) =>
      context.read<CoachBloc>().state.coachList.last.minLesson.toString();

  double get _findButtonWidth => widget.screenWidth * 0.90 * 0.34;

  /// Screen Methods ---------------------------------------------------------------------------------------------------
  void _closePopUp(BuildContext dialogContext) {
    Navigator.of(dialogContext).pop();
  }
}
