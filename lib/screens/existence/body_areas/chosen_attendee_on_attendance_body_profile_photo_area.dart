import 'package:flutter/material.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenAttendeeOnAttendanceBodyProfilePhotoArea extends StatelessWidget {
  final ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
      chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit;

  const ChosenAttendeeOnAttendanceBodyProfilePhotoArea({
    required this.chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _displayProfilePhotoWithHero(
            chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit),
        const CustomAppSizedBox(),
      ],
    );
  }

  /// DISPLAY ==========================================================================================================
  /// Profile Photo ----------------------------------------------------------------------------------------------------
  /// These codes bring the user's profile photo on the top of the screen via
  /// [chosenActivityDynamicsForAttendanceCubit]. This cubit keeps the selected user information which is provided on
  /// the previous page [ResultScreen]. [_displayProfilePhotoWithHero] method returns the [Hero] widget, to bring the
  /// profile photo with a nice animation.
  UserPageHero _displayProfilePhotoWithHero(
          ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
              chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit) =>
      UserPageHero(
          tag: heroTag(chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit),
          url: _diplayPhoto(
              chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit));

  String _diplayPhoto(
          ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
              chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit) =>
      chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit.state
          .chosenConsistedActivityDynamicWithDistanceList.last.attendee.picUrl;

  /// METHODS ==========================================================================================================
  /// Hero Tag ---------------------------------------------------------------------------------------------------------
  String heroTag(
          ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
              chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit) =>
      chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
          .state
          .chosenConsistedActivityDynamicWithDistanceList
          .last
          .consistedActivityId
          .toString() +
      chosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
          .state
          .chosenConsistedActivityDynamicWithDistanceList
          .last
          .attendee
          .username;
}
