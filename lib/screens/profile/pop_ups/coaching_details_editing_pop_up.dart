import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

import '../bodies/zbodies.dart';

class CoachingDetailsEditingPopUp extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final CoachBloc coachBloc;
  final CoachDynamicBloc coachDynamicBloc;

  CoachingDetailsEditingPopUp({
    required this.coachBloc,
    required this.coachDynamicBloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DropdownOfExperienceYearOnCoachingDetailEditingPopUpBloc
        dropdownOfExperienceYearOnCoachingDetailEditingPopUpBloc = context
            .read<DropdownOfExperienceYearOnCoachingDetailEditingPopUpBloc>();

    TextFieldOfMinLessonOnCoachingDetailEditingPopUpBloc
        textFieldOfMinLessonOnCoachingDetailEditingPopUpBloc =
        context.read<TextFieldOfMinLessonOnCoachingDetailEditingPopUpBloc>();

    TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpBloc
        textFieldOfPerLessonPriceOnCoachingDetailEditingPopUpBloc = context
            .read<TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpBloc>();

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
          _appNumberConstants.kCoachingDetailsEditingDialogRatio,
      children: [
        CoachingDetailsEditingPopUpExperienceYearArea(
          dropdownOfExperienceYearOnCoachingDetailEditingPopUpBloc:
              dropdownOfExperienceYearOnCoachingDetailEditingPopUpBloc,
          screenWidth: screenWidth,
          textfieldTextStyle: textfieldTextStyle,
          textLabelStyle: textLabelStyle,
          buttonTextStyle: buttonTextStyle,
          textColor: textColor,
        ),
        CoachingDetailsEditingPopUpMinLessonArea(
          textFieldOfMinLessonOnCoachingDetailEditingPopUpBloc:
              textFieldOfMinLessonOnCoachingDetailEditingPopUpBloc,
          screenWidth: screenWidth,
          textfieldTextStyle: textfieldTextStyle,
          buttonTextStyle: buttonTextStyle,
          textColor: textColor,
        ),
        CoachingDetailsEditingPopUpPerLessonPriceArea(
          textFieldOfPerLessonPriceOnCoachingDetailEditingPopUpBloc:
              textFieldOfPerLessonPriceOnCoachingDetailEditingPopUpBloc,
          screenWidth: screenWidth,
          textfieldTextStyle: textfieldTextStyle,
          buttonTextStyle: buttonTextStyle,
          textColor: textColor,
        ),
        const Expanded(child: SizedBox()),
        CoachingDetailsEditingPopUpCancelAndUpdateButtonArea(
          coachBloc: coachBloc,
          coachDynamicBloc: coachDynamicBloc,
        ),
      ],
    );
  }
}
