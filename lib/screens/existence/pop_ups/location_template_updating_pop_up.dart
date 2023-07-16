import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/screens/existence/body_areas/zareas.dart';
import 'package:my_project/widgets/widget.dart';

class LocationTemplateUpdatingPopUp extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();

  final LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc;

  LocationTemplateUpdatingPopUp({
    required this.locationTemplateDynamicByUserBloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc
        textFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc =
        context.read<
            TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc>();

    TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc
        textfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc =
        context.read<
            TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc>();

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
        LocationTemplateUpdatingPopUpBodyTemplateNameArea(
          textFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc:
              textFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc,
          screenWidth: screenWidth,
          textfieldTextStyle: textfieldTextStyle,
          buttonTextStyle: buttonTextStyle,
          textColor: textColor,
        ),
        LocationTemplateUpdatingPopUpBodyLatitudeLongitudeArea(
          textfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc:
              textfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc,
          screenWidth: screenWidth,
          textfieldTextStyle: textfieldTextStyle,
          buttonTextStyle: buttonTextStyle,
          textColor: textColor,
        ),
        const Expanded(child: SizedBox()),
        LocationTemplateUpdatingPopUpBodyCancelAndUpdateArea(
            locationTemplateDynamicByUserBloc:
                locationTemplateDynamicByUserBloc,
            textFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc:
                textFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc,
            textfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc:
                textfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc,
            screenWidth: screenWidth),
      ],
    );
  }
}
