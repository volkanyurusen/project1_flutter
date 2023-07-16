import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/screens/existence/body_areas/zareas.dart';
import 'package:my_project/widgets/widget.dart';

class LocationTemplateAddingPopUp extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();

  final LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc;

  LocationTemplateAddingPopUp(
      {required this.locationTemplateDynamicByUserBloc, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpBloc
        textFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpBloc =
        context.read<
            TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpBloc>();

    TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpBloc
        textfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpBloc =
        context.read<
            TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpBloc>();

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
        LocationTemplateAddingPopUpBodyTemplateNameArea(
          textFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpBloc:
              textFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpBloc,
          screenWidth: screenWidth,
          textfieldTextStyle: textfieldTextStyle,
          buttonTextStyle: buttonTextStyle,
          textColor: textColor,
        ),
        LocationTemplateAddingPopUpBodyLatitudeLongitudeArea(
          textfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpBloc:
              textfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpBloc,
          screenWidth: screenWidth,
          textfieldTextStyle: textfieldTextStyle,
          buttonTextStyle: buttonTextStyle,
          textColor: textColor,
        ),
        const Expanded(child: SizedBox()),
        LocationTemplateAddingPopUpBodyCancelAndAddArea(
            locationTemplateDynamicByUserBloc:
                locationTemplateDynamicByUserBloc,
            textFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpBloc:
                textFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpBloc,
            textfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpBloc:
                textfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpBloc,
            screenWidth: screenWidth),
      ],
    );
  }
}
