import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

class PersonalDetailsEditingPopUpGenderArea extends StatefulWidget {
  final DropdownOfGenderOnPersonalDetailEditingPopUpBloc
      dropdownOfGenderOnPersonalDetailEditingPopUpBloc;
  final double screenWidth;
  final TextStyle textfieldTextStyle;
  final TextStyle textLabelStyle;
  final TextStyle buttonTextStyle;
  final Color textColor;

  const PersonalDetailsEditingPopUpGenderArea({
    required this.dropdownOfGenderOnPersonalDetailEditingPopUpBloc,
    required this.screenWidth,
    required this.textfieldTextStyle,
    required this.textLabelStyle,
    required this.buttonTextStyle,
    required this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  State<PersonalDetailsEditingPopUpGenderArea> createState() =>
      _PersonalDetailsEditingPopUpGenderAreaState();
}

class _PersonalDetailsEditingPopUpGenderAreaState
    extends State<PersonalDetailsEditingPopUpGenderArea> {
  final AppColors _appColors = AppColors();
  final AppTextConstants _appTextConstants = AppTextConstants();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppVisualConstants _appVisualConstants = AppVisualConstants();

  @override
  void initState() {
    super.initState();
    context.read<TextOfGenderOnPersonalDetailEditingPopUpBloc>().add(
        TextOfGenderOnPersonalDetailEditingPopUpSubmit(
            context.read<UserBloc>().state.userList.last.gender.genderDetail));
    context.read<DropdownOfGenderOnPersonalDetailEditingPopUpBloc>().add(
        DropdownOfGenderOnPersonalDetailEditingPopUpSubmit(
            context.read<UserBloc>().state.userList.last.gender.genderDetail));
  }

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        _createGenderTitle(),
        _createShowDialogButton(context),
      ],
    );
  }

  /// TITLES ===========================================================================================================
  CustomTitle _createGenderTitle() =>
      const CustomTitle(spaceFromUpperWidget: 32, textLabel: 'Gender');

  /// CREATE ===========================================================================================================
  GestureDetector _createShowDialogButton(BuildContext context) {
    return GestureDetector(
      child: _createGenderTextArea(),
      onTap: () {
        _openGenderDialog(context);
      },
    );
  }

  /// GENDER TEXT AREA =================================================================================================
  /// CREATE ===========================================================================================================
  AppHeader _createGenderTextArea() => AppHeader(
        firstWidget: _buildGenderTextArea(),
        // thirdWidget: Icon(Icons.edit, color: widget.textColor),
      );

  /// BUILD ============================================================================================================
  BlocBuilder<TextOfGenderOnPersonalDetailEditingPopUpBloc,
      TextOfGenderOnPersonalDetailEditingPopUpState> _buildGenderTextArea() {
    return BlocBuilder<TextOfGenderOnPersonalDetailEditingPopUpBloc,
        TextOfGenderOnPersonalDetailEditingPopUpState>(
      builder: (context, state) {
        _checkWhetherGenderIsEmptyOnText(state, context);
        return _displayGenderText(state);
      },
    );
  }

  /// DISPLAY ==========================================================================================================
  Expanded _displayGenderText(
      TextOfGenderOnPersonalDetailEditingPopUpState state) {
    return Expanded(
      child: AppHeaderText(
        textLabel: _findGender(state),
        textStyle: widget.textfieldTextStyle,
      ),
    );
  }

  /// METHODS ==========================================================================================================
  void _getInitialGender(BuildContext context) {
    context.read<DropdownOfGenderOnPersonalDetailEditingPopUpBloc>().add(
        DropdownOfGenderOnPersonalDetailEditingPopUpSubmit(
            _findPreviousChosenGender(context)));
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  void _checkWhetherGenderIsEmptyOnText(
      TextOfGenderOnPersonalDetailEditingPopUpState state,
      BuildContext context) {
    if (state.gender == '') {
      _getInitialGender(context);
    }
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findGender(TextOfGenderOnPersonalDetailEditingPopUpState state) =>
      state.gender!.toCapitalized();

  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================

  /// GENDER DROPDOWN BOX AREA =========================================================================================
  /// TEXTFIELD ========================================================================================================
  void _openGenderDialog(
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
        height: context.height * _appNumberConstants.kGenderDialogRatio,
        children: [
          const CustomAppSizedBox(),
          _buildGenderDropDownArea(),
          const Expanded(child: SizedBox()),
          _createBottomButtonArea(context),
          const CustomAppSizedBox(),
        ],
      );

  /// BUILD ============================================================================================================
  BlocBuilder<DropdownOfGenderOnPersonalDetailEditingPopUpBloc,
          DropdownOfGenderOnPersonalDetailEditingPopUpState>
      _buildGenderDropDownArea() => BlocBuilder<
              DropdownOfGenderOnPersonalDetailEditingPopUpBloc,
              DropdownOfGenderOnPersonalDetailEditingPopUpState>(
            builder: (context, state) {
              return _displayGenderDropDownBox(context, state);
            },
          );

  /// DISPLAY ==========================================================================================================
  //
  // BlocBuilder<GenderDynamicBloc, GenderDynamicState>
  InputDecorator _displayGenderDropDownBox(
    BuildContext context,
    DropdownOfGenderOnPersonalDetailEditingPopUpState state,
  ) =>
      //
      // BlocBuilder<GenderDynamicBloc, GenderDynamicState>(
      //   builder: (context, genderState) {
      //     switch (genderState.status) {
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
            labelText: 'Gender',
            labelStyle: widget.textLabelStyle,
            border: const OutlineInputBorder(),
          ),
          child: _displayGenderDropdown(context, state));

  DropdownButton<String> _displayGenderDropdown(BuildContext context,
      DropdownOfGenderOnPersonalDetailEditingPopUpState state) {
    return DropdownButton<String>(
      underline: const SizedBox(),
      isExpanded: true,
      items: _findGenderItemList(context),
      value: _findInitialGender(context, state),
      onChanged: (String? value) {
        _findNewGender(context, value);
      },
    );
  }

  //
  //       case Status.failure:
  //         return StateError(error: genderState.error);
  //     }
  //   },
  // );

  /// METHODS ==========================================================================================================
  //
  // void _getExistingGender(BuildContext context) {
  //   context.read<DropdownOfGenderOnPersonalDetailEditingPopUpBloc>().add(
  //       DropdownOfGenderOnPersonalDetailEditingPopUpSubmit(
  //           _findGender(context)));
  // }

  void _updateGender(BuildContext context, String value) => context
      .read<DropdownOfGenderOnPersonalDetailEditingPopUpBloc>()
      .add(DropdownOfGenderOnPersonalDetailEditingPopUpSubmit(value));

  /// Find Methods -----------------------------------------------------------------------------------------------------
  List<DropdownMenuItem<String>> _findGenderItemList(BuildContext context) =>
      context
          .read<GenderDynamicBloc>()
          .state
          .genderDynamicList
          .map((item) => DropdownMenuItem<String>(
                value: item.genderDetail,
                child: AppHeaderText(
                    textLabel: item.genderDetail.toCapitalized(),
                    textStyle: widget.textfieldTextStyle),
              ))
          .toList();

  String _findInitialGender(BuildContext context,
          DropdownOfGenderOnPersonalDetailEditingPopUpState state) =>
      state.fieldText == ''
          ? _findPreviousChosenGender(context)
          : _findNewChosenGender(state);

  /// XXXXXXX this if condition can be deleted if there is any issue occurs XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  void _findNewGender(BuildContext context, String? value) {
    if (value!.isNotEmpty) {
      _updateGender(context, value);
    }
  }

  // String _findGender(BuildContext context) => context
  //     .read<TextOfGenderOnPersonalDetailEditingPopUpBloc>()
  //     .state
  //     .gender!;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  // void _checkWhetherPreviousGenderIsChosen(
  //     bool checkPreviousState, BuildContext context) {
  //   if (checkPreviousState == false) {
  //     _getExistingGender(context);
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
  BlocBuilder<DropdownOfGenderOnPersonalDetailEditingPopUpBloc,
      DropdownOfGenderOnPersonalDetailEditingPopUpState> _buildUpdatingButton(
          BuildContext context) =>
      BlocBuilder<DropdownOfGenderOnPersonalDetailEditingPopUpBloc,
          DropdownOfGenderOnPersonalDetailEditingPopUpState>(
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
    DropdownOfGenderOnPersonalDetailEditingPopUpState state,
  ) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.update,
          textStyle: widget.buttonTextStyle,
          elevatedButtonWidth: _findButtonWidth,
          buttonColor: _appColors.secondary,
          onPressed:
              // _checkWhetherGenderIsCorrect(state)
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
        widget.dropdownOfGenderOnPersonalDetailEditingPopUpBloc.add(
            DropdownOfGenderOnPersonalDetailEditingPopUpSubmit(
                _findPreviousGender(dialogContext)));
      },
    );
  }

  void _clickUpdateButton(
    BuildContext dialogContext,
    DropdownOfGenderOnPersonalDetailEditingPopUpState state,
  ) {
    _closePopUp(dialogContext);
    dialogContext.read<TextOfGenderOnPersonalDetailEditingPopUpBloc>().add(
        TextOfGenderOnPersonalDetailEditingPopUpSubmit(
            _findNewChosenGender(state)));
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findPreviousGender(BuildContext dialogContext) => dialogContext
      .read<TextOfGenderOnPersonalDetailEditingPopUpBloc>()
      .state
      .gender!;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  // bool _checkWhetherGenderIsCorrect(
  //         DropdownOfGenderOnPersonalDetailEditingPopUpState state) =>
  //     _checkGenderIsValid(state) || _checkGenderEnteredCorrectly(state);

  // bool _checkGenderEnteredCorrectly(
  //         DropdownOfGenderOnPersonalDetailEditingPopUpState state) =>
  //     state.formSubmissionOnGenderUpdatingState.submissionSuccess == true;

  /// METHODS ==========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
  // bool _checkGenderIsValid(
  //         DropdownOfGenderOnPersonalDetailEditingPopUpState state) =>
  //     state.formSubmissionOnGenderUpdatingState.isValid != false;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findNewChosenGender(
          DropdownOfGenderOnPersonalDetailEditingPopUpState state) =>
      state.fieldText!;

  String _findPreviousChosenGender(BuildContext context) => context
      .read<GenderDynamicBloc>()
      .state
      .genderDynamicList
      .where((element) =>
          element.genderId ==
          context.read<UserBloc>().state.userList.last.gender.genderId)
      .first
      .genderDetail;

  double get _findButtonWidth => widget.screenWidth * 0.90 * 0.34;

  /// Screen Methods ---------------------------------------------------------------------------------------------------
  void _closePopUp(BuildContext dialogContext) {
    Navigator.of(dialogContext).pop();
  }
}
