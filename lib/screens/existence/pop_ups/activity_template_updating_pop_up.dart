import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import '../body_areas/zareas.dart';

class ActivityTemplateUpdatingPopUp extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();

  final ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc;

  ActivityTemplateUpdatingPopUp({
    required this.activityTemplateDynamicByUserBloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CleanAllButtonOnActivityTemplateUpdatingPopUpCubit cleanActivityButton =
        BlocProvider.of<CleanAllButtonOnActivityTemplateUpdatingPopUpCubit>(
            context,
            listen: true);

    TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc
        textFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc =
        context.read<
            TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc>();

    final double screenWidth = context.width;
    final Color textColor = _appColors.textColor;
    final Color buttonTextColor = Theme.of(context).colorScheme.background;
    final TextStyle textfieldTextStyle = context.textTheme.displaySmall!
        .copyWith(fontWeight: FontWeight.w100, color: textColor);
    TextStyle? buttonTextStyle =
        context.textTheme.headlineSmall!.copyWith(color: buttonTextColor);

    return PopUpBody(
      height: context.height *
          _appNumberConstants.kActivityTemplateUpdatingDialogRatio,
      children: [
        ActivityTemplateUpdatingPopUpBodyTemplateNameArea(
          cleanActivityButton: cleanActivityButton,
          textFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc:
              textFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc,
          screenWidth: screenWidth,
          textfieldTextStyle: textfieldTextStyle,
          buttonTextStyle: buttonTextStyle,
          textColor: textColor,
        ),
        ActivityTemplateUpdatingPopUpBodyActivityTypeArea(
            cleanActivityButton: cleanActivityButton, screenWidth: screenWidth),
        ActivityTemplateUpdatingPopUpBodyActivityNameArea(
            cleanActivityButton: cleanActivityButton),
        ActivityTemplateUpdatingPopUpBodyCancelAndUpdateArea(
            activityTemplateDynamicByUserBloc:
                activityTemplateDynamicByUserBloc,
            textFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc:
                textFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc,
            screenWidth: screenWidth),
      ],
    );
  }
}
