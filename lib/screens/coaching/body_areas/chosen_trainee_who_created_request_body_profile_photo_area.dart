import 'package:flutter/material.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenTraineeWhoCreatedRequestBodyProfilePhotoArea
    extends StatelessWidget {
  final ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit
      chosenRequestAmongThoseWhoCreatedTrainingRequestCubit;

  const ChosenTraineeWhoCreatedRequestBodyProfilePhotoArea({
    required this.chosenRequestAmongThoseWhoCreatedTrainingRequestCubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _displayProfilePhotoWithHero(
            chosenRequestAmongThoseWhoCreatedTrainingRequestCubit),
        const CustomAppSizedBox(),
      ],
    );
  }

  /// DISPLAY ==========================================================================================================
  /// Profile Photo ----------------------------------------------------------------------------------------------------
  /// These codes bring the user's profile photo on the top of the screen via
  /// [chosenRequestAmongThoseWhoCreatedTrainingRequestCubit]. This cubit keeps the selected user information which is
  /// provided on the previous page [ResultScreen]. [_displayProfilePhotoWithHero] method returns the [Hero] widget, to
  /// bring the profile photo with a nice animation.
  UserPageHero _displayProfilePhotoWithHero(
          ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit
              chosenRequestAmongThoseWhoCreatedTrainingRequestCubit) =>
      UserPageHero(
          tag: heroTag(chosenRequestAmongThoseWhoCreatedTrainingRequestCubit),
          url: _diplayPhoto(
              chosenRequestAmongThoseWhoCreatedTrainingRequestCubit));

  String _diplayPhoto(
          ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit
              chosenRequestAmongThoseWhoCreatedTrainingRequestCubit) =>
      chosenRequestAmongThoseWhoCreatedTrainingRequestCubit
          .state
          .chosenTrainingRequestDynamicWithDistanceList
          .last
          .trainingRequester
          .picUrl;

  /// METHODS ==========================================================================================================
  /// Hero Tag ---------------------------------------------------------------------------------------------------------
  String heroTag(
          ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit
              chosenRequestAmongThoseWhoCreatedTrainingRequestCubit) =>
      '${chosenRequestAmongThoseWhoCreatedTrainingRequestCubit.state.chosenTrainingRequestDynamicWithDistanceList.last.trainingRequestId}'
      '${chosenRequestAmongThoseWhoCreatedTrainingRequestCubit.state.chosenTrainingRequestDynamicWithDistanceList.last.trainingRequester.username}';
}

// import 'package:flutter/material.dart';

// class ChosenTraineeWhoCreatedRequestBodyProfilePhotoArea extends StatelessWidget {
//   const ChosenTraineeWhoCreatedRequestBodyProfilePhotoArea({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
