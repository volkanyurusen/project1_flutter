import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import 'bodies/zbodies.dart';

class ScreenOfChosenResponseWhoRespondedTrainingRequest
    extends StatelessWidget {
  static const String routeName =
      'screen_of_chosen_trainee_who_responded_training_request';

  const ScreenOfChosenResponseWhoRespondedTrainingRequest({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    // final ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
    //     chosenResponseAmongThoseWhoRespondedTrainingRequestCubit = context
    //         .read<ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit>();

    return
        //
        // WillPopScope(
        //   onWillPop: () async {
        //     Navigator.of(context).pop();
        //     _unchoseChosenTrainee(
        //         chosenResponseAmongThoseWhoRespondedTrainingRequestCubit);
        //     return Future(() => true);
        //   },
        //   child:
        Scaffold(
      appBar: _createCoachPhotoOnTop(context),
      body: const ChosenResponseWhoRespondedTrainingRequestBody(),
    );
    // );
  }

  /// TRAINING PICTURE =================================================================================================
  _createCoachPhotoOnTop(BuildContext context) => PreferredSizeForPicture(
      context: context,
      child: AppBar(
        flexibleSpace: BlocBuilder<
                ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
                ChosenResponseAmongThoseWhoRespondedTrainingRequestState>(
            builder: (context, chosenState) => AppBarHero(
                  tag: _choiceTrainingHeroTag(chosenState),
                  image: _displayChoiceTrainingImage(chosenState),
                )),
      ));

  String _choiceTrainingHeroTag(
          ChosenResponseAmongThoseWhoRespondedTrainingRequestState
              chosenState) =>
      chosenState.chosenTrainingRequestResponseDynamicWithDistanceList.last
          .trainingRequestResponseId
          .toString() +
      chosenState.chosenTrainingRequestResponseDynamicWithDistanceList.last
          .coachDynamic.userDynamic.username;

  NetworkImage _displayChoiceTrainingImage(
          ChosenResponseAmongThoseWhoRespondedTrainingRequestState
              chosenState) =>
      NetworkImage(chosenState
          .chosenTrainingRequestResponseDynamicWithDistanceList
          .last
          .coachDynamic
          .userDynamic
          .picUrl);

  /// REMOVE ATTENDEE FROM CHOSEN ATTENDEE LIST ========================================================================
  //
  // void _unchoseChosenTrainee(
  //   ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
  //       chosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
  // ) =>
  //     chosenResponseAmongThoseWhoRespondedTrainingRequestCubit.pressBackButton(
  //         chosenResponseAmongThoseWhoRespondedTrainingRequestCubit
  //             .state.chosenTrainingRequestResponseDynamicWithDistanceList.last);
}
