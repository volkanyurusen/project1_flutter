import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

import 'bodies/zbodies.dart';

class ScreenOfChosenResponseWhoRespondedTrainingOffer extends StatelessWidget {
  static const String routeName =
      'screen_of_chosen_trainee_who_responded_training_offer';

  const ScreenOfChosenResponseWhoRespondedTrainingOffer({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    // ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
    //     chosenResponseAmongThoseWhoRespondedTrainingOfferCubit =
    //     context.read<ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit>();

    return
        //
        // WillPopScope(
        //   onWillPop: () async {
        //     Navigator.of(context).pop();
        //     _unchoseChosenTrainee(
        //         chosenResponseAmongThoseWhoRespondedTrainingOfferCubit);
        //     return Future(() => true);
        //   },
        //   child:
        const Scaffold(
      appBar: CustomAppBar(),
      body: ChosenResponseWhoRespondedTrainingOfferBody(),
    );
    // );
  }

  /// REMOVE ATTENDEE FROM CHOSEN ATTENDEE LIST ========================================================================
  //
  //void _unchoseChosenTrainee(
  //   ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
  //       chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
  // ) =>
  //     chosenResponseAmongThoseWhoRespondedTrainingOfferCubit.pressBackButton(
  //         chosenResponseAmongThoseWhoRespondedTrainingOfferCubit
  //             .state.chosenTrainingOfferResponseDynamicWithDistanceList.last);
}
