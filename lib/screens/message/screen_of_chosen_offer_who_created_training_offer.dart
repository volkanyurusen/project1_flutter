import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import 'bodies/zbodies.dart';

class ScreenOfChosenOfferWhoCreatedTrainingOffer extends StatelessWidget {
  static const String routeName =
      'screen_of_chosen_offer_who_created_training_offer';

  const ScreenOfChosenOfferWhoCreatedTrainingOffer({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    // final ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
    //     chosenResponseAmongThoseWhoRespondedTrainingOfferCubit = context
    //         .read<ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit>();

    return
        //
        // WillPopScope(
        //   onWillPop: () async {
        //     Navigator.of(context).pop();
        //     _unchoseChosenCoach(
        //         chosenResponseAmongThoseWhoRespondedTrainingOfferCubit);
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
                ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
                ChosenResponseAmongThoseWhoRespondedTrainingOfferState>(
            builder: (context, chosenState) => AppBarHero(
                  tag: _choiceTrainingHeroTag(chosenState),
                  image: _displayChoiceTrainingImage(chosenState),
                )),
      ));

  String _choiceTrainingHeroTag(
          ChosenResponseAmongThoseWhoRespondedTrainingOfferState chosenState) =>
      chosenState.chosenTrainingOfferResponseDynamicWithDistanceList.last
          .trainingOfferResponseId
          .toString() +
      chosenState.chosenTrainingOfferResponseDynamicWithDistanceList.last
          .trainingOfferDynamic.coachDynamic.userDynamic.username;

  NetworkImage _displayChoiceTrainingImage(
          ChosenResponseAmongThoseWhoRespondedTrainingOfferState chosenState) =>
      NetworkImage(chosenState
          .chosenTrainingOfferResponseDynamicWithDistanceList
          .last
          .trainingOfferDynamic
          .coachDynamic
          .userDynamic
          .picUrl);

  /// REMOVE ATTENDEE FROM CHOSEN ATTENDEE LIST ========================================================================
  //
  // void _unchoseChosenTrainee(
  //   ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
  //       chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
  // ) =>
  //     chosenResponseAmongThoseWhoRespondedTrainingOfferCubit.pressBackButton(
  //         chosenResponseAmongThoseWhoRespondedTrainingOfferCubit
  //             .state.chosenTrainingOfferResponseDynamicWithDistanceList.last);
}
