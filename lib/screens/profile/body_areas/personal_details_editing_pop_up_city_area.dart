import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

class PersonalDetailsEditingPopUpCityArea extends StatefulWidget {
  final DropdownOfCityOnPersonalDetailEditingPopUpBloc
      dropdownOfCityOnPersonalDetailEditingPopUpBloc;
  final double screenWidth;
  final TextStyle textfieldTextStyle;
  final TextStyle textLabelStyle;
  final TextStyle buttonTextStyle;
  final Color textColor;

  const PersonalDetailsEditingPopUpCityArea({
    required this.dropdownOfCityOnPersonalDetailEditingPopUpBloc,
    required this.screenWidth,
    required this.textfieldTextStyle,
    required this.textLabelStyle,
    required this.buttonTextStyle,
    required this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  State<PersonalDetailsEditingPopUpCityArea> createState() =>
      _PersonalDetailsEditingPopUpCityAreaState();
}

class _PersonalDetailsEditingPopUpCityAreaState
    extends State<PersonalDetailsEditingPopUpCityArea> {
  final AppColors _appColors = AppColors();
  final AppTextConstants _appTextConstants = AppTextConstants();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppVisualConstants _appVisualConstants = AppVisualConstants();

  @override
  void initState() {
    super.initState();
    context.read<TextOfCityOnPersonalDetailEditingPopUpBloc>().add(
        TextOfCityOnPersonalDetailEditingPopUpSubmit(context
            .read<UserBloc>()
            .state
            .userList
            .last
            .countryCity
            .city
            .cityDetail));
    context.read<DropdownOfCityOnPersonalDetailEditingPopUpBloc>().add(
        DropdownOfCityOnPersonalDetailEditingPopUpSubmit(context
            .read<UserBloc>()
            .state
            .userList
            .last
            .countryCity
            .city
            .cityDetail));
  }

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        _createCityTitle(),
        _createShowDialogButton(context),
      ],
    );
  }

  /// TITLES ===========================================================================================================
  CustomTitle _createCityTitle() =>
      const CustomTitle(spaceFromUpperWidget: 32, textLabel: 'City');

  /// CREATE ===========================================================================================================
  GestureDetector _createShowDialogButton(BuildContext context) {
    return GestureDetector(
      child: _createCityTextArea(),
      onTap: () {
        _openCityDialog(context);
      },
    );
  }

  /// CITY TEXT AREA ===================================================================================================
  /// CREATE ===========================================================================================================
  AppHeader _createCityTextArea() => AppHeader(
        firstWidget: _buildCityTextArea(),
        // thirdWidget: Icon(Icons.edit, color: widget.textColor),
      );

  /// BUILD ============================================================================================================
  BlocBuilder<TextOfCityOnPersonalDetailEditingPopUpBloc,
      TextOfCityOnPersonalDetailEditingPopUpState> _buildCityTextArea() {
    return BlocBuilder<TextOfCityOnPersonalDetailEditingPopUpBloc,
        TextOfCityOnPersonalDetailEditingPopUpState>(
      builder: (context, state) {
        _checkWhetherCityIsEmptyOnText(state, context);
        return _displayCityText(state);
      },
    );
  }

  /// DISPLAY ==========================================================================================================
  Expanded _displayCityText(TextOfCityOnPersonalDetailEditingPopUpState state) {
    return Expanded(
      child: AppHeaderText(
        textLabel: _findCity(state),
        textStyle: widget.textfieldTextStyle,
      ),
    );
  }

  /// METHODS ==========================================================================================================
  void _getInitialCity(BuildContext context) {
    context.read<DropdownOfCityOnPersonalDetailEditingPopUpBloc>().add(
        DropdownOfCityOnPersonalDetailEditingPopUpSubmit(
            _findPreviousChosenCity(context)));
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  void _checkWhetherCityIsEmptyOnText(
      TextOfCityOnPersonalDetailEditingPopUpState state, BuildContext context) {
    if (state.city == '') {
      _getInitialCity(context);
    }
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findCity(TextOfCityOnPersonalDetailEditingPopUpState state) =>
      state.city!.toCapitalized();

  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================

  /// CITY TEXTFIELD AREA ==============================================================================================
  /// TEXTFIELD ========================================================================================================
  void _openCityDialog(
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
        height: context.height * _appNumberConstants.kCityDialogRatio,
        children: [
          const CustomAppSizedBox(),
          _buildCityDropDownArea(),
          const Expanded(child: SizedBox()),
          _createBottomButtonArea(context),
          const CustomAppSizedBox(),
        ],
      );

  /// BUILD ============================================================================================================
  BlocBuilder<DropdownOfCityOnPersonalDetailEditingPopUpBloc,
          DropdownOfCityOnPersonalDetailEditingPopUpState>
      _buildCityDropDownArea() => BlocBuilder<
              DropdownOfCityOnPersonalDetailEditingPopUpBloc,
              DropdownOfCityOnPersonalDetailEditingPopUpState>(
            builder: (context, state) {
              return _displayCityDropDownBox(context, state);
            },
          );

  /// DISPLAY ==========================================================================================================
  //
  // BlocBuilder<CityDynamicBloc, CityDynamicState>
  InputDecorator _displayCityDropDownBox(
    BuildContext context,
    DropdownOfCityOnPersonalDetailEditingPopUpState state,
  ) =>
      //
      // BlocBuilder<CityDynamicBloc, CityDynamicState>(
      //   builder: (context, CityState) {
      //     switch (CityState.status) {
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
            labelText: 'City',
            labelStyle: widget.textLabelStyle,
            border: const OutlineInputBorder(),
          ),
          child: _displayCityDropdown(context, state));

  DropdownButton<String> _displayCityDropdown(BuildContext context,
      DropdownOfCityOnPersonalDetailEditingPopUpState state) {
    return DropdownButton<String>(
      underline: const SizedBox(),
      isExpanded: true,
      items: _findCityItemList(context),
      value: _findInitialCity(context, state),
      onChanged: (String? value) {
        _findNewCity(context, value);
      },
    );
  }

  //
  //       case Status.failure:
  //         return StateError(error: CityState.error);
  //     }
  //   },
  // );

  /// METHODS ==========================================================================================================
  //
  // void _getExistingCity(BuildContext context) {
  //   context.read<DropdownOfCityOnPersonalDetailEditingPopUpBloc>().add(
  //       DropdownOfCityOnPersonalDetailEditingPopUpSubmit(
  //           _findCity(context)));
  // }

  void _updateCity(BuildContext context, String value) => context
      .read<DropdownOfCityOnPersonalDetailEditingPopUpBloc>()
      .add(DropdownOfCityOnPersonalDetailEditingPopUpSubmit(value));

  /// Find Methods -----------------------------------------------------------------------------------------------------
  List<DropdownMenuItem<String>> _findCityItemList(BuildContext context) =>
      context
          .read<CityDynamicByCountryBloc>()
          .state
          .cityDynamicList
          .map((item) => DropdownMenuItem<String>(
                value: item.cityDetail,
                child: AppHeaderText(
                    textLabel: item.cityDetail.toCapitalized(),
                    textStyle: widget.textfieldTextStyle),
              ))
          .toList();

  String _findInitialCity(BuildContext context,
          DropdownOfCityOnPersonalDetailEditingPopUpState state) =>
      state.fieldText == ''
          ? _findPreviousChosenCity(context)
          : _findNewChosenCity(state);

  /// XXXXXXX this if condition can be deleted if there is any issue occurs XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  void _findNewCity(BuildContext context, String? value) {
    if (value!.isNotEmpty) {
      _updateCity(context, value);
    }
  }

  // String _findCity(BuildContext context) => context
  //     .read<TextOfCityOnPersonalDetailEditingPopUpBloc>()
  //     .state
  //     .city!;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  // void _checkWhetherPreviousCityIsChosen(
  //     bool checkPreviousState, BuildContext context) {
  //   if (checkPreviousState == false) {
  //     _getExistingCity(context);
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
  BlocBuilder<DropdownOfCityOnPersonalDetailEditingPopUpBloc,
      DropdownOfCityOnPersonalDetailEditingPopUpState> _buildUpdatingButton(
          BuildContext context) =>
      BlocBuilder<DropdownOfCityOnPersonalDetailEditingPopUpBloc,
          DropdownOfCityOnPersonalDetailEditingPopUpState>(
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
    DropdownOfCityOnPersonalDetailEditingPopUpState state,
  ) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.update,
          textStyle: widget.buttonTextStyle,
          elevatedButtonWidth: _findButtonWidth,
          buttonColor: _appColors.secondary,
          onPressed:
              // _checkWhetherCityIsCorrect(state)
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
        widget.dropdownOfCityOnPersonalDetailEditingPopUpBloc.add(
            DropdownOfCityOnPersonalDetailEditingPopUpSubmit(
                _findPreviousCity(dialogContext)));
      },
    );
  }

  void _clickUpdateButton(
    BuildContext dialogContext,
    DropdownOfCityOnPersonalDetailEditingPopUpState state,
  ) {
    _closePopUp(dialogContext);
    dialogContext.read<TextOfCityOnPersonalDetailEditingPopUpBloc>().add(
        TextOfCityOnPersonalDetailEditingPopUpSubmit(
            _findNewChosenCity(state)));
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findPreviousCity(BuildContext dialogContext) => dialogContext
      .read<TextOfCityOnPersonalDetailEditingPopUpBloc>()
      .state
      .city!;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  // bool _checkWhetherCityIsCorrect(
  //         DropdownOfCityOnPersonalDetailEditingPopUpState state) =>
  //     _checkCityIsValid(state) || _checkCityEnteredCorrectly(state);

  // bool _checkCityEnteredCorrectly(
  //         DropdownOfCityOnPersonalDetailEditingPopUpState state) =>
  //     state.formSubmissionOnCityUpdatingState.submissionSuccess == true;

  /// METHODS ==========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
  // bool _checkCityIsValid(
  //         DropdownOfCityOnPersonalDetailEditingPopUpState state) =>
  //     state.formSubmissionOnCityUpdatingState.isValid != false;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findNewChosenCity(
          DropdownOfCityOnPersonalDetailEditingPopUpState state) =>
      state.fieldText!;

  String _findPreviousChosenCity(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.countryCity.city.cityDetail;

  double get _findButtonWidth => widget.screenWidth * 0.90 * 0.34;

  /// Screen Methods ---------------------------------------------------------------------------------------------------
  void _closePopUp(BuildContext dialogContext) {
    Navigator.of(dialogContext).pop();
  }
}
