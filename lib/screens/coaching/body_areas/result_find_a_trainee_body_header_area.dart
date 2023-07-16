import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

class ResultFindATraineeBodyHeaderArea extends StatelessWidget {
  final AppFunctions _appFunctions = AppFunctions();
  final DateFormat _displayedDateFormat = AppDateFormat().displayedDateFormat;
  final double screenWidth;

  ResultFindATraineeBodyHeaderArea({
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final activityTypeDynamicButtonOnFindATraineeScreenBloc =
        BlocProvider.of<ActivityTypeDynamicButtonOnFindATraineeScreenBloc>(
            context);

    return CustomColumn(
      children: [
        _displayHeader(
            context, activityTypeDynamicButtonOnFindATraineeScreenBloc),
        CustomAppDivider(),
        const CustomAppSizedBox(height: 4),
      ],
    );
  }

  /// DISPLAY ==========================================================================================================
  /// This widget demonstrates header where [activityTypeDetial] on the top-left corner and
  /// [activityDate] (beginning and end date) on the top-right corner.
  /// [firstWidget] demonstrates [ActivityTypeDetail], if it is chosen only one
  /// [activityTypeDetail] it shows the chosen name. If it is chosen more than one
  /// [activityTypeDetail] it shows 'Multiple Activities'.
  /// [thirdWidget] demonstrates [ActivityDate/ActivityDates], if it is chosen only one
  /// [ActivityDate] it shows the chosen date. If it is chosen more than one [ActivityDate] it
  /// shows Multiple Dates with the format 'dd, MMM yy'.
  AppHeader _displayHeader(
    BuildContext context,
    ActivityTypeDynamicButtonOnFindATraineeScreenBloc
        activityTypeDynamicButtonOnFindATraineeScreenBloc,
  ) =>
      AppHeader(
        spaceFromUpperWidget: 0,
        firstWidget: _displayActivityTypeDynamicText(
            context, activityTypeDynamicButtonOnFindATraineeScreenBloc),
        thirdWidget: _displayChosenActivityDates(context),
      );

  /// This widget demonstrates [activityTypeDetial] on the left side of the header.
  AppHeaderText _displayActivityTypeDynamicText(
    BuildContext context,
    ActivityTypeDynamicButtonOnFindATraineeScreenBloc
        activityTypeDynamicButtonOnFindATraineeScreenBloc,
  ) =>
      AppHeaderText(
          textLabel: activityTypeDynamicButtonOnFindATraineeScreenBloc
                      .state.chosenActivityTypeDynamicList.length ==
                  1
              ? _appFunctions.setWithoutUnderscore(
                  activityTypeDynamicButtonOnFindATraineeScreenBloc
                      .state.chosenActivityTypeDynamicList.first)
              : 'Multiple Activities');

  /// This widget demonstrates [activityDate] on the left side of the header.
  AppHeaderText _displayChosenActivityDates(
    BuildContext context,
  ) =>
      _displayOneActivityDate(context);

  /// This widget demonstrates [activityDate] on the right side of the header. This code works only if the chosen dates
  /// ([beginningDate] and [endingDate]) are equal.
  AppHeaderText _displayOneActivityDate(
    BuildContext context,
  ) =>
      AppHeaderText(textLabel: _displayedDateFormat.format(DateTime.now()));
}
