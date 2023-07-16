import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/existence/body_areas/zareas.dart';
import 'package:my_project/widgets/widget.dart';

class ActivityTemplateAddingPopUp extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();

  final ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc;

  ActivityTemplateAddingPopUp(
      {required this.activityTemplateDynamicByUserBloc, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CleanAllButtonOnActivityTemplateAddingPopUpCubit cleanActivityButton =
        BlocProvider.of<CleanAllButtonOnActivityTemplateAddingPopUpCubit>(
            context,
            listen: true);
    TextFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpBloc
        textFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpBloc =
        context.read<
            TextFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpBloc>();
    double screenWidth = MediaQuery.of(context).size.width;

    final Color textColor = _appColors.textColor;
    final Color buttonTextColor = Theme.of(context).colorScheme.background;
    final TextStyle textfieldTextStyle = context.textTheme.displaySmall!
        .copyWith(fontWeight: FontWeight.w100, color: textColor);
    TextStyle? buttonTextStyle =
        context.textTheme.headlineSmall!.copyWith(color: buttonTextColor);

    return PopUpBody(
      height: context.height *
          _appNumberConstants.kActivityTemplateAddingDialogRatio,
      children: [
        ActivityTemplateAddingPopUpBodyTemplateNameArea(
          cleanActivityButton: cleanActivityButton,
          textFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpBloc:
              textFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpBloc,
          screenWidth: screenWidth,
          textfieldTextStyle: textfieldTextStyle,
          buttonTextStyle: buttonTextStyle,
          textColor: textColor,
        ),
        ActivityTemplateAddingPopUpBodyActivityTypeArea(
            cleanActivityButton: cleanActivityButton, screenWidth: screenWidth),
        ActivityTemplateAddingPopUpBodyActivityNameArea(
            cleanActivityButton: cleanActivityButton),
        ActivityTemplateAddingPopUpBodyCancelAndAddArea(
            activityTemplateDynamicByUserBloc:
                activityTemplateDynamicByUserBloc,
            textFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpBloc:
                textFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpBloc,
            screenWidth: screenWidth),
      ],
    );
  }
}
