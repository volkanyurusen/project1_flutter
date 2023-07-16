import 'package:flutter/material.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class HostBodyProfilePhotoArea extends StatelessWidget {
  final ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit;

  const HostBodyProfilePhotoArea({
    required this.chosenHostWhoCreatedActivityCubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _displayProfilePhotoWithHero(chosenHostWhoCreatedActivityCubit),
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
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit,
  ) =>
      UserPageHero(
          tag: _heroTag(chosenHostWhoCreatedActivityCubit),
          url: _displayPhoto(chosenHostWhoCreatedActivityCubit));

  String _displayPhoto(
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit,
  ) =>
      chosenHostWhoCreatedActivityCubit.state.chosenConsistedActivityDynamicWithDistance.last
          .createdActivityDynamic.host.picUrl;

  /// METHOD ===========================================================================================================
  /// Hero Tag ---------------------------------------------------------------------------------------------------------
  String _heroTag(
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit,
  ) =>
      chosenHostWhoCreatedActivityCubit.state.chosenConsistedActivityDynamicWithDistance.last
          .createdActivityDynamic.createdActivityId
          .toString() +
      chosenHostWhoCreatedActivityCubit.state.chosenConsistedActivityDynamicWithDistance.last
          .createdActivityDynamic.host.username;
}
