import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/screens/profile/body_areas/zareas.dart';


import 'package:my_project/widgets/widget.dart';

class LocationDetailLocationTemplateAddingPopUp extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();

  final LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc;

  LocationDetailLocationTemplateAddingPopUp(
      {required this.locationTemplateDynamicByUserBloc, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc
        textFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc =
        context.read<
            TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc>();

    TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc
        textfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc =
        context.read<
            TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc>();

    double screenWidth = MediaQuery.of(context).size.width;

    final Color textColor = _appColors.textColor;
    final Color buttonTextColor = Theme.of(context).colorScheme.background;
    final TextStyle textfieldTextStyle = context.textTheme.displaySmall!
        .copyWith(fontWeight: FontWeight.w100, color: textColor);
    TextStyle? buttonTextStyle =
        context.textTheme.headlineSmall!.copyWith(color: buttonTextColor);

    return PopUpBody(
      height: context.height *
          _appNumberConstants.kLocationTemplateAddingDialogRatio,
      children: [
        LocationDetailLocationTemplateAddingPopUpBodyTemplateNameArea(
          textFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc:
              textFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc,
          screenWidth: screenWidth,
          textfieldTextStyle: textfieldTextStyle,
          buttonTextStyle: buttonTextStyle,
          textColor: textColor,
        ),
        LocationDetailLocationTemplateAddingPopUpBodyLatitudeLongitudeArea(
          textfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc:
              textfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc,
          screenWidth: screenWidth,
          textfieldTextStyle: textfieldTextStyle,
          buttonTextStyle: buttonTextStyle,
          textColor: textColor,
        ),
        const Expanded(child: SizedBox()),
        LocationDetailLocationTemplateAddingPopUpBodyCancelAndAddArea(
            locationTemplateDynamicByUserBloc:
                locationTemplateDynamicByUserBloc,
            textFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc:
                textFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc,
            textfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc:
                textfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc,
            screenWidth: screenWidth),
      ],
    );
  }
}
