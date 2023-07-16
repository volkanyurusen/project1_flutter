import 'package:flutter/material.dart';
import 'package:my_project/logic/cubits/cubits.dart';

import '../../../widgets/widget.dart';

class ChosenAttendeeOnCreationBodyProfilePhotoArea extends StatelessWidget {
  final ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
      chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit;

  const ChosenAttendeeOnCreationBodyProfilePhotoArea({
    required this.chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _displayProfilePhotoWithHero(
            chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit),
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
          ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
              chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit) =>
      UserPageHero(
          tag: heroTag(chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit),
          url: _diplayPhoto(
              chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit));

  String _diplayPhoto(
          ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
              chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit) =>
      chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit.state
          .chosenConsistedActivityDynamicWithDistanceList.last.attendee.picUrl;

  /// METHODS ==========================================================================================================
  /// Hero Tag ---------------------------------------------------------------------------------------------------------
  String heroTag(
          ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
              chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit) =>
      '${chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit.state.chosenConsistedActivityDynamicWithDistanceList.last.consistedActivityId} ${chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit.state.chosenConsistedActivityDynamicWithDistanceList.last.attendee.username}'
      '';
}
