import 'package:flutter/material.dart';
import 'package:my_project/logic/cubits/cubits.dart';

import '../../../widgets/widget.dart';

class ChosenTraineeBodyProfilePhotoArea extends StatelessWidget {
  final ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
      chosenResponseAmongThoseWhoRespondedTrainingOfferCubit;

  const ChosenTraineeBodyProfilePhotoArea({
    required this.chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _displayProfilePhotoWithHero(
            chosenResponseAmongThoseWhoRespondedTrainingOfferCubit),
        const CustomAppSizedBox(),
      ],
    );
  }

  /// DISPLAY ==========================================================================================================
  /// Profile Photo ----------------------------------------------------------------------------------------------------
  /// These codes bring the user's profile photo on the top of the screen via
  /// [chosenResponseAmongThoseWhoRespondedTrainingOfferCubit]. This cubit keeps the selected user information which is
  /// provided on the previous page [ResultScreen]. [_displayProfilePhotoWithHero] method returns the [Hero] widget, to
  /// bring the profile photo with a nice animation.
  UserPageHero _displayProfilePhotoWithHero(
          ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
              chosenResponseAmongThoseWhoRespondedTrainingOfferCubit) =>
      UserPageHero(
          tag: heroTag(chosenResponseAmongThoseWhoRespondedTrainingOfferCubit),
          url: _diplayPhoto(
              chosenResponseAmongThoseWhoRespondedTrainingOfferCubit));

  String _diplayPhoto(
          ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
              chosenResponseAmongThoseWhoRespondedTrainingOfferCubit) =>
      chosenResponseAmongThoseWhoRespondedTrainingOfferCubit
          .state
          .chosenTrainingOfferResponseDynamicWithDistanceList
          .last
          .traineeDynamic
          .picUrl;

  /// METHODS ==========================================================================================================
  /// Hero Tag ---------------------------------------------------------------------------------------------------------
  String heroTag(
          ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
              chosenResponseAmongThoseWhoRespondedTrainingOfferCubit) =>
      '${chosenResponseAmongThoseWhoRespondedTrainingOfferCubit.state.chosenTrainingOfferResponseDynamicWithDistanceList.last..trainingOfferResponseId} ${chosenResponseAmongThoseWhoRespondedTrainingOfferCubit.state.chosenTrainingOfferResponseDynamicWithDistanceList.last.requestDate}';
}

// import 'package:flutter/material.dart';

// class ChosenTraineeBodyProfilePhotoArea extends StatelessWidget {
//   const ChosenTraineeBodyProfilePhotoArea({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
