import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/models/models_dynamics.dart';

class AppFunctions {
  // This function created for api requests
  String toStringForApiRequest(
    List<dynamic> requestList,
  ) =>
      requestList.asMap().values.join("','").toString();

  String setWithoutUnderscore(
    String textWithUnderScore,
  ) =>
      textWithUnderScore.split('_').join(' ');

  double determineSpace(int index) => index == 0 ? 5 : 18;

  String convertApiRequestToConvenientString(
    List<dynamic> requestList,
  ) =>
      requestList
          .toString()
          .replaceAll('[', '')
          .replaceAll(']', '')
          .split(',')
          .join("','");

  String convertListToConvenientIntApiList(
    List<dynamic> requestList,
  ) =>
      requestList
          .toString()
          .replaceAll('[', '')
          .replaceAll(']', '')
          .replaceAll(' ', '');

  String bringActivityDateForState(
    DateFormat dateFormat,
    DateTime dateTime,
  ) =>
      dateFormat.format(dateTime).toString();

  String bringActivityDateWithDurationForState(
    DateFormat dateFormat,
    DateTime dateTime,
    Duration duration,
  ) =>
      dateFormat.format(dateTime.add(duration)).toString();

  String calculateLikeNumberOfSpecificUser(
    List<UserLikingDynamic?> allLikeDetailOfUser,
    int userId,
  ) =>
      allLikeDetailOfUser
          .map((e) => e!.likedUser)
          .toList()
          .where((element) => element.uId == userId)
          .toList()
          .length
          .toString();

  String calculateFollowerNumberOfSpecificUser(
    List<UserFollowingDynamic> allFollowDetailOfUser,
    int userId,
  ) =>
      allFollowDetailOfUser
          .map((e) => e.requestedUser)
          .toList()
          .where((element) => element.uId == userId)
          .toList()
          .length
          .toString();

  String calculateFollowingNumberOfSpecificUser(
    List<UserFollowingDynamic> allFollowDetailOfUser,
    int userId,
  ) =>
      allFollowDetailOfUser
          .map((e) => e.requester)
          .toList()
          .where((element) => element.uId == userId)
          .toList()
          .length
          .toString();

  String calculateNumberOfActivityCreatedByIndividualUser(
    List<ConsistedActivityDynamicWithDistance>
        allActivityDetailsByIndividualUser,
    int? selectedUser,
  ) =>
      allActivityDetailsByIndividualUser
          .where((element) =>
              element.createdActivityDynamic.host.uId == selectedUser!)
          .map((e) => e.createdActivityDynamic.host)
          .toList()
          .length
          .toString();

  String calculateNumberOfActivityAttendedByIndividualUser(
    List<ConsistedActivityDynamicWithDistance>
        allActivityDetailsByIndividualUser,
    int? selectedUser,
  ) =>
      allActivityDetailsByIndividualUser
          .where((element) => element.attendee.uId == selectedUser)
          .map((e) => e.attendee)
          .toList()
          .length
          .toString();

  var correctNumberFormat = NumberFormat('#,##0');

  int defineElementNumberWillBeDisplayed(
    List<ConsistedActivityDynamicWithDistance>
        allConsistedActivityDynamicByIndividualUser,

    /// THIS LINE COULD CREATE AN ISSUE, I ADDED THE MODEL TYPE ConsistedActivityDynamic, it could be DIFFERENT.
    int elementNumberBeingPreferredToBeDisplayed,
  ) =>
      allConsistedActivityDynamicByIndividualUser.reversed.length >
              elementNumberBeingPreferredToBeDisplayed
          ? elementNumberBeingPreferredToBeDisplayed
          : allConsistedActivityDynamicByIndividualUser.reversed
              .toList()
              .length;

  List<ConsistedActivityDynamicWithDistance> reversedListAndReturnItsSublist(
    List<ConsistedActivityDynamicWithDistance>
        allConsistedActivityDynamicWithDistanceByIndividualUser,
    int start,
    int end,
  ) =>
      allConsistedActivityDynamicWithDistanceByIndividualUser.reversed
          .toList()
          .sublist(start, end);

  DateTime bringBeginningWeekDate(DateTime date) {
    DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

    return getDate(date.subtract(Duration(days: date.weekday - 1)));
  }

  String bringBeginningDateOfWeek(DateTime date) {
    DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

    return '${AppDateFormat().monthAndDayOnly.format(getDate(date.subtract(Duration(days: date.weekday - 1))))} - ${AppDateFormat().monthAndDayOnly.format(getDate(date.add(Duration(days: DateTime.daysPerWeek - date.weekday))))}';
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  String showDayDifference(DateTime from) {
    DateTime to = DateTime.now();
    return daysBetween(from, to) < -1
        ? '${daysBetween(from, to).abs()} ${AppListConstants().dayDefinition[4]}'
        : daysBetween(from, to) == -1
            ? AppListConstants().dayDefinition[3]
            : daysBetween(from, to) == 0
                ? AppListConstants().dayDefinition[2]
                : daysBetween(from, to) == 1
                    ? AppListConstants().dayDefinition[1]
                    : '${daysBetween(from, to)} ${AppListConstants().dayDefinition[0]}';
  }

  int findMessageNumberOnActivityConversationBasis(
          List<MessageDynamic> messageList,
          List<ActivityConversationDynamic> activityConversationList,
          int index) =>
      messageList
          .map((e) => e.activityConversationDynamic.activityConversationId)
          .toList()
          .where((element) =>
              element ==
              activityConversationList.elementAt(index).activityConversationId)
          .toList()
          .length;

  String showString(String label, {int lenght = 15}) => label.length < lenght
      ? label.substring(0, label.length)
      : '${label.substring(0, lenght)}...';

  TextStyle? textThemeHeadline5(context) =>
      Theme.of(context).textTheme.headlineSmall;

  String determineAgeClassification(int birthyear) =>
      (DateTime.now().year.toInt() - birthyear) > 30
          ? 'Experienced'
          : 'Energetic';

  double roundDouble(double value, int places) {
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  bool areListsEqual(var firstList, var secondList) {
    // check if both are lists
    if (!(firstList is List && secondList is List)
        // check if both have same length
        ||
        firstList.length != secondList.length) {
      return false;
    }
    firstList.sort();
    secondList.sort();

    // check if elements are equal
    for (int i = 0; i < firstList.length; i++) {
      if (firstList[i] != secondList[i]) {
        return false;
      }
    }

    return true;
  }

  List<String?> findDifferenceItemBetweenTwoList(
      var firstList, var secondList) {
    List<String?> listOfDifferences =
        firstList.toSet().difference(secondList.toSet()).toList();

    return listOfDifferences;
  }
}
