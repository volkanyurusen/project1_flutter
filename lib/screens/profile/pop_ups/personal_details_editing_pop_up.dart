import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/screens/profile/body_areas/zareas.dart';
import 'package:my_project/widgets/widget.dart';

class PersonalDetailsEditingPopUp extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final UserBloc userBloc;
  final UserDynamicBloc userDynamicBloc;

  PersonalDetailsEditingPopUp({
    required this.userBloc,
    required this.userDynamicBloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextFieldOfNameSurnameOnPersonalDetailEditingPopUpBloc
        textFieldOfNameSurnameOnPersonalDetailEditingPopUpBloc =
        context.read<TextFieldOfNameSurnameOnPersonalDetailEditingPopUpBloc>();

    TextFieldOfUsernameOnPersonalDetailEditingPopUpBloc
        textFieldOfUsernameOnPersonalDetailEditingPopUpBloc =
        context.read<TextFieldOfUsernameOnPersonalDetailEditingPopUpBloc>();

    TextFieldOfBirthyearOnPersonalDetailEditingPopUpBloc
        textFieldOfBirthyearOnPersonalDetailEditingPopUpBloc =
        context.read<TextFieldOfBirthyearOnPersonalDetailEditingPopUpBloc>();

    DropdownOfGenderOnPersonalDetailEditingPopUpBloc
        dropdownOfGenderOnPersonalDetailEditingPopUpBloc =
        context.read<DropdownOfGenderOnPersonalDetailEditingPopUpBloc>();

    TextFieldOfEmailOnPersonalDetailEditingPopUpBloc
        textFieldOfEmailOnPersonalDetailEditingPopUpBloc =
        context.read<TextFieldOfEmailOnPersonalDetailEditingPopUpBloc>();

    TextFieldOfAddressOnPersonalDetailEditingPopUpBloc
        textFieldOfAddressOnPersonalDetailEditingPopUpBloc =
        context.read<TextFieldOfAddressOnPersonalDetailEditingPopUpBloc>();
    DropdownOfCityOnPersonalDetailEditingPopUpBloc
        dropdownOfCityOnPersonalDetailEditingPopUpBloc =
        context.read<DropdownOfCityOnPersonalDetailEditingPopUpBloc>();
    DropdownOfCountryOnPersonalDetailEditingPopUpBloc
        dropdownOfCountryOnPersonalDetailEditingPopUpBloc =
        context.read<DropdownOfCountryOnPersonalDetailEditingPopUpBloc>();

    TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpBloc
        textFieldOfAboutYourselfOnPersonalDetailEditingPopUpBloc = context
            .read<TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpBloc>();

    final double screenWidth = context.width;
    final Color textColor = _appColors.textColor;
    final Color buttonTextColor = Theme.of(context).colorScheme.background;
    final TextStyle textfieldTextStyle = context.textTheme.displaySmall!
        .copyWith(fontWeight: FontWeight.w100, color: textColor);
    final TextStyle textLabelStyle = context.textTheme.displaySmall!.copyWith(
        fontWeight: FontWeight.normal,
        color: _appColors.textColor.withOpacity(0.75));
    TextStyle? buttonTextStyle =
        context.textTheme.headlineSmall!.copyWith(color: buttonTextColor);

    return PopUpBody(
      height: context.height *
          _appNumberConstants.kPersonalDetailsEditingDialogRatio,
      children: [
        PersonalDetailsEditingPopUpNameSurnameArea(
          textFieldOfNameSurnameOnPersonalDetailEditingPopUpBloc:
              textFieldOfNameSurnameOnPersonalDetailEditingPopUpBloc,
          screenWidth: screenWidth,
          textfieldTextStyle: textfieldTextStyle,
          buttonTextStyle: buttonTextStyle,
          textColor: textColor,
        ),
        PersonalDetailsEditingPopUpUsernameArea(
          textFieldOfUsernameOnPersonalDetailEditingPopUpBloc:
              textFieldOfUsernameOnPersonalDetailEditingPopUpBloc,
          screenWidth: screenWidth,
          textfieldTextStyle: textfieldTextStyle,
          buttonTextStyle: buttonTextStyle,
          textColor: textColor,
        ),
        PersonalDetailsEditingPopUpBirthYearArea(
          textFieldOfBirthyearOnPersonalDetailEditingPopUpBloc:
              textFieldOfBirthyearOnPersonalDetailEditingPopUpBloc,
          screenWidth: screenWidth,
          textfieldTextStyle: textfieldTextStyle,
          buttonTextStyle: buttonTextStyle,
          textColor: textColor,
        ),
        PersonalDetailsEditingPopUpGenderArea(
          dropdownOfGenderOnPersonalDetailEditingPopUpBloc:
              dropdownOfGenderOnPersonalDetailEditingPopUpBloc,
          screenWidth: screenWidth,
          textfieldTextStyle: textfieldTextStyle,
          textLabelStyle: textLabelStyle,
          buttonTextStyle: buttonTextStyle,
          textColor: textColor,
        ),
        PersonalDetailsEditingPopUpEmailArea(
          textFieldOfEmailOnPersonalDetailEditingPopUpBloc:
              textFieldOfEmailOnPersonalDetailEditingPopUpBloc,
          screenWidth: screenWidth,
          textfieldTextStyle: textfieldTextStyle,
          buttonTextStyle: buttonTextStyle,
          textColor: textColor,
        ),
        PersonalDetailsEditingPopUpAddressArea(
          textFieldOfAddressOnPersonalDetailEditingPopUpBloc:
              textFieldOfAddressOnPersonalDetailEditingPopUpBloc,
          screenWidth: screenWidth,
          textfieldTextStyle: textfieldTextStyle,
          buttonTextStyle: buttonTextStyle,
          textColor: textColor,
        ),
        PersonalDetailsEditingPopUpCityArea(
          dropdownOfCityOnPersonalDetailEditingPopUpBloc:
              dropdownOfCityOnPersonalDetailEditingPopUpBloc,
          screenWidth: screenWidth,
          textfieldTextStyle: textfieldTextStyle,
          textLabelStyle: textLabelStyle,
          buttonTextStyle: buttonTextStyle,
          textColor: textColor,
        ),
        PersonalDetailsEditingPopUpCountryArea(
          dropdownOfCountryOnPersonalDetailEditingPopUpBloc:
              dropdownOfCountryOnPersonalDetailEditingPopUpBloc,
          screenWidth: screenWidth,
          textfieldTextStyle: textfieldTextStyle,
          textLabelStyle: textLabelStyle,
          buttonTextStyle: buttonTextStyle,
          textColor: textColor,
        ),
        PersonalDetailsEditingPopUpCityCountryArea(
          dropdownOfCountryOnPersonalDetailEditingPopUpBloc:
              dropdownOfCountryOnPersonalDetailEditingPopUpBloc,
          dropdownOfCityOnPersonalDetailEditingPopUpBloc:
              dropdownOfCityOnPersonalDetailEditingPopUpBloc,
          screenWidth: screenWidth,
          textfieldTextStyle: textfieldTextStyle,
          textLabelStyle: textLabelStyle,
          buttonTextStyle: buttonTextStyle,
          textColor: textColor,
        ),
        PersonalDetailsEditingPopUpAboutYourselfArea(
          textFieldOfAboutYourselfOnPersonalDetailEditingPopUpBloc:
              textFieldOfAboutYourselfOnPersonalDetailEditingPopUpBloc,
          screenWidth: screenWidth,
          textfieldTextStyle: textfieldTextStyle,
          buttonTextStyle: buttonTextStyle,
          textColor: textColor,
        ),
        PersonalDetailsEditingPopUpCancelAndUpdateButtonArea(
          userBloc: userBloc,
          userDynamicBloc: userDynamicBloc,
        ),
      ],
    );
  }
}
