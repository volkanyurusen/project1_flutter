import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

class CoachingDetailsEditingPopUpExperienceYearArea extends StatefulWidget {
  final DropdownOfExperienceYearOnCoachingDetailEditingPopUpBloc
      dropdownOfExperienceYearOnCoachingDetailEditingPopUpBloc;
  final double screenWidth;
  final TextStyle textfieldTextStyle;
  final TextStyle textLabelStyle;
  final TextStyle buttonTextStyle;
  final Color textColor;

  const CoachingDetailsEditingPopUpExperienceYearArea({
    required this.dropdownOfExperienceYearOnCoachingDetailEditingPopUpBloc,
    required this.screenWidth,
    required this.textfieldTextStyle,
    required this.textLabelStyle,
    required this.buttonTextStyle,
    required this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  State<CoachingDetailsEditingPopUpExperienceYearArea> createState() =>
      _CoachingDetailsEditingPopUpExperienceYearAreaState();
}

class _CoachingDetailsEditingPopUpExperienceYearAreaState
    extends State<CoachingDetailsEditingPopUpExperienceYearArea> {
  final AppColors _appColors = AppColors();
  final AppTextConstants _appTextConstants = AppTextConstants();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppVisualConstants _appVisualConstants = AppVisualConstants();

  @override
  void initState() {
    super.initState();
    context.read<TextOfExperienceYearOnCoachingDetailEditingPopUpBloc>().add(
        TextOfExperienceYearOnCoachingDetailEditingPopUpSubmit(context
            .read<CoachBloc>()
            .state
            .coachList
            .last
            .coachingExperience
            .experienceYear));
    context
        .read<DropdownOfExperienceYearOnCoachingDetailEditingPopUpBloc>()
        .add(DropdownOfExperienceYearOnCoachingDetailEditingPopUpSubmit(context
            .read<CoachBloc>()
            .state
            .coachList
            .last
            .coachingExperience
            .experienceYear));
  }

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        _createExperienceYearTitle(),
        _createShowDialogButton(context),
      ],
    );
  }

  /// TITLES ===========================================================================================================
  CustomTitle _createExperienceYearTitle() =>
      const CustomTitle(spaceFromUpperWidget: 32, textLabel: 'Experience Year');

  /// CREATE ===========================================================================================================
  GestureDetector _createShowDialogButton(BuildContext context) {
    return GestureDetector(
      child: _createExperienceYearTextArea(),
      onTap: () {
        _openExperienceYearDialog(context);
      },
    );
  }

  /// EXPERIENCE TEXT AREA =============================================================================================
  /// CREATE ===========================================================================================================
  AppHeader _createExperienceYearTextArea() => AppHeader(
        firstWidget: _buildExperienceYearTextArea(),
        // thirdWidget: Icon(Icons.edit, color: widget.textColor),
      );

  /// BUILD ============================================================================================================
  BlocBuilder<TextOfExperienceYearOnCoachingDetailEditingPopUpBloc,
          TextOfExperienceYearOnCoachingDetailEditingPopUpState>
      _buildExperienceYearTextArea() {
    return BlocBuilder<TextOfExperienceYearOnCoachingDetailEditingPopUpBloc,
        TextOfExperienceYearOnCoachingDetailEditingPopUpState>(
      builder: (context, state) {
        _checkWhetherExperienceYearIsEmptyOnText(context, state);
        return _displayExperienceYearText(state);
      },
    );
  }

  /// DISPLAY ==========================================================================================================
  Expanded _displayExperienceYearText(
      TextOfExperienceYearOnCoachingDetailEditingPopUpState state) {
    return Expanded(
      child: AppHeaderText(
        textLabel: _findExperienceYear(state),
        textStyle: widget.textfieldTextStyle,
      ),
    );
  }

  /// METHODS ==========================================================================================================
  void _getInitialExperienceYear(BuildContext context) {
    context
        .read<DropdownOfExperienceYearOnCoachingDetailEditingPopUpBloc>()
        .add(DropdownOfExperienceYearOnCoachingDetailEditingPopUpSubmit(
            _findPreviousChosenExperienceYear(context)));
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  void _checkWhetherExperienceYearIsEmptyOnText(
    BuildContext context,
    TextOfExperienceYearOnCoachingDetailEditingPopUpState state,
  ) {
    if (state.experienceYear == '') {
      _getInitialExperienceYear(context);
    }
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findExperienceYear(
          TextOfExperienceYearOnCoachingDetailEditingPopUpState state) =>
      state.experienceYear!.toCapitalized();

  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================

  /// EXPERIENCE TEXTFIELD AREA ========================================================================================
  /// TEXTFIELD ========================================================================================================
  void _openExperienceYearDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (diaglogContext) => _createDialog(context),
    );
  }

  /// CREATE ===========================================================================================================
  PopUpBody _createDialog(
    BuildContext context,
  ) =>
      PopUpBody(
        height: context.height * _appNumberConstants.kExperienceYearDialogRatio,
        children: [
          const CustomAppSizedBox(),
          _buildExperienceDropDownYearArea(),
          const Expanded(child: SizedBox()),
          _createBottomButtonArea(context),
          const CustomAppSizedBox(),
        ],
      );

  /// BUILD ============================================================================================================
  BlocBuilder<DropdownOfExperienceYearOnCoachingDetailEditingPopUpBloc,
          DropdownOfExperienceYearOnCoachingDetailEditingPopUpState>
      _buildExperienceDropDownYearArea() => BlocBuilder<
              DropdownOfExperienceYearOnCoachingDetailEditingPopUpBloc,
              DropdownOfExperienceYearOnCoachingDetailEditingPopUpState>(
            builder: (context, state) {
              return _displayExperienceYearDropDownBox(context, state);
            },
          );

  /// DISPLAY ==========================================================================================================
  //
  // BlocBuilder<CoachingExperienceDynamicBloc, ExperienceDynamicState>
  InputDecorator _displayExperienceYearDropDownBox(
    BuildContext context,
    DropdownOfExperienceYearOnCoachingDetailEditingPopUpState state,
  ) =>
      //
      // BlocBuilder<CoachingExperienceDynamicBloc, ExperienceDynamicState>(
      //   builder: (context, ExperienceState) {
      //     switch (ExperienceState.status) {
      //       case Status.initial:
      //         return SkeltonContainer(
      //             height: 80,
      //             width: MediaQuery.of(context).size.width - 36);
      //       case Status.loading:
      //         return SkeltonContainer(
      //             height: 80,
      //             width: MediaQuery.of(context).size.width - 36);
      //       case Status.success:
      //         return
      InputDecorator(
          decoration: InputDecoration(
            contentPadding: _appVisualConstants.dropDownBoxPadding,
            labelText: 'Experience',
            labelStyle: widget.textLabelStyle,
            border: const OutlineInputBorder(),
          ),
          child: _displayExperienceYearDropdown(context, state));

  DropdownButton<String> _displayExperienceYearDropdown(BuildContext context,
      DropdownOfExperienceYearOnCoachingDetailEditingPopUpState state) {
    return DropdownButton<String>(
      underline: const SizedBox(),
      isExpanded: true,
      items: _findExperienceYearItemList(context),
      value: _findInitialExperienceYear(context, state),
      onChanged: (String? value) {
        _findNewExperienceYear(context, value);
      },
    );
  }

  //
  //       case Status.failure:
  //         return StateError(error: ExperienceState.error);
  //     }
  //   },
  // );

  /// METHODS ==========================================================================================================
  //
  // void _getExistingExperience(BuildContext context) {
  //   context.read<DropdownOfExperienceYearOnCoachingDetailEditingPopUpBloc>().add(
  //       DropdownOfExperienceYearOnCoachingDetailEditingPopUpSubmit(
  //           _findExperienceYear(context)));
  // }

  void _updateExperienceYear(BuildContext context, String value) => context
      .read<DropdownOfExperienceYearOnCoachingDetailEditingPopUpBloc>()
      .add(DropdownOfExperienceYearOnCoachingDetailEditingPopUpSubmit(value));

  /// Find Methods -----------------------------------------------------------------------------------------------------
  List<DropdownMenuItem<String>> _findExperienceYearItemList(
          BuildContext context) =>
      context
          .read<CoachingExperienceDynamicBloc>()
          .state
          .coachingExperienceDynamicList
          .map((item) => DropdownMenuItem<String>(
                value: item.experienceYear,
                child: AppHeaderText(
                    textLabel: item.experienceYear.toCapitalized(),
                    textStyle: widget.textfieldTextStyle),
              ))
          .toList();

  String _findInitialExperienceYear(BuildContext context,
          DropdownOfExperienceYearOnCoachingDetailEditingPopUpState state) =>
      state.fieldText == ''
          ? _findPreviousChosenExperienceYear(context)
          : _findNewChosenExperienceYear(state);

  /// XXXXXXX this if condition can be deleted if there is any issue occurs XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  void _findNewExperienceYear(BuildContext context, String? value) {
    if (value!.isNotEmpty) {
      _updateExperienceYear(context, value);
    }
  }

  // String _findExperienceYear(BuildContext context) => context
  //     .read<TextOfExperienceYearOnCoachingDetailEditingPopUpBloc>()
  //     .state
  //     .Experience!;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  // void _checkWhetherPreviousExperienceIsChosen(
  //     bool checkPreviousState, BuildContext context) {
  //   if (checkPreviousState == false) {
  //     _getExistingExperience(context);
  //   }
  // }

  /// BUTTONS ==========================================================================================================
  /// CREATE ===========================================================================================================
  CustomRow _createBottomButtonArea(
    BuildContext context,
  ) =>
      CustomRow(
        mainAxisSize: MainAxisSize.max,
        children: [
          _displayCancelButton(context),
          _buildUpdatingButton(context),
        ],
      );

  /// BUILD ============================================================================================================
  BlocBuilder<DropdownOfExperienceYearOnCoachingDetailEditingPopUpBloc,
          DropdownOfExperienceYearOnCoachingDetailEditingPopUpState>
      _buildUpdatingButton(BuildContext context) => BlocBuilder<
              DropdownOfExperienceYearOnCoachingDetailEditingPopUpBloc,
              DropdownOfExperienceYearOnCoachingDetailEditingPopUpState>(
            builder: (context, state) {
              return _displayUpdatingButton(context, state);
            },
          );

  /// DISPLAY ==========================================================================================================
  CustomElevatedButton _displayCancelButton(
    BuildContext context,
  ) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.cancel,
          textStyle: widget.buttonTextStyle,
          elevatedButtonWidth: _findButtonWidth,
          buttonColor: _appColors.buttonDarkColor,
          onPressed: () => _clickCancelButton(context));

  CustomElevatedButton _displayUpdatingButton(
    BuildContext context,
    DropdownOfExperienceYearOnCoachingDetailEditingPopUpState state,
  ) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.update,
          textStyle: widget.buttonTextStyle,
          elevatedButtonWidth: _findButtonWidth,
          buttonColor: _appColors.secondary,
          onPressed:
              // _checkWhetherExperienceIsCorrect(state)
              //     ?
              () => _clickUpdateButton(context, state)
          // : null,
          );

  /// METHODS ==========================================================================================================
  void _clickCancelButton(
    BuildContext dialogContext,
  ) {
    _closePopUp(dialogContext);
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        widget.dropdownOfExperienceYearOnCoachingDetailEditingPopUpBloc.add(
            DropdownOfExperienceYearOnCoachingDetailEditingPopUpSubmit(
                _findPreviousExperienceYear(dialogContext)));
      },
    );
  }

  void _clickUpdateButton(
    BuildContext dialogContext,
    DropdownOfExperienceYearOnCoachingDetailEditingPopUpState state,
  ) {
    _closePopUp(dialogContext);
    dialogContext
        .read<TextOfExperienceYearOnCoachingDetailEditingPopUpBloc>()
        .add(TextOfExperienceYearOnCoachingDetailEditingPopUpSubmit(
            _findNewChosenExperienceYear(state)));
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findPreviousExperienceYear(BuildContext dialogContext) =>
      dialogContext
          .read<TextOfExperienceYearOnCoachingDetailEditingPopUpBloc>()
          .state
          .experienceYear!;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  // bool _checkWhetherExperienceIsCorrect(
  //         DropdownOfExperienceYearOnCoachingDetailEditingPopUpState state) =>
  //     _checkExperienceIsValid(state) || _checkExperienceEnteredCorrectly(state);

  // bool _checkExperienceEnteredCorrectly(
  //         DropdownOfExperienceYearOnCoachingDetailEditingPopUpState state) =>
  //     state.formSubmissionOnExperienceUpdatingState.submissionSuccess == true;

  /// METHODS ==========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
  // bool _checkExperienceIsValid(
  //         DropdownOfExperienceYearOnCoachingDetailEditingPopUpState state) =>
  //     state.formSubmissionOnExperienceUpdatingState.isValid != false;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findNewChosenExperienceYear(
          DropdownOfExperienceYearOnCoachingDetailEditingPopUpState state) =>
      state.fieldText!;

  String _findPreviousChosenExperienceYear(BuildContext context) => context
      .read<CoachingExperienceDynamicBloc>()
      .state
      .coachingExperienceDynamicList
      .where((element) =>
          element.coachingExperienceId ==
          context
              .read<CoachBloc>()
              .state
              .coachList
              .last
              .coachingExperience
              .coachingExperienceId)
      .first
      .experienceYear;

  double get _findButtonWidth => widget.screenWidth * 0.90 * 0.34;

  /// Screen Methods ---------------------------------------------------------------------------------------------------
  void _closePopUp(BuildContext dialogContext) {
    Navigator.of(dialogContext).pop();
  }
}
