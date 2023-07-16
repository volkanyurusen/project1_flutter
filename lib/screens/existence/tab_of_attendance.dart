import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/screens/existence/bodies/zbodies.dart';
import 'package:my_project/widgets/widget.dart';

class TabOfAttendance extends StatelessWidget {
  final AppFunctions _appFunctions = AppFunctions();

  TabOfAttendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _bringConsistedActivityListAttendedByUserFromDatabaseAndDisplayThem();
  }

  /// BLOC =============================================================================================================
  BlocBuilder<ConsistedActivityDynamicWithDistanceAttendedByUserBloc,
          ConsistedActivityDynamicWithDistanceAttendedByUserState>
      _bringConsistedActivityListAttendedByUserFromDatabaseAndDisplayThem() =>
          BlocBuilder<ConsistedActivityDynamicWithDistanceAttendedByUserBloc,
              ConsistedActivityDynamicWithDistanceAttendedByUserState>(
            builder: (context, state) {
              switch (state.status) {
                case StatusWithoutLoading.initial:
                  return const StateLoading();
                case StatusWithoutLoading.success:
                  if (isAttendanceListEmpty(state)) {
                    return const InformationAboutExisting(
                        detailLabel: 'attended activity');
                  } else {
                    List<DateTime> firstDayOfContainingWeekOfActivityDate = [];
                    List<DateTime>
                        uniqueFirstDayOfContainingWeekOfActivityDate =
                        <DateTime>[];
                    _createSetBasedOnFirstDayOfWeeksActivityDatesInvolvedIn(
                        state, firstDayOfContainingWeekOfActivityDate);
                    _createSetBasedOnUniqueFirstDayOfWeeksActivityDatesInvolvedIn(
                        state, uniqueFirstDayOfContainingWeekOfActivityDate);
                    return AttendanceBody(
                        firstDayOfContainingWeekOfActivityDate:
                            firstDayOfContainingWeekOfActivityDate,
                        uniqueFirstDayOfContainingWeekOfActivityDate:
                            uniqueFirstDayOfContainingWeekOfActivityDate);
                  }
                case StatusWithoutLoading.failure:
                  return StateError(error: state.error);
              }
            },
          );

  /// METHODS ==========================================================================================================
  ///
  /// The below codes create a set from for loop based on the unique [ActivityDate] in [CreatedActivityDynamic] via
  /// [ConsistedActivityDynamics] model which was brought by [ConsistedActivityDynamicWithDistanceAttendedByUserBloc].
  /// These codes return a set of [activityDate]s and these dates are converted to the beginning day of the week (it
  /// converts  the day to the beginning of the relevant week_ to Monday) with the [bringBeginningWeekDate] formula.
  /// These [firstDayOfContainingWeekOfActivityDate] will help to calculate how many activities exist on the relevant
  /// week by using [uniqueFirstDayOfContainingWeekOfActivityDate]. It will demonstrate how many activity/activities
  /// exist for user attendance on the relevant week which was/were calculated by
  /// [_createSetBasedOnUniqueFirstDayOfWeeksActivityDatesInvolvedIn].
  void _createSetBasedOnFirstDayOfWeeksActivityDatesInvolvedIn(
      ConsistedActivityDynamicWithDistanceAttendedByUserState state,
      List<DateTime> firstDayOfContainingWeekOfActivityDate) {
    for (var element in state.consistedActivityDynamicWithDistanceList) {
      firstDayOfContainingWeekOfActivityDate.add(_appFunctions
          .bringBeginningWeekDate(element.createdActivityDynamic.createdAt));
    }
  }

  ///
  /// The below codes create a set from for loop based on the unique [ActivityDate] in [CreatedActivityDynamic] via
  /// [ConsistedActivityDynamic] model which was brought by [BringCreatedActivitiesCreatedByIndividualUserBloc]. These
  /// codes return a set of unique [activityDate]s and these dates are converted to the beginning day of the week (it
  /// converts the day to the beginning of the relevant week_ to Monday) with the [bringBeginningWeekDate] formula.
  /// These [uniqueFirstDayOfContainingWeekOfActivityDate] group the [Host]'s and demonstrate them in the grouped way
  /// on the UI. So, the user easily finds the weeks of her/his activities which was/were created by another user/users.
  void _createSetBasedOnUniqueFirstDayOfWeeksActivityDatesInvolvedIn(
      ConsistedActivityDynamicWithDistanceAttendedByUserState state,
      List<DateTime> uniqueFirstDayOfContainingWeekOfActivityDate) {
    for (var element in state.consistedActivityDynamicWithDistanceList) {
      if (uniqueFirstDayOfContainingWeekOfActivityDate.contains(_appFunctions
          .bringBeginningWeekDate(element.createdActivityDynamic.createdAt))) {
      } else {
        uniqueFirstDayOfContainingWeekOfActivityDate.add(_appFunctions
            .bringBeginningWeekDate(element.createdActivityDynamic.createdAt));
      }
    }
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool isAttendanceListEmpty(
    ConsistedActivityDynamicWithDistanceAttendedByUserState state,
  ) =>
      state.consistedActivityDynamicWithDistanceList.isEmpty;
}
