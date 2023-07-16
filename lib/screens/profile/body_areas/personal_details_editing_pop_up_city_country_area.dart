import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

class PersonalDetailsEditingPopUpCityCountryArea extends StatefulWidget {
  final DropdownOfCityOnPersonalDetailEditingPopUpBloc
      dropdownOfCityOnPersonalDetailEditingPopUpBloc;
  final DropdownOfCountryOnPersonalDetailEditingPopUpBloc
      dropdownOfCountryOnPersonalDetailEditingPopUpBloc;
  final double screenWidth;
  final TextStyle textfieldTextStyle;
  final TextStyle textLabelStyle;
  final TextStyle buttonTextStyle;
  final Color textColor;

  const PersonalDetailsEditingPopUpCityCountryArea({
    required this.dropdownOfCityOnPersonalDetailEditingPopUpBloc,
    required this.dropdownOfCountryOnPersonalDetailEditingPopUpBloc,
    required this.screenWidth,
    required this.textfieldTextStyle,
    required this.textLabelStyle,
    required this.buttonTextStyle,
    required this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  State<PersonalDetailsEditingPopUpCityCountryArea> createState() =>
      _PersonalDetailsEditingPopUpCityCountryAreaState();
}

class _PersonalDetailsEditingPopUpCityCountryAreaState
    extends State<PersonalDetailsEditingPopUpCityCountryArea> {
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
    context.read<TextOfCityOnPersonalDetailEditingPopUpBloc>().add(
        TextOfCityOnPersonalDetailEditingPopUpSubmit(context
            .read<UserBloc>()
            .state
            .userList
            .last
            .countryCity
            .city
            .cityDetail));
    context.read<DropdownOfCountryOnPersonalDetailEditingPopUpBloc>().add(
        DropdownOfCountryOnPersonalDetailEditingPopUpSubmit(context
            .read<UserBloc>()
            .state
            .userList
            .last
            .countryCity
            .country
            .countryDetail));
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
        _createCountryTitle(),
        _createShowDialogButton(context),
      ],
    );
  }

  /// TITLES ===========================================================================================================
  CustomTitle _createCountryTitle() =>
      const CustomTitle(spaceFromUpperWidget: 32, textLabel: 'City & Country');

  /// CREATE ===========================================================================================================
  GestureDetector _createShowDialogButton(BuildContext context) {
    return GestureDetector(
      child: _createCountryTextArea(),
      onTap: () {
        _openCountryDialog(context);
      },
    );
  }

  /// CITY COUNTRY TEXT AREA ===========================================================================================
  /// CREATE ===========================================================================================================
  AppHeader _createCountryTextArea() => AppHeader(
        firstWidget: _buildCityTextArea(),
        // firstWidget: _buildCountryTextArea(),
        // thirdWidget: Icon(Icons.edit, color: widget.textColor),
      );

  /// BUILD ============================================================================================================
  BlocBuilder<TextOfCityOnPersonalDetailEditingPopUpBloc,
          TextOfCityOnPersonalDetailEditingPopUpState>
      _buildCityTextArea() => BlocBuilder<
              TextOfCityOnPersonalDetailEditingPopUpBloc,
              TextOfCityOnPersonalDetailEditingPopUpState>(
            builder: (context, cityState) {
              return _buildCountryTextArea(cityState);
            },
          );

  BlocBuilder<TextOfCountryOnPersonalDetailEditingPopUpBloc,
      TextOfCountryOnPersonalDetailEditingPopUpState> _buildCountryTextArea(
    TextOfCityOnPersonalDetailEditingPopUpState cityState,
  ) =>
      BlocBuilder<TextOfCountryOnPersonalDetailEditingPopUpBloc,
          TextOfCountryOnPersonalDetailEditingPopUpState>(
        builder: (context, countryState) {
          _checkWhetherCityCountryIsEmptyOnText(
              context, cityState, countryState);
          return _displayCountryText(cityState, countryState);
        },
      );

  /// DISPLAY ==========================================================================================================
  Expanded _displayCountryText(
    TextOfCityOnPersonalDetailEditingPopUpState cityState,
    TextOfCountryOnPersonalDetailEditingPopUpState countryState,
  ) {
    return Expanded(
      child: AppHeaderText(
        textLabel: '${_findCity(cityState)} / ${_findCountry(countryState)}',
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

  void _getInitialCountry(BuildContext context) {
    context.read<DropdownOfCountryOnPersonalDetailEditingPopUpBloc>().add(
        DropdownOfCountryOnPersonalDetailEditingPopUpSubmit(
            _findPreviousChosenCountry(context)));
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  void _checkWhetherCityCountryIsEmptyOnText(
    BuildContext context,
    TextOfCityOnPersonalDetailEditingPopUpState cityState,
    TextOfCountryOnPersonalDetailEditingPopUpState countryState,
  ) {
    if (cityState.city == '') {
      _getInitialCity(context);
    }
    if (countryState.country == '') {
      _getInitialCountry(context);
    }
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findCity(TextOfCityOnPersonalDetailEditingPopUpState cityState) =>
      cityState.city!.toCapitalized();

  String _findCountry(
          TextOfCountryOnPersonalDetailEditingPopUpState countryState) =>
      countryState.country!.toCapitalized();

  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================

  /// CITY COUNTRY TEXTFIELD AREA ======================================================================================
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
        height: context.height * _appNumberConstants.kCityCountryDialogRatio,
        children: [
          const CustomAppSizedBox(),
          _buildCityDropDownArea(),
          const CustomAppSizedBox(),
          _buildCountryDropDownArea(),
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
            builder: (context, cityState) {
              return _displayCityDropDownBox(context, cityState);
            },
          );

  BlocBuilder<DropdownOfCountryOnPersonalDetailEditingPopUpBloc,
          DropdownOfCountryOnPersonalDetailEditingPopUpState>
      _buildCountryDropDownArea() => BlocBuilder<
              DropdownOfCountryOnPersonalDetailEditingPopUpBloc,
              DropdownOfCountryOnPersonalDetailEditingPopUpState>(
            builder: (context, countryState) {
              return _displayCountryDropDownBox(context, countryState);
            },
          );

  /// DISPLAY ==========================================================================================================
  InputDecorator _displayCityDropDownBox(
    BuildContext context,
    DropdownOfCityOnPersonalDetailEditingPopUpState cityState,
  ) =>
      InputDecorator(
          decoration: InputDecoration(
            contentPadding: _appVisualConstants.dropDownBoxPadding,
            labelText: 'City',
            labelStyle: widget.textLabelStyle,
            border: const OutlineInputBorder(),
          ),
          child: _displayCityDropdown(context, cityState));

  DropdownButton<String> _displayCityDropdown(BuildContext context,
      DropdownOfCityOnPersonalDetailEditingPopUpState cityState) {
    return DropdownButton<String>(
      underline: const SizedBox(),
      isExpanded: true,
      items: _findCityItemList(context),
      value: _findInitialCity(context, cityState),
      onChanged: (String? value) {
        _findNewCity(context, value);
      },
    );
  }

  InputDecorator _displayCountryDropDownBox(
    BuildContext context,
    DropdownOfCountryOnPersonalDetailEditingPopUpState countryState,
  ) =>
      InputDecorator(
          decoration: InputDecoration(
            contentPadding: _appVisualConstants.dropDownBoxPadding,
            labelText: 'Country',
            labelStyle: widget.textLabelStyle,
            border: const OutlineInputBorder(),
          ),
          child: _displayCountryDropdown(context, countryState));

  DropdownButton<String> _displayCountryDropdown(BuildContext context,
      DropdownOfCountryOnPersonalDetailEditingPopUpState countryState) {
    return DropdownButton<String>(
      underline: const SizedBox(),
      isExpanded: true,
      items: _findCountryItemList(context),
      value: _findInitialCountry(context, countryState),
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
  // void _getExistingCityCountry(BuildContext context) {
  //   context.read<DropdownOfCountryOnPersonalDetailEditingPopUpBloc>().add(
  //       DropdownOfCountryOnPersonalDetailEditingPopUpSubmit(
  //           _findCountry(context)));
  // }

  void _updateCity(BuildContext context, String value) => context
      .read<DropdownOfCityOnPersonalDetailEditingPopUpBloc>()
      .add(DropdownOfCityOnPersonalDetailEditingPopUpSubmit(value));

  void _updateCountry(BuildContext context, String value) => context
      .read<DropdownOfCountryOnPersonalDetailEditingPopUpBloc>()
      .add(DropdownOfCountryOnPersonalDetailEditingPopUpSubmit(value));

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
          DropdownOfCityOnPersonalDetailEditingPopUpState cityState) =>
      cityState.fieldText == ''
          ? _findPreviousChosenCity(context)
          : _findNewChosenCity(cityState);

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
          DropdownOfCountryOnPersonalDetailEditingPopUpState countryState) =>
      countryState.fieldText == ''
          ? _findPreviousChosenCountry(context)
          : _findNewChosenCountry(countryState);

  /// XXXXXXX this if condition can be deleted if there is any issue occurs XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  void _findNewCity(BuildContext context, String? value) {
    if (value!.isNotEmpty) {
      _updateCity(context, value);
    }
  }

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
  // void _checkWhetherPreviousCityCountryIsChosen(
  //     bool checkPreviousState, BuildContext context) {
  //   if (checkPreviousState == false) {
  //     _getExistingCityCountry(context);
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
        builder: (context, cityState) {
          return BlocBuilder<DropdownOfCountryOnPersonalDetailEditingPopUpBloc,
              DropdownOfCountryOnPersonalDetailEditingPopUpState>(
            builder: (context, countryState) {
              return _displayUpdatingButton(context, cityState, countryState);
            },
          );
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
    DropdownOfCityOnPersonalDetailEditingPopUpState cityState,
    DropdownOfCountryOnPersonalDetailEditingPopUpState countryState,
  ) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.update,
          textStyle: widget.buttonTextStyle,
          elevatedButtonWidth: _findButtonWidth,
          buttonColor: _appColors.secondary,
          onPressed:
              // _checkWhetherCityCountryIsCorrect(state)
              //     ?
              () => _clickUpdateButton(context, cityState, countryState)
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

        widget.dropdownOfCountryOnPersonalDetailEditingPopUpBloc.add(
            DropdownOfCountryOnPersonalDetailEditingPopUpSubmit(
                _findPreviousCountry(dialogContext)));
      },
    );
  }

  void _clickUpdateButton(
    BuildContext dialogContext,
    DropdownOfCityOnPersonalDetailEditingPopUpState cityState,
    DropdownOfCountryOnPersonalDetailEditingPopUpState countryState,
  ) {
    _closePopUp(dialogContext);
    dialogContext.read<TextOfCityOnPersonalDetailEditingPopUpBloc>().add(
        TextOfCityOnPersonalDetailEditingPopUpSubmit(
            _findNewChosenCity(cityState)));
    dialogContext.read<TextOfCountryOnPersonalDetailEditingPopUpBloc>().add(
        TextOfCountryOnPersonalDetailEditingPopUpSubmit(
            _findNewChosenCountry(countryState)));
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findPreviousCity(BuildContext dialogContext) => dialogContext
      .read<TextOfCityOnPersonalDetailEditingPopUpBloc>()
      .state
      .city!;

  String _findPreviousCountry(BuildContext dialogContext) => dialogContext
      .read<TextOfCountryOnPersonalDetailEditingPopUpBloc>()
      .state
      .country!;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  // bool _checkWhetherCityCountryIsCorrect(
  //         DropdownOfCountryOnPersonalDetailEditingPopUpState countryState) =>
  //     _checkCityCountryIsValid(state) || _checkCityCountryEnteredCorrectly(state);

  // bool _checkCityCountryEnteredCorrectly(
  //         DropdownOfCountryOnPersonalDetailEditingPopUpState countryState) =>
  //     state.formSubmissionOnCityCountryUpdatingState.submissionSuccess == true;

  /// METHODS ==========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
  // bool _checkCityCountryIsValid(
  //         DropdownOfCountryOnPersonalDetailEditingPopUpState countryState) =>
  //     state.formSubmissionOnCityCountryUpdatingState.isValid != false;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findNewChosenCity(
          DropdownOfCityOnPersonalDetailEditingPopUpState cityState) =>
      cityState.fieldText!;

  String _findNewChosenCountry(
          DropdownOfCountryOnPersonalDetailEditingPopUpState countryState) =>
      countryState.fieldText!;

  String _findPreviousChosenCity(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.countryCity.city.cityDetail;

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
