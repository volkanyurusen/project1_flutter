import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/screens/existence/bodies/zbodies.dart';
import 'package:my_project/widgets/widget.dart';

class TabOfCreation extends StatelessWidget {
  final AppFunctions _appFunctions = AppFunctions();

  TabOfCreation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _bringCreatedActivityListCreatedByUserFromDatabaseAndDisplayThem();
  }

  /// BLOC =============================================================================================================
  BlocBuilder<CreatedActivityDynamicWithDistanceCreatedByUserBloc,
          CreatedActivityDynamicWithDistanceCreatedByUserState>
      _bringCreatedActivityListCreatedByUserFromDatabaseAndDisplayThem() =>
          BlocBuilder<CreatedActivityDynamicWithDistanceCreatedByUserBloc,
              CreatedActivityDynamicWithDistanceCreatedByUserState>(
            builder: (context, state) {
              switch (state.status) {
                case StatusWithoutLoading.initial:
                  return const StateLoading();
                case StatusWithoutLoading.success:
                  if (isCreationListEmpty(state)) {
                    return const InformationAboutExisting(
                        detailLabel: 'created activity');
                  } else {
                    List<DateTime> firstDayOfContainingWeekOfActivityDate = [];
                    List<DateTime>
                        uniqueFirstDayOfContainingWeekOfActivityDate =
                        <DateTime>[];
                    _createListBasedOnFirstDayOfWeeksActivityDatesInvolvedIn(
                        state, firstDayOfContainingWeekOfActivityDate);
                    _createSetBasedOnUniqueFirstDayOfWeeksActivityDatesInvolvedIn(
                        state, uniqueFirstDayOfContainingWeekOfActivityDate);
                    return CreationBody(
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

  ///
  /// The below codes create a set from for loop based on the unique [ActivityDate] in [CreatedActivityDynamic] model
  /// which was brought by [CreatedActivityDynamicWithDistanceCreatedByUserBloc]. These codes return a
  /// set of [activityDate]s and these dates are converted to the beginning day of the week (it converts the day to the
  /// beginning of the relevant week_ to Monday) with the [bringBeginningWeekDate] formula. These
  /// [firstDayOfContainingWeekOfActivityDate] will help to calculate how many activities exist on the relevant week
  /// by using [uniqueFirstDayOfContainingWeekOfActivityDate]. It will demonstrate how many activity/activities
  /// created on the relevant week which was/were calculated by
  /// [_createSetBasedOnUniqueFirstDayOfWeeksActivityDatesInvolvedIn].
  void _createListBasedOnFirstDayOfWeeksActivityDatesInvolvedIn(
      CreatedActivityDynamicWithDistanceCreatedByUserState state,
      List<dynamic> firstDayOfContainingWeekOfActivityDate) {
    for (var element in state.createdActivityDynamicWithDistanceList) {
      firstDayOfContainingWeekOfActivityDate
          .add(_appFunctions.bringBeginningWeekDate(element.createdAt));
    }
  }

  ///
  /// The below codes create a set from for loop based on the unique [ActivityDate] in [CreatedActivityDynamic] model
  /// which was brought by [CreatedActivityDynamicWithDistanceCreatedByUserBloc]. These codes return a
  /// set of unique  [activityDate]s and these dates are converted to the beginning day of the week (it converts the
  /// day to the beginning of the relevant week_ to Monday) with the [bringBeginningWeekDate] formula. These
  /// [uniqueFirstDayOfContainingWeekOfActivityDate] group the [CreatedActivityDynamic]'s and demonstrate them in the
  /// grouped way on the UI. So, the user easily finds the weeks of her/his activities which was/were created by
  /// herself/himself.
  void _createSetBasedOnUniqueFirstDayOfWeeksActivityDatesInvolvedIn(
      CreatedActivityDynamicWithDistanceCreatedByUserState state,
      List<DateTime> uniqueFirstDayOfContainingWeekOfActivityDate) {
    for (var element in state.createdActivityDynamicWithDistanceList) {
      if (uniqueFirstDayOfContainingWeekOfActivityDate
          .contains(_appFunctions.bringBeginningWeekDate(element.createdAt))) {
      } else {
        uniqueFirstDayOfContainingWeekOfActivityDate
            .add(_appFunctions.bringBeginningWeekDate(element.createdAt));
      }
    }
  }

  /// Check Method -----------------------------------------------------------------------------------------------------
  bool isCreationListEmpty(
    CreatedActivityDynamicWithDistanceCreatedByUserState state,
  ) =>
      state.createdActivityDynamicWithDistanceList.isEmpty;
}
