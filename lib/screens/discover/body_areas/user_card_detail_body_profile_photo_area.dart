import 'package:flutter/material.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class UserCardDetailBodyProfilePhotoArea extends StatelessWidget {
  final ChosenResultOfPreferredActivityDynamicCubit
      chosenResultOfPreferredActivityDynamicCubit;

  const UserCardDetailBodyProfilePhotoArea({
    required this.chosenResultOfPreferredActivityDynamicCubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _displayProfilePhotoWithHero(
            chosenResultOfPreferredActivityDynamicCubit),
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
          ChosenResultOfPreferredActivityDynamicCubit
              chosenResultOfPreferredActivityDynamicCubit) =>
      UserPageHero(
          tag: heroTag(chosenResultOfPreferredActivityDynamicCubit),
          url: _diplayPhoto(chosenResultOfPreferredActivityDynamicCubit));

  String _diplayPhoto(
          ChosenResultOfPreferredActivityDynamicCubit
              chosenResultOfPreferredActivityDynamicCubit) =>
      chosenResultOfPreferredActivityDynamicCubit
          .state.chosenCreatedActivityDynamicWithDistanceList.last.picUrl;

  /// METHODS ==========================================================================================================
  /// Hero Tag ---------------------------------------------------------------------------------------------------------
  String heroTag(
          ChosenResultOfPreferredActivityDynamicCubit
              chosenResultOfPreferredActivityDynamicCubit) =>
      '${chosenResultOfPreferredActivityDynamicCubit.state.chosenCreatedActivityDynamicWithDistanceList.last.createdActivityId}';
}
