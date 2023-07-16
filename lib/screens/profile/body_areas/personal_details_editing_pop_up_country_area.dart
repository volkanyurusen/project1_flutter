import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

class PersonalDetailsEditingPopUpCountryArea extends StatefulWidget {
  final DropdownOfCountryOnPersonalDetailEditingPopUpBloc
      dropdownOfCountryOnPersonalDetailEditingPopUpBloc;
  final double screenWidth;
  final TextStyle textfieldTextStyle;
  final TextStyle textLabelStyle;
  final TextStyle buttonTextStyle;
  final Color textColor;

  const PersonalDetailsEditingPopUpCountryArea({
    required this.dropdownOfCountryOnPersonalDetailEditingPopUpBloc,
    required this.screenWidth,
    required this.textfieldTextStyle,
    required this.textLabelStyle,
    required this.buttonTextStyle,
    required this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  State<PersonalDetailsEditingPopUpCountryArea> createState() =>
      _PersonalDetailsEditingPopUpCountryAreaState();
}

class _PersonalDetailsEditingPopUpCountryAreaState
    extends State<PersonalDetailsEditingPopUpCountryArea> {
  final AppColors _appColors = AppColors();
  final AppTextConstants _appTextConstants = AppTextConstants();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppVisualConstants _appVisualConstants = AppVisualConstants();

  @override
  void initState() {
    super.initState();
    context.read<TextOfCountryOnPersonalDetailEditingPopUpBloc>().add(
        TextOfCountryOnPersonalDetailEditingPopUpSubmit(context
            .read<UserBloc>()
            .state
            .userList
            .last
            .countryCity
            .country
            .countryDetail));
    context.read<DropdownOfCountryOnPersonalDetailEditingPopUpBloc>().add(
        DropdownOfCountryOnPersonalDetailEditingPopUpSubmit(context
            .read<UserBloc>()
            .state
            .userList
            .last
            .countryCity
            .country
            .countryDetail));
  }

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        _createCountryTitle(),
        _createShowDialogButton(context),
      ],
    );
  }

  /// TITLES ===========================================================================================================
  CustomTitle _createCountryTitle() =>
      const CustomTitle(spaceFromUpperWidget: 32, textLabel: 'Country');

  /// CREATE ===========================================================================================================
  GestureDetector _createShowDialogButton(BuildContext context) {
    return GestureDetector(
      child: _createCountryTextArea(),
      onTap: () {
        _openCountryDialog(context);
      },
    );
  }

  /// COUNTRY TEXT AREA ================================================================================================
  /// CREATE ===========================================================================================================
  AppHeader _createCountryTextArea() => AppHeader(
        firstWidget: _buildCountryTextArea(),
        // thirdWidget: Icon(Icons.edit, color: widget.textColor),
      );

  /// BUILD ============================================================================================================
  BlocBuilder<TextOfCountryOnPersonalDetailEditingPopUpBloc,
      TextOfCountryOnPersonalDetailEditingPopUpState> _buildCountryTextArea() {
    return BlocBuilder<TextOfCountryOnPersonalDetailEditingPopUpBloc,
        TextOfCountryOnPersonalDetailEditingPopUpState>(
      builder: (context, state) {
        _checkWhetherCountryIsEmptyOnText(state, context);
        return _displayCountryText(state);
      },
    );
  }

  /// DISPLAY ==========================================================================================================
  Expanded _displayCountryText(
      TextOfCountryOnPersonalDetailEditingPopUpState state) {
    return Expanded(
      child: AppHeaderText(
        textLabel: _findCountry(state),
        textStyle: widget.textfieldTextStyle,
      ),
    );
  }

  /// METHODS ==========================================================================================================
  void _getInitialCountry(BuildContext context) {
    context.read<DropdownOfCountryOnPersonalDetailEditingPopUpBloc>().add(
        DropdownOfCountryOnPersonalDetailEditingPopUpSubmit(
            _findPreviousChosenCountry(context)));
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  void _checkWhetherCountryIsEmptyOnText(
      TextOfCountryOnPersonalDetailEditingPopUpState state,
      BuildContext context) {
    if (state.country == '') {
      _getInitialCountry(context);
    }
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findCountry(TextOfCountryOnPersonalDetailEditingPopUpState state) =>
      state.country!.toCapitalized();

  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================

  /// COUNTRY TEXTFIELD AREA ===========================================================================================
  /// TEXTFIELD ========================================================================================================
  void _openCountryDialog(
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
        height: context.height * _appNumberConstants.kCountryDialogRatio,
        children: [
          const CustomAppSizedBox(),
          _buildCountryDropDownArea(),
          const Expanded(child: SizedBox()),
          _createBottomButtonArea(context),
          const CustomAppSizedBox(),
        ],
      );

  /// BUILD ============================================================================================================
  BlocBuilder<DropdownOfCountryOnPersonalDetailEditingPopUpBloc,
          DropdownOfCountryOnPersonalDetailEditingPopUpState>
      _buildCountryDropDownArea() => BlocBuilder<
              DropdownOfCountryOnPersonalDetailEditingPopUpBloc,
              DropdownOfCountryOnPersonalDetailEditingPopUpState>(
            builder: (context, state) {
              return _displayCountryDropDownBox(context, state);
            },
          );

  /// DISPLAY ==========================================================================================================
  //
  // BlocBuilder<CountryDynamicBloc, CountryDynamicState>
  InputDecorator _displayCountryDropDownBox(
    BuildContext context,
    DropdownOfCountryOnPersonalDetailEditingPopUpState state,
  ) =>
      //
      // BlocBuilder<CountryDynamicBloc, CountryDynamicState>(
      //   builder: (context, CountryState) {
      //     switch (CountryState.status) {
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
            labelText: 'Country',
            labelStyle: widget.textLabelStyle,
            border: const OutlineInputBorder(),
          ),
          child: _displayCountryDropdown(context, state));

  DropdownButton<String> _displayCountryDropdown(BuildContext context,
      DropdownOfCountryOnPersonalDetailEditingPopUpState state) {
    return DropdownButton<String>(
      underline: const SizedBox(),
      isExpanded: true,
      items: _findCountryItemList(context),
      value: _findInitialCountry(context, state),
      onChanged: (String? value) {
        _findNewCountry(context, value);
      },
    );
  }

  //
  //       case Status.failure:
  //         return StateError(error: CountryState.error);
  //     }
  //   },
  // );

  /// METHODS ==========================================================================================================
  //
  // void _getExistingCountry(BuildContext context) {
  //   context.read<DropdownOfCountryOnPersonalDetailEditingPopUpBloc>().add(
  //       DropdownOfCountryOnPersonalDetailEditingPopUpSubmit(
  //           _findCountry(context)));
  // }

  void _updateCountry(BuildContext context, String value) => context
      .read<DropdownOfCountryOnPersonalDetailEditingPopUpBloc>()
      .add(DropdownOfCountryOnPersonalDetailEditingPopUpSubmit(value));

  /// Find Methods -----------------------------------------------------------------------------------------------------
  List<DropdownMenuItem<String>> _findCountryItemList(BuildContext context) =>
      context
          .read<CountryDynamicBloc>()
          .state
          .countryDynamicList
          .map((item) => DropdownMenuItem<String>(
                value: item.countryDetail,
                child: AppHeaderText(
                    textLabel: item.countryDetail.toCapitalized(),
                    textStyle: widget.textfieldTextStyle),
              ))
          .toList();

  String _findInitialCountry(BuildContext context,
          DropdownOfCountryOnPersonalDetailEditingPopUpState state) =>
      state.fieldText == ''
          ? _findPreviousChosenCountry(context)
          : _findNewChosenCountry(state);

  /// XXXXXXX this if condition can be deleted if there is any issue occurs XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  void _findNewCountry(BuildContext context, String? value) {
    if (value!.isNotEmpty) {
      _updateCountry(context, value);
    }
  }

  // String _findCountry(BuildContext context) => context
  //     .read<TextOfCountryOnPersonalDetailEditingPopUpBloc>()
  //     .state
  //     .country!;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  // void _checkWhetherPreviousCountryIsChosen(
  //     bool checkPreviousState, BuildContext context) {
  //   if (checkPreviousState == false) {
  //     _getExistingCountry(context);
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
  BlocBuilder<DropdownOfCountryOnPersonalDetailEditingPopUpBloc,
      DropdownOfCountryOnPersonalDetailEditingPopUpState> _buildUpdatingButton(
          BuildContext context) =>
      BlocBuilder<DropdownOfCountryOnPersonalDetailEditingPopUpBloc,
          DropdownOfCountryOnPersonalDetailEditingPopUpState>(
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
    DropdownOfCountryOnPersonalDetailEditingPopUpState state,
  ) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.update,
          textStyle: widget.buttonTextStyle,
          elevatedButtonWidth: _findButtonWidth,
          buttonColor: _appColors.secondary,
          onPressed:
              // _checkWhetherCountryIsCorrect(state)
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
        widget.dropdownOfCountryOnPersonalDetailEditingPopUpBloc.add(
            DropdownOfCountryOnPersonalDetailEditingPopUpSubmit(
                _findPreviousCountry(dialogContext)));
      },
    );
  }

  void _clickUpdateButton(
    BuildContext dialogContext,
    DropdownOfCountryOnPersonalDetailEditingPopUpState state,
  ) {
    _closePopUp(dialogContext);
    dialogContext.read<TextOfCountryOnPersonalDetailEditingPopUpBloc>().add(
        TextOfCountryOnPersonalDetailEditingPopUpSubmit(
            _findNewChosenCountry(state)));
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findPreviousCountry(BuildContext dialogContext) => dialogContext
      .read<TextOfCountryOnPersonalDetailEditingPopUpBloc>()
      .state
      .country!;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  // bool _checkWhetherCountryIsCorrect(
  //         DropdownOfCountryOnPersonalDetailEditingPopUpState state) =>
  //     _checkCountryIsValid(state) || _checkCountryEnteredCorrectly(state);

  // bool _checkCountryEnteredCorrectly(
  //         DropdownOfCountryOnPersonalDetailEditingPopUpState state) =>
  //     state.formSubmissionOnCountryUpdatingState.submissionSuccess == true;

  /// METHODS ==========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
  // bool _checkCountryIsValid(
  //         DropdownOfCountryOnPersonalDetailEditingPopUpState state) =>
  //     state.formSubmissionOnCountryUpdatingState.isValid != false;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findNewChosenCountry(
          DropdownOfCountryOnPersonalDetailEditingPopUpState state) =>
      state.fieldText!;

  String _findPreviousChosenCountry(BuildContext context) => context
      .read<UserBloc>()
      .state
      .userList
      .last
      .countryCity
      .country
      .countryDetail;

  double get _findButtonWidth => widget.screenWidth * 0.90 * 0.34;

  /// Screen Methods ---------------------------------------------------------------------------------------------------
  void _closePopUp(BuildContext dialogContext) {
    Navigator.of(dialogContext).pop();
  }
}
